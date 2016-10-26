<?php
class reimsClassModel extends Model
{
	public $serverrecid 	= 'rockreim';
	public $serverpushurl 	= '';
	public $serverhosturl 	= '';
	public $servertitle		= '';
	
	public function initModel()
	{
		$this->settable('im_mess');
		$this->inithost();
	}


	private function inithost()
	{
		if($this->serverpushurl!='')return;
		$dbs = m('option');
		$this->serverrecid		= $dbs->getval('reimrecidsystem');
		$this->serverpushurl	= $dbs->getval('reimpushurlsystem');
		$this->serverhosturl	= $dbs->getval('reimhostsystem');
		$this->servertitle		= $dbs->getval('reimtitlesystem');
		if($this->isempt($this->serverpushurl)){
			$bstest = $dbs->getval('reimmiyuesystem');
			if(strlen($bstest)<150)return;
			$oi 	= $this->rock->jm->getint($this->serverrecid);
			$strss 	= $this->rock->jm->uncrypt($bstest, $oi);
			$asss	= explode('@', $strss);
			$this->serverpushurl=$asss[0];
			$this->serverhosturl=$asss[1];
		}
		if($this->isempt($this->servertitle))$this->servertitle='REIM即时通信';
	}	
	
	public function getreims()
	{
		$this->inithost();
		return array(
			'recid' => $this->serverrecid,			
			'title' => $this->servertitle,			
			'wsurl' => $this->rock->jm->base64encode($this->serverhosturl)			
		);
	}
	
	/**
	*	添加到历史记录,用户不显示历史记录让从新显示
	*/
	public function addhistory($type, $mid, $uid)
	{
		$where 	= "`type`='$type' and `mid`='$mid' and `uid` in($uid)";
		m('im_history')->delete($where);
	}
	
	/**
		发送单人信息
		$lx = 0 微信移动发送 1web客户端
	*/
	public function senduser($receid, $cans=array(), $lx=0)
	{
		$cont		= '';
		if(isset($cans['cont']))$cont=$cans['cont'];
		$sendid		= $this->adminid;
		$optdt		= $this->rock->now;
		if(isset($cans['optdt']))$optdt=$cans['optdt'];
		if(isset($cans['sendid']))$sendid=$cans['sendid'];
		
		$arr = array(
			'cont'		=> $cont,
			'sendid'	=> $sendid,
			'receid'	=> $receid,
			'type'		=> 'user',
			'optdt'		=> $optdt,
			'zt'		=> '0',
			'ftype'		=> '1'
		);
		$arr['receuid'] = $arr['sendid'].','.$arr['receid'];
		$bo = m('im_mess')->insert($arr);
		$arr['id'] 		= $this->db->insert_id();
		$arr['nuid'] 	= $this->rock->request('nuid');
		//给客户端发送
		if($lx==0){
			$receids = m('admin')->getonline($arr['receid']);
			if($receids != ''){
				$this->sendpush($arr['sendid'], $receids , array(
					'cont' 	=> $cont,
					'type' 	=> 'user',
					'optdt' => $optdt,
					'messid' => $arr['id']
				));
			}
		}
		$this->addhistory('user', $receid, $arr['receuid']);
		return $arr;
	}
	
	/**
		发送群讨论信息
		$lx = 0 微信移动发送 1 web客户端
	*/
	public function sendgroup($gid, $cans=array(), $lx=0)
	{
		$cont		= '';
		if(isset($cans['cont']))$cont=$cans['cont'];
		$receid		= $gid;
		$sendid		= $this->adminid;
		$gname		= m('im_group')->getmou('name', $gid);
		$type		= 'group';
		$optdt		= $this->rock->now;
		if(isset($cans['optdt']))$optdt=$cans['optdt'];
		if(isset($cans['type']))$type=$cans['type'];
		if(isset($cans['sendid']))$sendid=$cans['sendid'];
		
		$aors		= m('im_groupuser')->getall("`gid`='$receid'",'uid');
		$asid		= $asids =  '';
		foreach($aors as $k=>$rs){
			$_uid = $rs['uid'];
			if($_uid != $sendid)$asid.=','.$_uid;
			$asids.=','.$_uid;
		}
		
		if($asids != '')$asids = substr($asids, 1);	
		$arr = array(
			'cont'		=> $cont,
			'sendid'	=> $sendid,
			'receid'	=> $receid,
			'receuid'	=> $asids,
			'type'		=> $type,
			'optdt'		=> $optdt,
			'zt'		=> '1'
		);
		$bo = $this->insert($arr);
		$arr['id'] 		= $this->db->insert_id();
		$arr['nuid'] 	= $this->rock->request('nuid');
		$arr['gid'] 	= $receid;
		if($asid != ''){
			$asid = substr($asid, 1);
			$this->db->insert('[Q]im_messzt','`mid`,`uid`,`gid`','select '.$arr['id'].',`id`,'.$gid.' from `[Q]admin` where id in('.$asid.') and `status`=1 and `state`<>5 ', true);
		}
		$arr['receid']	= $asid;
		//推送到PC客户端上
		if($lx==0 && $asid != ''){
			$receids = m('admin')->getonline($asid);
			if($receids != ''){
				$this->sendpush($arr['sendid'], $receids , array(
					'cont' 	=> $cont,
					'type' 	=> 'group',
					'gid'	=> $gid,
					'gname'	=> $gname,
					'optdt' => $optdt,
					'messid' => $arr['id']
				));
			}
		}
		$this->addhistory('group', $gid, $arr['receuid']);
		return $arr;
	}
	
	
	public function getgroupinfor($receid, $uid, $type='group')
	{
		$dbws		= m('reim');
		$loginkey 	= $this->get('loginkey');
		$whes		= $this->rock->dbinstr('receuid', $uid);
		$order 		= '';

		$wdtotal= $dbws->getweitotal($uid, $type, $receid);
		$wdwhere= $dbws->getweitotal($uid, $type, $receid, 1);
		if($wdtotal > 0){
			$zwhere = " $wdwhere order by `id` desc limit 10";
		}else{
			$zwhere = " `receid`='$receid' and `type`='$type' and $whes order by `id` desc limit 5";
		}
		$this->webimonline($loginkey, 1);
		$rows	= $dbws->getall($zwhere, 'optdt,zt,id,cont,sendid,`table`,mid');
		$ids 	= '0';
		$suids	= '0';
		$len 	= 0;
		foreach($rows as $k=>$rs){
			$len++;
			$ids .= ','.$rs['id'].'';
			$suids.= ','.$rs['sendid'];
			$wdtotal--;
		}
		if($type!='system')$rows 	= $this->ivaregarr($suids, $rows);
		if($ids!='0')$this->setyd($ids, $uid);
		if($wdtotal<0)$wdtotal=0;
		return array(
			'rows' 		=> $rows,
			'wdtotal' 	=> $wdtotal
		);
	}
	
	/**
	*	推送提醒
	*/
	public function sendpush($sendid, $receid, $conarr=array())
	{
		$bsarr 	= array('msg'=>'nothost','code'=>2);
		$bstt	= json_encode($bsarr);
		if($this->serverpushurl=='')return $bstt;
		$url 	= $this->serverpushurl.'?reimrecid='.$this->serverrecid.'';
		$sers 	= $this->db->getone('[Q]admin',"`id`='$sendid'", "`name`,`face`");
		if(!$sers)return $bstt;
		$conarr['from'] 	= $this->serverrecid;
		$face 				= $sers['face'];
		if(!$this->isempt($face))$face = URL.''.$face.'';
		$carr['adminid'] 	= $sendid;
		$carr['optdt'] 		= $this->rock->now;
		$carr['sendname'] 	= $sers['name'];
		$carr['face'] 		= $this->rock->repempt($face, 'images/im/user100.png');
		$carr['receid'] 	= $receid;
		$carr['atype'] 		= 'send';
		foreach($conarr as $k=>$v)$carr[$k]=$v;
		$str 				= json_encode($carr);
		return c('curl')->postcurl($url, $str);
	}
}