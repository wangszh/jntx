<?php 
class systemClassAction extends ataskAction{
	
	//备份数据库
	public function bfmysqlAjax()
	{
		$pathbf		= $this->option->getval('mysqlpathbf');
		$path		= $this->option->getval('mysqlpath');
		if(!$this->isempt($pathbf) && !$this->isempt($path)){
			
			
			
		}
		echo 'success';
	}
}