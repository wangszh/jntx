<?php 
class flowClassAction extends ataskAction{
	public function repipeiAjax()
	{
		$rows	= m('flow_set')->getall("`isflow`=1 and `table` is not null order by `sort`", 'num');
		$str	= '';
		foreach($rows as $k=>$rsss){
			$flow	 = f($rsss['num']);
			$arrs	 = $flow->reloadpipei();
			$str	.= ''.($k+1).'、'.$arrs[0];
		}
		echo 'success';
	}
}