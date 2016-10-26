<?php
/**
*	此文件是流程模块【leave.请假条】对应接口文件。
*	可在页面上创建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_leave|interfacei','flow')调用到对应方法
*/ 
class mode_leaveClassAction extends inputAction{
	
	/**
	*	重写函数：保存前处理，主要用于判断是否可以保存
	*	$table String 对应表名
	*	$arr Array 表单参数
	*	$id int 对应表上记录Id 0添加时，大于0修改时
	*	$addbo Boolean 是否添加时
	*	return array('msg'=>'提示','rows'=> array()) 可返回空字符串，或者数组 rows 是可同时保存到数据库上数组 
	*/
	protected function savebefore($table, $arr, $id, $addbo){
		$msg 	= m('kaoqin')->leavepan($arr['uid'], $arr['qjkind'], $arr['stime'], $arr['etime'], $arr['totals'], $id);
		return $msg;
	}
	
	/**
	*	重写函数：保存后处理，主要保存其他表数据
	*	$table String 对应表名
	*	$arr Array 表单参数
	*	$id int 对应表上记录Id
	*	$addbo Boolean 是否添加时
	*/	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
	
	//计算请假时间
	public function totalAjax()
	{
		$start	= $this->post('stime');
		$end	= $this->post('etime');
		//$sj 	= ceil(m('kq')->getsbtime($start, $end));
		$date	= c('date', true);
		$sj		= $date->datediff('H', $start, $end);
		echo json_encode(array($sj, ''));
	}
	
	//展示显示
	public function datalistafter($table, $rows)
	{
		$opentype	= $this->post('opentype');
		$arr		= array();
		//可用年假	= 总假期 - 已申请的年假
		if($opentype == '0'){
			$db 	= m($table);
			$month	= date('Y-m');
			$to1	= (int)$db->getmou("sum(totals)", "`kind`='请假' and `uid`='$this->adminid' and `stime` like '".$month."%' and `status` in(0,1)");
			$to2	= (int)$db->getmou("sum(totals)", "`kind` like '增加%' and `uid`='$this->adminid' and `status`=1");
			$to3	= 0;
			$arr['totalstring'] = '本月请假<font color=red>'.$to1.'</font>小时，可用假期<font color=green>'.$to3.'</font>小时';
		}
		foreach($rows as $k=>$rs){
			$rows[$k]['stime'] = str_replace(' ','<br>', $rs['stime']);
			$rows[$k]['etime'] = str_replace(' ','<br>', $rs['etime']);
		}
		$arr['rows'] = $rows;
		return $arr;
	}
	
	public function getshengleval($fie, $mid)
	{
		$mdb = m('kaoqin');
		$nj  = $mdb->getqjsytime($this->adminid,'年假');
		$tx  = $mdb->getqjsytime($this->adminid,'调休');
		$str = '剩余年假:'.$nj.'小时,可调休:'.$tx.'小时';
		return $str;
	}
}	
			