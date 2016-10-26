<?php
class workflowClass extends flowChajian
{
	protected function initdachange()
	{
		$this->rs['project'] 	= m('projectm')->getmou('title', $this->rs['projectid']);
		if($this->idtype==1)$this->rs['projectid'] = $this->rs['project'];
	}
	
}