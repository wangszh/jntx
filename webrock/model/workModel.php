<?php
class workClassModel extends Model
{
	public function updatecont($sid)
	{
		$rs	= $this->getone($sid);
		if(!$rs)return;
		
		$inner['title'] 	= $rs['title'];
		$inner['type'] 		= $rs['type'];
		$inner['grade'] 	= $rs['grade'];
		$inner['distid'] 	= $rs['distid'];
		$inner['dist'] 		= $rs['dist'];
		$inner['explain'] 	= $rs['explain'];
		$inner['baoname'] 	= $rs['baoname'];
		$inner['baoid'] 	= $rs['baoid'];
		$inner['bgtime'] 	= $rs['bgtime'];
		$inner['istx'] 		= $rs['istx'];
		$this->update($inner, "`mid`='$sid'");
	}
	
	
	public function addday($dt, $uid='', $aid='', $btype='')
	{
		$rate	= c('rate', true);
		$cdate	= c('date', true);
		$swhe	= '';
		if($uid != ''){
			$swhe = " and instr(concat(',', distid, ','), ',$uid,')>0";
		}
		$wherea = "and `mid`=0 and `status`=1 $swhe";
		if($aid != '')$wherea.=" and `id`='$aid'";
		
		$rows	= $rate->result('work', $dt, $wherea);
		
		$msid	= '0';
		$ssid	= '0';
		$rowsa	= array();	
		foreach($rows as $k=>$rs){
			$inner				= array(
				'title'	=> $rs['title']
			);
			$inner['mid'] 		= $rs['mid'];
			$inner['type'] 		= $rs['type'];
			$inner['grade'] 	= $rs['grade'];
			$inner['distid'] 	= $rs['distid'];
			$inner['dist'] 		= $rs['dist'];
			$inner['explain'] 	= $rs['explain'];
			$inner['baoname'] 	= $rs['baoname'];
			$inner['baoid'] 	= $rs['baoid'];
			$inner['bgtime'] 	= $rs['bgtime'];
			$inner['startdt'] 	= $rs['runtime'];
			$inner['istx'] 		= $rs['istx'];
			$inner['dt'] 		= $dt;
			$inner['optdt'] 	= $this->rock->now;
			$inner['optid'] 	= $rs['optid'];
			$inner['optname'] 	= $rs['optname'];
			$inner['status'] 	= '0';
			$inner['state'] 	= '待执行';
			
			$enddt				= $this->getent($inner['startdt'], $rs, $cdate);
			$inner['enddt'] 	= $enddt;
			$rowsa[]	= $inner;
			
			if($btype == ''){
				$where	= "`mid`='".$rs['mid']."' and `startdt`='".$inner['startdt']."'";
				$sid	= (int)$this->getmou('id', $where);
				if($sid == 0)$where = '';
				$this->record($inner, $where);
				if($sid == 0)$sid = $this->db->insert_id();
				
				$ssid.=','.$sid.'';
				$msid.=','.$rs['mid'].'';
			}
		}  
		if($btype == '')$this->delete("`mid` in($msid) and id not in($ssid)  and `dt`='$dt' $swhe");
		return $rowsa;
	}
	
	private function getent($dts, $rs, $cdate)
	{
		$sj		= '';
		$wcsj 	= (int)$rs['wcsj'];
		if($wcsj == 0)return '';
		$wclx 	= $rs['wclx'];
		$wctime = $rs['wctime'];
		$lxs  	= '';
		if($wclx == '小时'){
			$sj = $cdate->adddate($dts, 'H', $wcsj);
		}
		if($wclx == '工作日'){
			$wclx = '天';
		}
		if($wclx == '天' || $wclx == '周'){
			if($wclx == '周')$wcsj = $wcsj * 7;
			if($this->rock->isempt($wctime)){
				$sj = $cdate->adddate($dts, 'd', $wcsj);
			}else{
				$sj = $cdate->adddate($dts, 'd', $wcsj, 'Y-m-d');
				$sj	= $sj.' '.$wctime;
			}
		}
		return $sj;
	}
	public function delwork($id)
	{
		$where = "`mid` in($id)";
		$this->db->delete('[Q]todo', "`table` in('work','workbao') and `mid` in(select `id` from `[Q]work` where $where)");
		$this->delete("( $where) or (`id` in($id) ) ");
	}
	
	public function sendbaogaoss($id, $state, $sm='', $usetime=0,$fileid='')
	{
		$usetime= floatval($usetime);
		$ss1 	= '用时:'.$usetime.'小时';
		if($usetime<=0)$ss1='';
		if($sm!=''){
			if($ss1!='')$sm .= ','.$ss1.'';
		}else{
			$sm = $ss1;
		}
		$this->update("`state`='$state'", $id);
		$flow 	= f('work');
		$flow->initrecord($id);
		$flow->addlogs($state,'任务处理', $sm, $fileid);

		$suid 	= $flow->rs['optid'];
		if(!$this->isempt($flow->rs['baoid']))$suid.=','.$flow->rs['baoid'].'';
		$zntx	= ''.$this->adminname.'提交了[{title}]的任务报告，状态[{state}]';
		$description		= "报告人：{$this->adminname}\n状态：{state}\n任务类型：{type}\n说明：$sm";
		$wxtx = array(
			'description' 	=> $description,
			'title'			=> '[{type}]{title}:任务报告'
		);
		$flow->sendtodo($suid, array(
			'wxtx' => $wxtx,
			'zntx'	=> $zntx
		));
	}
	
	public function sendtodo($id, $state, $sm='')
	{
		$flow 	= f('work');
		$flow->initrecord($id);
		$flow->addlogs($state, '任务处理', $sm);
		$description	= "类型：{type}\n等级：{grade}\n分配给：{dist}\n创建人：{optname}";
		$xmid 			= (int)$flow->rs['projectid'];
		if($xmid>0){
			$description.="\n所属项目：{project}";
		}
		$description.="\n开始时间：{startdt}";
		$wxtx = array(
			'description' 	=> $description,
			'title'			=> '[{type}]{title}'
		);
		$zntx = '[{optname}]分配一条[{type}]工作任务:{title}';
		$flow->sendtodo($flow->rs['distid'], array(
			'wxtx' => $wxtx,
			'zntx'	=> $zntx
		));
	}
	
	public function addworks($mid, $state, $sm)
	{
		$arr = array(
			'mid' 	=> $mid,
			'table' => 'work',
			'state' => $state,
			'explain' => $sm,
			'optdt' => $this->rock->now,
			'optid' => $this->adminid,
			'optname' => $this->adminname
		);
		$this->db->record('[Q]workbg', $arr);
	}
	
	public function getwwctotal($uid)
	{
		$to = $this->getwwcwork($uid,1);
		return $to;
	}
	
	public function getwwcwork($uid, $tlx=0)
	{
		$dt 	= $this->rock->now;
		$where 	= " id>0 and startdt < '$dt' and (`state`='待执行' or `state` like  '执行中%') and ".$this->rock->dbinstr('distid',$uid);
		if($tlx == 0){
			$rows = $this->getall($where." order by `startdt`",'`type`,`title`,`state`,`startdt`,`grade`');
		}else if($tlx == 1){
			$rows = $this->rows($where);
		}else{
			$rows = $where;
		}
		return $rows;
	}
}