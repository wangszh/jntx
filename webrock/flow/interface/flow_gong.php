<?php
class gongflowClass extends flowChajian
{
	protected function flowsubmit($lx)
	{
		$this->sendcanhui();
	}
	
	private function sendcanhui()
	{
		$snuid = m('admin')->gjoin($this->rs['faobjid']);
		if($snuid=='')return;
		
		$description	= "类型：{typename}\n发送人：".$this->adminname."";
		if(!$this->isempt($this->rs['zuozhe']))$description.="\n发布者：".$this->rs['zuozhe']."";
		if(!$this->isempt($this->rs['indate']))$description.="\n时间：".$this->rs['indate']."";
		$this->sendtodo($snuid, array(
			'zntx' 	=> '[{typename}]{title}',
			'wxtx'	=> array(
				'agentname'		=> '通知公告',
				'title'			=> '{title}',
				'description' 	=> $description
			)
		));
	}
}