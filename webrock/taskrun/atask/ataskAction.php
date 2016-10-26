<?php 
class ataskAction extends ActionNot
{
	
	public function beforeAction()
	{
		$this->taskrunchange(2);
	}
	
	public function afterAction()
	{
		$this->taskrunchange(1);
	}
	
	private function taskrunchange($zt)
	{
		$mid	= (int)$this->get('mid');
		if($mid>0)m('task')->update("`lastrundt`='$this->now',`lastrunzt`='$zt'", $mid);
	}
	
}