<?php
class emailinClassModel extends Model
{
	public function initModel()
	{
		$this->settable('emailm');
	}
	
	public function getlast($uid=0)
	{
		$rs['title'] 	= '内部邮件';
		$rs['stotal'] 	= 0;
		if($uid==0)$uid 	= $this->adminid;
		$to = $this->getwdtotal($uid);
		$rs['stotal'] 	= $to;
		return $rs;
	}
	
	public function getwdtotal($uid=0)
	{
		$where = $this->getstrwhere(4,$uid);
		$to = $this->rows($where);
		return $to;
	}
	
	public function getstrwhere($typeoi,$uid=0)
	{
		if($uid==0)$uid 	= $this->adminid;
		$s 		= '1=2';
		switch($typeoi){
			case 0:
				$nos = 'select `mid` from [Q]emails where `uid`='.$uid.' and `isdel`=0';
				$s 	 = '`isturn`=1 and id in('.$nos.')';
			break;
			case 1:
				$s 	 = '`isturn`=0 and sendid='.$uid.'';
			break;
			case 2:
				$s 	 = '`isturn`=1 and sendid='.$uid.' and `isdel`=0';
			break;
			case 3:
				$nos = 'select `mid` from [Q]emails where `uid`='.$uid.' and `isdel`=1';
				$s 	 = '`isturn`=1 and id in('.$nos.')';
			break;
			case 4://未读
				$nos = 'select `mid` from [Q]emails where `uid`='.$uid.' and zt=0 and `isdel`=0';
				$s 	 = '`isturn`=1 and id in('.$nos.')';
			break;
		}
		return $s;
	}
	
	public function sendafter($id, $hid=0, $uid=0)
	{
		$cans	= $this->getone($id);
		if(!$cans)return;
		if($uid==0)$uid = $this->adminid;
		$isfile	= 0;
		if(m('file')->rows("`mtype`='emailm' and `mid`='$id'")>0)$isfile=1;
		$this->update("`isfile`='$isfile'", $id);
		$ids 	= m('admin')->gjoin($cans['receid']);
		m('emails')->delete("`mid`='$id'");
		if($ids=='' || $cans['isturn']==0)return;
		$where = '';
		if($ids != 'all')$where=" and `id` in($ids)";
		$now = $this->rock->now;
		$this->db->insert('[Q]emails','`mid`,`uid`,`zt`,`isdel`,`optdt`',"select '$id',`id`,0,0,'$now' from `[Q]admin` where `status`=1 and `state`<>5 $where", true);
		if($hid>0){
			$this->update("`ishui`=1", $hid);
		}
	}
}