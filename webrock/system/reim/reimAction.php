<?php
class reimClassAction extends Action
{
	public function groupuserafter($table, $rows)
	{
		$dbs = m('admin');
		foreach($rows as $k=>$rs){
			$rs1 = $dbs->getone($rs['uid'],'`name`,`deptname`,`state`');
			if($rs1){
				$rows[$k]['name'] 	  = $rs1['name'];
				$rows[$k]['deptname'] = $rs1['deptname'];
			}else{
				$rows[$k]['name'] 	  = '不存在';
			}
		}
		return array('rows'=>$rows);
	}
	
	public function adduserAjax()
	{
		$gid = $this->post('gid');
		$val = $this->post('val');
		$dbs = m('admin');
		$suid= $dbs->gjoin($val);
		if($suid != ''){
			$ouid = $this->db->getjoinval('[Q]im_groupuser','uid',"`gid`='$gid'");
			if($this->isempt($ouid))$ouid='0';
			$this->db->insert('[Q]im_groupuser','gid,uid,adddt',"select '$gid',`id`,'$this->now' from [Q]admin where `id` in($suid) and `id` not in($ouid)", true);
		}
		echo '添加成功';
	}
	
	public function setsaveAjax()
	{
		$this->option->setval('reimtitlesystem', $this->post('reimtitlePost'));
		$this->option->setval('reimhostsystem', $this->post('reimhostPost'));
		$this->option->setval('reimrecidsystem', $this->post('reimrecidPost'));
		$this->option->setval('reimpushurlsystem', $this->post('reimpushurlPost'));
		$this->option->setval('reimmiyuesystem', $this->post('reimmiyuePost'));
		$this->backmsg();
	}
	
	public function getsetAjax()
	{
		$arr= array();
		$arr['reimtitle']= $this->option->getval('reimtitlesystem');
		$arr['reimhost']= $this->option->getval('reimhostsystem');
		$arr['reimrecid']= $this->option->getval('reimrecidsystem');
		$arr['reimpushurl']= $this->option->getval('reimpushurlsystem');
		$arr['reimmiyue']= $this->option->getval('reimmiyuesystem');
		echo json_encode($arr);
	}
	
	public function testsendAjax()
	{
		$msg =  m('reims')->sendpush($this->adminid, $this->adminid,array(
			'cont' 	=> $this->jm->base64encode('测试内容:'.$this->now.''),
			'type' 	=> 'user',
			'optdt' => $this->now,
			'messid' => 0
		));
		if(!$msg)$msg='测试发送失败';
		echo $msg;
	}
}