<?php
class reimClassModel extends Model
{
	private $groupname = '';
	
	public function initModel()
	{
		$this->settable('im_mess');
	}
	
	
	
	private function getgroupid($gname)
	{
		$agesta = explode(',', $gname);
		$name 	= $agesta[0];
		$sid 	= (int)$this->db->getmou('[Q]im_group','id', "`name`='$name' and `type`=2");
		if($sid==0 && count($agesta)>1)$sid = $this->getgroupid($agesta[1]);
		$this->groupname = $name;
		return $sid;
	}
		
	/**
	*	REIM推送的
	*/
	public function sendsystem($sendid, $receid, $gname, $cont, $table='',$mid='', $url='')
	{
		$gid	= $this->getgroupid($gname);
		$gname	= $this->groupname;
		if($gid==0)return false;
		
		if($this->isempt($receid))return 'not receuid';
		$receids = $receid;
		
		$wheres	 = " and `id` in($receid)";
		if($receid=='all')$wheres='';
		$allsid 	= '';
		$recrarr 	= $this->db->getall("select id from [Q]admin where `status`=1 and `state`<>5 $wheres");
		foreach($recrarr as $k=>$rs){
			$allsid.=','.$rs['id'].'';
		}
		$messid		= 0;
		if($allsid != ''){
			$allsid = substr($allsid, 1);
			$this->insert(array(
				'type'	=> 'agent',
				'optdt'	=> $this->rock->now,
				'zt'	=> 0,
				'cont'	=> $this->rock->jm->base64encode($cont),
				'sendid'=> $sendid,
				'receid'=> $gid,
				'optid'	=> $sendid,
				'receuid' => $allsid,
				'table'	=> $table,
				'mid'	=> $mid,
				'url'	=> $url
			));
			$messid	= $this->db->insert_id();
			$this->db->insert('[Q]im_messzt','`mid`,`uid`,`gid`','select '.$messid.',id,'.$gid.' from `[Q]admin` where id in('.$allsid.') and `status`=1 and `state`<>5 ', true);
		}
		$reimsd= m('reims');
		$resid = $receids;
		if($resid!='all')$resid = m('admin')->getonline($resid);
		if($resid!='' && $messid>0)$reimsd->sendpush($sendid, $resid, array(
			'agent'		=> $gname,
			'optdt'		=> $this->rock->now,
			'type'		=> 'agent',
			'messid'	=> $messid,
			'agentid'	=> $gid,
			'cont'		=> $this->rock->jm->base64encode($cont),
			'table'		=> $table,
			'mid'		=> $mid,
			'url'		=> $url
		));
		if($messid>0)$reimsd->addhistory('agent', $gid, $allsid);
		return true;
	}
	
	public function sendstart()
	{
	}

	//创建发送URL
	public function createurl($act, $mid, $arr=array())
	{
		$cans 	= array(
			'm' 	=> 'view',
			'd' 	=> 'taskrun',
			'a' 	=> $act,
			'uid' 	=> $this->adminid,
			'id' 	=> $mid
		);
		foreach($arr as $k=>$v)$cans[$k]=$v;
		$token	= $this->rock->jm->strrocktoken($cans);
		$url 	= '?rocktoken='.$token.'';
		return $url;
	}	
	
	//获取REIM未读的
	public function getwdarr($mid=0)
	{
		$rows 	= array();
		if($mid==0)$mid	= $this->adminid;
		$whes	= $this->rock->dbinstr('receuid', $mid);
		$arr 	= $this->getall("`zt`=0 and receid='$mid' and `type`='user' group by `sendid`", "`sendid`,count(1) as stotal,max(optdt) as optdts");
		foreach($arr as $k=>$rs){
			$uid 	= $rs['sendid'];
			$urs 	= $this->db->getone('[Q]admin',"`id`='$uid'",'`name`,`face`');
			if($urs){
				$rows[] = array(
					'type' 	=> 'user',
					'id'	=> $uid,
					'stotal'=> $rs['stotal'],
					'optdt'	=> $rs['optdts'],
					'name'	=> $urs['name'],
					'face'	=> $this->getface($urs['face'])
				);
			}
		}
		
		// 讨论组 群
		$groupa	= $this->db->getarr('[Q]im_group','1=1','`name`,`face`,`type`');
		$gid 	= '0';
		foreach($groupa as $_gid=>$kvs)$gid.=','.$_gid.'';
		$arr 	= $this->getall("`type`='group' and `receid` in($gid) and $whes and id in(select mid from [Q]im_messzt where uid='$mid') group by `receid`", "`receid`,count(1) as stotal,max(optdt) as optdts");
		$typea	= array('group','taolun');
		foreach($arr as $k=>$rs){
			$grs	= $groupa[$rs['receid']];
			$rows[] = array(
				'type' 	=> $typea[$grs['type']],
				'id'	=> $rs['receid'],
				'stotal'=> $rs['stotal'],
				'optdt'	=> $rs['optdts'],
				'name'	=> $grs['name'],
				'face'	=> $this->rock->repempt($grs['face'])
			);
		}
		
		//应用的信息	
		$arr 	= $this->getall("`type`='agent' and `receid` in($gid) and $whes and id in(select mid from [Q]im_messzt where uid='$mid') group by `receid`", "`receid`,count(1) as stotal,max(optdt) as optdts");
		foreach($arr as $k=>$rs){
			$grs	= $groupa[$rs['receid']];
			$rows[] = array(
				'type' 	=> 'agent',
				'id'	=> $rs['receid'],
				'stotal'=> $rs['stotal'],
				'optdt'	=> $rs['optdts'],
				'name'	=> $grs['name'],
				'face'	=> $this->getface($grs['face'])
			);
		}
		
		return $rows;
	}
	
	public function getweitotal($uid, $type, $sid=0, $blx=0)
	{
		$whes	= $this->rock->dbinstr('receuid', $uid);
		$where  = "`type`='$type' and `receid` ='$sid' and $whes and id in(select mid from [Q]im_messzt where uid='$uid')";
		if($type == 'user'){
			$where  = "`zt`=0 and `receid`='$uid' and `type`='user' and $whes";
		}
		if($blx==1)return $where;
		$to 	= $this->rows($where);
		return $to;
	}
	
	public function getgroup($uid, $facarr=array('','',''))
	{
		$ids	= '0';
		$idrsa	= m('im_groupuser')->getall("uid='$uid'",'gid');
		foreach($idrsa as $k=>$rs){
			$ids.=','.$rs['gid'];
		}
		$facarr[0] = 'images/group.png';
		$facarr[1] = 'images/taolun.png';
		$rows 	= m('im_group')->getall("`id`>0 and ((`type`=2) or (`type` in(0,1) and `id` in($ids) ) ) order by `sort` ",'`type`,`name`,`id`,`face`,`sort`');
		foreach($rows as $k=>$rs){
			$rows[$k]['face'] = $this->getface($rs['face'], $facarr[$rs['type']]);
		}
		return $rows;
	}
	
	private function getface($face, $mr='')
	{
		if($mr=='')$mr 	= 'images/noface.jpg';
		if(substr($face,0,4)!='http' && !$this->isempt($face))$face = URL.''.$face.'';
		$face 			= $this->rock->repempt($face, $mr);
		return $face;
	}
	
	/**
		设置已读
	*/
	public function setyd($ids, $receid)
	{
		$this->update("`zt`=1", "`id` in($ids) and receid='$receid' and `type` in ('user')");
		m('im_messzt')->delete("uid='$receid' and `mid` in($ids)");
	}
	
	/**
	*	获取人员
	*/
	public $myrs	= array();
	public function getuser($where='', $uid=0)
	{
		$dbs = m('admin');
		if($uid==0)$uid = $this->adminid;
		$urs = $dbs->getall("`status`=1 and `state`<>5 $where order by `name` asc",'`id`,`name`,`deptid`,`deptname`,`ranking`,`face`');
		$onar= $dbs->getonlines('reim');
		foreach($urs as $k=>$rs){	
			$imonline 	= 0;
			if(in_array($rs['id'], $onar))$imonline=1;
			$face 		= $rs['face'];
			if(!$this->isempt($face))$face = URL.''.$face.'';
			$urs[$k]['imonline'] = $imonline;
			$urs[$k]['face'] 	 = $this->rock->repempt($face, 'images/im/user100.png');
			if($rs['id']==$uid){
				$this->myrs = $urs[$k];
				$urs[$k]['imonline']=1;
			}
		}
		return $urs;
	}
	
	/**
	*	获取应用
	*/
	public function getagent($uid=0)
	{
		if($uid==0)$uid = $this->adminid;
		$where	= m('admin')->getjoinstr('receid', $this->adminid);
		$rows 	= $this->db->getrows('[Q]im_group',"`valid`=1 and `type`=2 $where",'`id`,`name`,`url`,`face`,`num`,`width`,`height`');
		foreach($rows as $k=>$rs){
			$url  = $rs['url'];
			if(substr($url,0,4)!='http'&&!$this->isempt($url))$url = URL.''.$url.'';
			$rows[$k]['face'] 	= $this->getface($rs['face']);
			$rows[$k]['url'] 	= $url;
		}
		return $rows;
	}
	
	/**
	*	获取历史记录
	*/
	public function gethistory($uid=0)
	{
		if($uid==0)$uid = $this->adminid;
		$whes	= $this->rock->dbinstr('receuid', $uid);
		$rows 	= $this->db->getall("select `receid`,`type`,MAX(`optdt`)optdt,cont from `[Q]im_mess` where $whes GROUP BY `receid`,`type` order by optdt desc limit 50");
		$srows	= $this->db->getall("select `sendid`,MAX(`optdt`)optdt,cont from `[Q]im_mess` where `receid`='$uid' and `type`='user' GROUP BY `sendid` order by optdt desc ");
		foreach($srows as $k=>$rs){
			$rs['type']='user';
			$rs['receid']=$rs['sendid'];
			$rows[]=$rs;
		}
		$nosw	= '';
		$arrs 	= $this->db->getall("select `type`,`mid` from `[Q]im_history` where `uid`=$uid");
		foreach($arrs as $k=>$rs)$nosw.=',['.$rs['type'].','.$rs['mid'].']';
		$row	= array();
		foreach($rows as $k=>$rs){
			if(!$this->contain($nosw, '['.$rs['type'].','.$rs['receid'].']')){
				$row[] = $rs;
			}
		}
		return $row;
	}
}