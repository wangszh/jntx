<?php
class emailinflowClass extends flowChajian
{
	protected function flowsubmit($lx)
	{
		m('emailin')->sendafter($this->id, (int)$this->rock->request('hidPost'), $this->adminid);
		if($lx==1)$this->sendcanhui();
	}
	
	protected function initdachange()
	{
		m('emails')->update('zt=1', "`mid`='$this->id' and `uid`='$this->adminid'");
		if(!$this->isempt($this->rs['senddt']))$this->rs['senddt'] = c('date')->stringdt($this->rs['senddt'],'G(周w)H:i:s');
	}

	
	private function sendcanhui()
	{
		$snuid = m('admin')->gjoin($this->rs['receid']);
		if($snuid=='')return;
		$this->sendtodo($snuid, array(
			'zntx' 	=> '[{optname}]发一封邮件：{title}',
			'wxtx'	=> array(
				'agentname'		=> '内部邮件',
				'title'			=> '{title}',
				'description' 	=> "主题：{title}\n发送人：{sendname}\n发送时间：{senddt}\n收件人：{recename}"
			)
		));
	}
}