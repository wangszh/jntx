<?php
/**
*	此文件是流程模块【finfybx.费用报销】对应接口文件。
*	可在页面上创建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_finfybx|interfacei','flow')调用到对应方法
*/ 
class mode_finfybxClassAction extends inputAction{
	
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
	
	//获取用户默认　用户名称　银行卡号　身份证号
	public function getusermrAjax()
	{
		$rs = m('admin')->getone("`id`='$this->adminid' order by `optdt` desc",'name,cardid,idnum');
		if(!$rs)$rs='';
		echo json_encode($rs);
	}
	
	public function getlastAjax()
	{
		$rs = m('fininfom')->getone("`uid`='$this->adminid' order by `optdt` desc",'paytype,cardid,openbank,fullname');
		if(!$rs)$rs='';
		echo json_encode($rs);
	}
}	
			