<?php 
class uploadClassAction extends Action{
	
	
	public function getfileAjax()
	{
		$mtype		= $this->request('table','',3);
		$mid		= $this->request('mid');
		$rows 		= m('file')->getfiles($mtype, $mid);
		echo json_encode($rows);
	}
	
	public function delfileAjax()
	{
		$id		= $this->request('id');
		m('file')->delfile($id);
	}
}