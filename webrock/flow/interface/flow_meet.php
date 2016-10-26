<?php
class meetflowClass extends flowChajian
{
	protected function flowsubmit($lx)
	{
		if($this->rs['status']==1)$this->sendcanhui();
	}
	
	protected function flowthrough($sm)
	{
		$this->sendcanhui();
	}
	
	private function sendcanhui()
	{
		$snuid = m('admin')->gjoin($this->rs['joinid']);
		if($snuid=='')return;
		
		if(strtotime($this->rs['startdt']) > time()){
			$this->sendtodo($snuid, array(
				'zntx' 	=> '[{optname}]发起会议[{title}]在[{hyname}],从{startdt}→{enddt}',
				'wxtx'	=> array(
					'agentname'		=> '今日会议,会议',
					'title'			=> '会议.{title}',
					'description' 	=> "主题：{title}\n开始时间：{startdt}\n截止时间：{enddt}\n参会人：{joinname}\n发起人：{optname}\n会议室：{hyname}\n说明：{explain}"
				)
			));
		}else{
			$this->mdb->update('state=2', $this->id);
		}
	}
}