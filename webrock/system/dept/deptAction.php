<?php
class deptClassAction extends Action
{
	
	public function publicaftersave($table, $cans, $id)
	{
		m('admin')->record(array('deptname'=>$cans['name']), "`deptid`='$id'");
	}
	
	public function getdeptAjax()
	{
		$type 	= $this->request('changetype');
		$tozw 	= $this->request('changetozw');
		$did 	= $this->request('changetopdid');
		
		$val 	= $this->request('val');
		$pid	= 0;
		
		if($did>0) $pid=$did;
		
		if ($tozw==='true'){
			$rows	= m('dept')->getdept($pid, $type);
			//echo "getdept";	
		}
		else{
			$rows	= m('dept')->getdeptnozw($pid, $type);
			//echo "getdeptnozw";			
		};
		//exit;
		
		if($this->contain($type, 'all')){
			$rows[] = array(
				'name' => '全体人员',
				'id' => 'all',
				'type' => 'a',
				'did' => 'all',
				'uid' => 'all',
				'checked' => false,
				'leaf' => true
			);
		}
		echo json_encode(array(
			'root'	=>'.',
			'children'=>$rows
		));
	}	
	
	public function getcompanydataAjax()
	{
		$rows = m('company')->getall('id>0 order by `sort`','`id`,`name`');
		echo json_encode($rows);
	}
	
	public function publicstoreAfter($table, $rows)
	{
		$dbs 	= m('company');
		foreach($rows as $k=>$rs){
			$rows[$k]['companyname']=$dbs->getmou('name', $rs['companyid']);
		}
		return array('rows'=>$rows);
	}
	
	public function changeAction()
	{
		
	}
	
	public function loaddeptAjax()
	{
		$type 			= $this->request('changetype','user');
		$arr['darr'] 	= m('dept')->getdept(0, $type);
		echo json_encode($arr);
	}
}