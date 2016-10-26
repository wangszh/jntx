<?php
class demandflowClass extends flowChajian
{
	
	protected function flowcheckname($num)
	{
		if($num=='jishuculi'){
			return array($this->rs['jsid'], $this->rs['jsname']);
		}
	}
	
	//保存对应审批人员
	protected function flowcheckbefore($zt, $coursers)
	{
		if($zt==1 && $coursers['inputid']>0){
			$jsid	= (int)$this->rock->jm->base64decode($this->rock->request('checkinput_changeuser_id','0'));
			$jsname	= $this->rock->jm->base64decode($this->rock->request('checkinput_changeuser'));
			$this->mdb->update(array(
				'jsid' 		=> $jsid,
				'jsname' 	=> $jsname
			), "`id`='$this->id'");
			$this->rs['jsid'] 	= $jsid;
			$this->rs['jsname'] = $jsname;
		}
	}
}