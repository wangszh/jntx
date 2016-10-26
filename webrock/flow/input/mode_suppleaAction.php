<?php
/**
*	此文件是流程模块【supplea.物品领用】对应接口文件。
*	可在页面上创建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_supplea|interfacei','flow')调用到对应方法
*/ 
class mode_suppleaClassAction extends inputAction{
	
	public function getsupplea()
	{
		$arr 	= array();
		$rows 	= m('supple')->getall('1 order by sort,optdt desc','`id`,`name`');
		foreach($rows as $k=>$rs){
			$arr[] = array('value'=>$rs['id'], 'name'=>$rs['name']);
		}
		return $arr;
	}
	
}	
			