<?php
/**
*	此文件是流程模块【jiaban.加班单】对应接口文件。
*	可在页面上创建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_jiaban|interfacei','flow')调用到对应方法
*/ 
class mode_jiabanClassAction extends inputAction{
	
	/**
	*	重写函数：保存前处理，主要用于判断是否可以保存
	*	$table String 对应表名
	*	$arr Array 表单参数
	*	$id Int 对应表上记录Id 0添加时，大于0修改时
	*	$addbo Boolean 是否添加时
	*	return array('msg'=>'错误提示内容','rows'=> array()) 可返回空字符串，或者数组 rows 是可同时保存到数据库上数组
	*/
	protected function savebefore($table, $arr, $id, $addbo){
		
	}
	
	/**
	*	重写函数：保存后处理，主要保存其他表数据
	*	$table String 对应表名
	*	$arr Array 表单参数
	*	$id Int 对应表上记录Id
	*	$addbo Boolean 是否添加时
	*/	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
	
	
	public function totalAjax()
	{
		$start	= $this->post('stime');
		$end	= $this->post('etime');
		
		$date	= c('date', true);
		$sj		= $date->datediff('H', $start, $end);
		
		echo json_encode(array($sj, ''));
	}
	
	
	//展示显示
	public function datalistafter($table, $rows)
	{
		$arr		= array();
		foreach($rows as $k=>$rs){
			$rows[$k]['stime'] = str_replace(' ','<br>', $rs['stime']);
			$rows[$k]['etime'] = str_replace(' ','<br>', $rs['etime']);
		}
		$arr['rows'] = $rows;
		return $arr;
	}
}	
			