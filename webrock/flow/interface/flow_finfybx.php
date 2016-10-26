<?php
class finfybxflowClass extends flowChajian
{
	
	protected function contentother()
	{
		//这里不需要了
		return;
		$subdata = m('items')->getitemsdata($this->setid, $this->table, $this->id);
		$headstr = 'name,所属项目@startdt,发生日期@moneys,金额@explain,说明';
		$rows    = isset($subdata['subdata0'])?$subdata['subdata0']:array();
		$arr[] 	 = array(
			'fields' 		=> 'bxmx',
			'fields_style' 	=> '',
			'name' 			=> '报销明细',
			'data' => c('html')->createrows($rows, $headstr, '#cccccc', 'noborder'),
		);
		return $arr;
	}
	
	/**
	*	自定义动作的自定义处理函数 
	* 	写入预算执行库
	*/
	protected function savebudget()
	{		
		//获取当前预算年度
		$mdb				= m("budget");
		$id=$mdb->getmou('id',"`iscurrent`=1 order by id desc");
		if($this->isempt($id)){
			echo "没有指定当前预算年度";
			exit;
		}
		//确定预算月份  根据applydt申请时间来确认  //如果没有则取当前预算年度的当前系统月份，如果系统年份超过了预算年度，则预算年度的最后一个月
		$curm=0;
		$money=0;
		if($this->rs['applydt']){
			$curm=(int)substr($this->rs['applydt'],5,2);
			$money=(int)$this->rs['money'];
		}else{
			echo "申请时间错误";
			exit;
		}
		if($curm==0){
			echo "申请时间错误";
			exit;
		}
		if($money==0){
			echo "发生金额为0";
			exit;
		}
		$subjectid=$this->rs['subjectid'];//预算科目
		$deptid=$this->urs['deptid'];//申请操作人单位ＩＤ
		//写预算库
		$where="`budgetid`=$id and `deptid`=$deptid and `subjectid`=$subjectid";
		m('budgetyear')->update("`dealvalue`=`dealvalue` + $money", $where);
		
		$yearid=m('budgetyear')->getmou('id',$where);		
		
		m('budgetmonth')->update("`dealvalue`=`dealvalue` + $money", $where." and `budgetyearid`=$yearid and `monnum`=$curm");
		
		//echo "update budgetmonth set dealvalue='$money' where".$where." and budgetyearid=$yearid and monnum=$curm";
		//exit;		
		
		return true;//是否需要执行了流程结束程序，false不需要执行，true需要执行
	}

}