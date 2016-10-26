<?php
/**
*	此文件是流程模块【docdeil.文件传送】对应接口文件。
*	可在页面上创建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_docdeil|interfacei','flow')调用到对应方法
*/ 
class mode_docdeilClassAction extends inputAction{
	
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
	
	
	public function datalistafter($table, $rows)
	{
		$file = m('file');
		foreach($rows as $k=>$rs){
			$frs = $file->getfile('docdeil', $rs['id']);
			$s 	 = '';
			foreach($frs as $k1=>$rs1){
				$s .='<a href="javascript:" class="blue" onclick="return js.downshow('.$rs1['id'].')">'.$rs1['filename'].'</a> ('.$rs1['filesizecn'].')<br>';
			}
			$rows[$k]['filestr'] = $s;
		}
		return array('rows'=>$rows);
	}
}	
			