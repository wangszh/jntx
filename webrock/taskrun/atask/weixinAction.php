<?php 
/**
	微信相关发送定时任务
*/

class weixinClassAction extends ataskAction{
	
	/**
		待办发送到对应的人员(一般是每天发2次)
	*/
	private function getdaiban($arows, $uid)
	{
		$arr 		= array();
		foreach($arows as $k=>$rs){
			$whre	= $rs['where'];
			$to		= $this->db->rows('[Q]'.$rs['table'].'', "`status`=0 and ifnull(uid, 0)>0 and `isturn`=1 and instr(concat(',', nowcheckid, ','), ',$uid,')>0 $whre");
			if($to>0){
				$arr[]= array(
					'name'		=> $rs['name'],
					'stotal' 	=> $to,
					'num'		=> $rs['num'],
					'table'		=> $rs['table']
				);
			}
		}
		return $arr;
	}
	
	private function getflowset()
	{
		$mwhere	= m('where');
		$arowss	= m('flow_set')->getall('isflow=1 and `table` is not null order by `sort`', "`num`,`name`,`table`");
		$s 		= '';
		foreach($arowss as $k=>$rs){
			$whre	= $mwhere->getstring('flowset_'.$rs['num']);
			$arowss[$k]['where'] = $whre;
		}
		return $arowss;
	}
	
	public function daibanAjax()
	{
		$arowss	= $this->getflowset();
		$arows	= m('admin')->getwxuser();
		foreach($arows as $k=>$rs){
			$uid = $rs['id'];
			$s 	 = '';
			$arr = $this->getdaiban($arowss, $uid);
			foreach($arr as $k1=>$rs1){
				$s.= "\n".$rs1['name'].":".$rs1['stotal']."条;";
			}
			if($s!=''){
				$s="【待办审批】".$s."\n请尽快去审批处理";
				m('weixin:index')->sendtext($uid, '单据待办', $s);
			}
		}
		
		echo 'success';
	}
	
	/**
		单据审批不通过
	*/
	private function getdaibannot($arows, $uid)
	{
		$arr 		= array();
		foreach($arows as $k=>$rs){
			$whre	= $rs['where'];
			$to		= $this->db->rows('[Q]'.$rs['table'].'', "`status`=2 and `isturn`=1 and (`uid`='$uid' or `optid`='$uid') $whre");
			if($to>0){
				$arr[]= array(
					'name'		=> $rs['name'],
					'stotal' 	=> $to,
					'num'		=> $rs['num'],
					'table'		=> $rs['table']
				);
			}
		}
		return $arr;
	}
	public function dannotAjax()
	{
		$arowss	= $this->getflowset();
		$arows	= m('admin')->getwxuser();
		foreach($arows as $k=>$rs){
			$uid = $rs['id'];
			$s 	 = '';
			$arr = $this->getdaibannot($arowss, $uid);
			foreach($arr as $k1=>$rs1){
				$s.= "\n".$rs1['name'].":".$rs1['stotal']."条;";
			}
			if($s!=''){
				$s="【单据处理未通过】".$s."\n请尽快去处理";
				m('weixin:index')->sendtext($uid, '单据查看', $s);
			}
		}
		echo 'success';
	}
	
	/**
		REIM提醒(一般是每天发2次)
	*/
	private function getreimwd($uid)
	{
		$arr  = array();
		$rows = $this->db->getall("SELECT sendid,count(1)stotal FROM `rock_im_mess` where receid=$uid and zt=0 and type='user' group by `sendid`");
		foreach($rows as $k=>$rs){
			$arr[] = array(
				'uid' 	 => $rs['sendid'],
				'stotal' => $rs['stotal'],
				'type'	 => 'user',
				'gname'	 => $this->db->getmou('[Q]admin','`name`', $rs['sendid'])
			);
		}
		$rows = $this->db->getall("select `gid`,count(1)stotal from `[Q]im_messzt` where `uid`=$uid group by `gid`");
		foreach($rows as $k=>$rs){
			$arr[] = array(
				'gid' 	 => $rs['gid'],
				'stotal' => $rs['stotal'],
				'type'	 => 'group',
				'gname'	 => $this->db->getmou('[Q]im_group','`name`', $rs['gid'])
			);
		}
		return $arr;
	}
	public function reimtodoAjax()
	{
		$arows	= m('admin')->getwxuser();
		foreach($arows as $k=>$rs){
			$uid = $rs['id'];
			$s 	 = '';
			$arr = $this->getreimwd($uid);
			foreach($arr as $k1=>$rs1){
				$s.= "\n".$rs1['gname'].":".$rs1['stotal']."条;";
			}
			if($s!=''){
				$s="【未读信息】".$s."";
				m('weixin:index')->sendtext($uid, 'REIM', $s);
			}
		}
		echo 'success';
	}
}