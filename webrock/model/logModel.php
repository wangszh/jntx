<?php
class logClassModel extends Model
{
	public function addlog($type='', $remark='', $sarr=array())
	{
		$arr['type']	= $type;
		$arr['ip']		= $this->rock->ip;
		$arr['web']		= $this->rock->web;
		$arr['optdt']	= $this->rock->now();
		$arr['remark']	= $remark;
		foreach($sarr as $k=>$v)$arr[$k]=$v;
		$this->insert($arr);
	}
	
	public function addread($table, $mid, $uid=0)
	{
		if($uid==0)$uid=$this->adminid;
		$arr['table']	= $table;
		$arr['mid']		= $mid;
		$arr['ip']		= $this->rock->ip;
		$arr['web']		= $this->rock->web;
		$arr['optdt']	= $this->rock->now();
		$arr['optid']	= $uid;
		m('reads')->insert($arr);
	}
	
	public function getreadarr($table, $mid)
	{
		$rows = $this->db->getrows('[Q]reads',"`table`='$table' and `mid`='$mid' group by `optid`",'optid,max(optdt)optdt,count(1)stotal');
		$uids = '0';
		foreach($rows as $k=>$rs){
			$uids.=','.$rs['optid'].'';
		}
		$usarr = array();
		if($uids!='0'){
			$uarr = $this->db->getarr('[Q]admin',"`id` in($uids) and `status`=1 and `state`<>5", '`name`,`face`');
			foreach($rows as $k=>$rs){
				$uid = $rs['optid'];
				if(isset($uarr[$uid])){
					$usarr[] = array(
						'uid' 		=> $uid,
						'optdt' 	=> $rs['optdt'],
						'stotal' 	=> $rs['stotal'],
						'name'	=> $uarr[$uid]['name'],
						'face'	=> $this->rock->repempt($uarr[$uid]['face'],'images/noface.jpg')
					);
				}
			}
		}
		return $usarr;
	}
	
	public function getread($table, $uid=0)
	{
		if($uid==0)$uid=$this->adminid;
		$sid = $this->db->getjoinval('[Q]reads','mid',"`table`='$table' and `optid`=$uid group by `mid`");
		if($sid=='')$sid = '0';
		return $sid;
	}
	
	public function config($num)
	{
		$rsa = m('flow_set')->getone("`num`='$num'",'`id`,`sericnum`,`zntx`,`imtx`,`emtx`,`wxtx`,`table`');
		if(!$rsa)$rsa = array('zntx'=>0,'imtx'=>0,'emtx'=>0,'wxtx'=>0);
		return $rsa;
	}
	
	public function ismode($id)
	{
		$to = m('chargemode')->rows("modeid='$id'");
		$bo = false;
		if($to>0)$bo=true;
		return $bo;
	}
}