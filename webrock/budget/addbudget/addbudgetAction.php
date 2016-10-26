<?php
class addbudgetClassAction extends Action
{
	
	/**
		获取年度预算详细信息
	*/
	public function getbudgetAjax()
	{
		$yid		= $this->rock->post('yid');//type
		$did		= $this->rock->post('did');//mid
		$ntable		= '';
		$s			= '[]';
		
		//年度预算的
		if($yid == '0' || $did == '0'){			
			return "参数错误!";
			//$s.=$this->getuserext($mid);
		}else{
			$rows	= $this->db->getall("select `subjectid`,`yearvalue` from `[Q]budgetyear` where `budgetid`='$yid' and `deptid`='$did'");
			//foreach($rsa as $rs)$s.=',['.$rs['sid'].']';
			
			//echo  count($rows);
			//return;
			
			if(!is_array($rows))$rows = array();
			$s= array(
				'total'	=> count($rows),
				'rows'	=> $rows
			);	
			
		}
		echo json_encode($s);
	}
	
	/**
		保存年度预算信息
	*/
	public function savebudgetAjax()
	{
		$yid		= $this->post('yid');
		$did		= $this->post('did');
		$chaid		= $this->post('chaid');
		$chavalue		= $this->post('chavalue');
		
		$msg='';
		
		$chaidarray=explode(",",$chaid); 
		$chavaluearray=explode(",",$chavalue);
		
		//删除原有数据
		$this->db->delete($this->T('budgetyear'), "`budgetid`='$yid' and `deptid`='$did'");
		
		for ($i= 0;$i< count($chaidarray); $i++){
			$id= $chaidarray[$i];
			$value= $chavaluearray[$i];			
			$this->db->insert($this->T('budgetyear'),'`budgetid`,`deptid`,`subjectid`,`yearvalue`',"'$yid','$did','$id','$value'",false);
			//最后人上参数是设定，值是否是select语句
		}	
		
		if($msg=='')$msg='success';
		echo $msg;
	}
	
	/**
		生成月度预算,将年度预算平均分配到每个月份中
	*/
	public function makemonthbudgetAjax()
	{
		$yid		= $this->post('yid');		
		
		$msg='';
		
		//$this->db->tranbegin("");
		//删除原有数据
		$this->db->delete($this->T('budgetmonth'), "`budgetid`='$yid'");
			
		$sel="select `budgetid`,`id`,`deptid`,`subjectid`,`monnum`,FORMAT(`yearvalue`/12,2) from `[Q]budgetmonnum`,`[Q]budgetyear` where `budgetid`=$yid";
				
		$this->db->insert($this->T('budgetmonth'),'`budgetid`,`budgetyearid`,`deptid`,`subjectid`,`monnum`,`monthvalue`',"$sel",true);
		//最后人上参数是设定，值是否是select语句
		
		//$this->db->tranend();
		
		if($msg=='')$msg='success';
		echo $msg;
	}
	
	//导入
	public function importAjax()
	{
		//return;
		$import	= c('PHPExcelReader', true);//c为rockfun中的插件读取函数  调用include/chajian/PHPExcelReaderChajian.php
		$cdt	= c('date', true);
		//$rows	= $import->reader();
		$rows	= $import->reader(null,1);		
		$dbd	= m('dept');
		$dbs	= m('subject');
		$db		= m('budgetyear');
		$oi		= 0;
		$deptf	= 0;//部门列计数器
		$depts	= 4;//部门列开始标记
		$firstl	= 0;//首行处理标记
		$topline	= array();//首行处理的部门ＩＤ列表
		
		$yid	= (int)$this->rock->request('yid');
		
		//删除原有数据
		$this->db->delete($this->T('budgetyear'), "`budgetid`='$yid'");	
		
		//第一步　根据科目编号获取科目的ＩＤ字段
		//第二步　根据取科室车间名称获取科室车间的ＩＤ字段
		//第三步　整理成条条记录，并一条一条地插入数据表 $db->insert($arr);
		$arr	= array(
			'budgetid'	=> $yid,
			'deptid'	=> '',
			'subjectid'	=> '',
			'yearvalue'	=> '',
			'dealvalue'	=> ''
		);	
		foreach($rows as $k=>$rs){
			////$k为数组下标 $rs表示工作表内记录集的一行		
			
			if($firstl==0){				
				//处理首行标题，主要是为了处理后边列的部门信息
				//$topline=$rs;
				foreach($rs as $kk=>$col){//$kk为数组下标
					if($deptf>=$depts-1){//从第4列开始为部门字段
						$deptid 	= $dbd->getmou('id', "`name`='".$col."'");
						$topline[$kk]=$deptid;						
					}
					$deptf++;				
				}									
			}else{
							
				$subid 	= $dbs->getmou('id', "`num`='".$rs['C']."'");
				$arr['subjectid']=$subid;
				
				foreach($topline as $kkk=>$col){//$kk为数组下标					
					$arr['deptid']=$col;
					$arr['yearvalue']=$rs[$kkk];
										
					if(!$this->isempt($arr['budgetid']) && !$this->isempt($arr['deptid']) && !$this->isempt($arr['subjectid']) && !$this->isempt($arr['yearvalue']) ){					
						$oi++;									
						$db->insert($arr);
					}			
				}
				
			}
			$firstl=1;
		}
		
		$this->backmsg('', '成功导入'.$oi.'条,记得更新数据');
	}

	//导出
	public function exportAjax()
	{
		$fields	= '序号,科目名称,科目编号';
		$title	= '用户导入格式';
		//$cont	= 'admin,管理员,男,OA项目经理,开发部,158***,rockoa@xh829.com,[2015-08-01]';
		
		$rows	= $this->db->getall("select `name` from `[Q]deptview`");
		foreach($rows as $rs)
		{
			$fields.=','.$rs['name'];
		}
		
		$farr	= explode(',', $fields);
		$hearArr= array();
		for($i=0; $i<count($farr); $i++){
			$hearArr[$i] = $farr[$i];
		}
		
		
		//获取科目及编号
		$rows	= $this->db->getall("select `name`,`num` from `[Q]subject` order by `num`");
		$cont=array();
		$temp=array();
		$i=1;
		foreach($rows as $rs)
		{
			$temp=array($i,$rs['name'],$rs['num']);
			$cont[]=$temp;
			$i++;
		}
		
		$excel	 = c('PHPExcel', true);
		$excel->title	= $title;
		$excel->headArr	= $hearArr;
		$excel->titlebool	= false;
		$excel->borderbool	= false;
		$excel->rows	=$cont;//array(explode(',', $cont));
		$excel->display();
		
		return;		
	}
}