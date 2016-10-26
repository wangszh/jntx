<?php
class executionAction extends Action
{
	private $fieldarr = array();
	
	protected $moders = array();
	
	//单位预算总体分析
	public function deptfxAjax()
	{		
		$where		= $this->jm->uncrypts($this->post('where'));
		$where		= $this->jm->base64decode($where);//前台加密文本，解压后需要再用base64decode解码
		$db		= m('budget_bydeptview');
		//$type		= $this->post('type');
		//$dt		= $this->post('dt');	
		
		$rows	= $db->getall("budgetid>0 $where",'dname as name,yearvalue as pvalue,dealvalue as evalue,round(dealvalue/yearvalue*100,2) as bili');
		$totals 	= $db->getone("budgetid>0 $where",'sum(yearvalue) as totalp,sum(dealvalue) as totale');
		//print_r($totals);
		//exit;
		echo  json_encode(array(
			'rows' => $rows,
			'totalp' => $totals['totalp'],
			'totale' => $totals['totale']
		));
		
		exit;
	}
	
	//统计分析
	public function fxAjax()
	{		
		$where		= $this->jm->uncrypts($this->post('where'));
		$where		= $this->jm->base64decode($where);//前台加密文本，解压后需要再用base64decode解码		
		$type		= $this->post('type');
		$startdt		= $this->post('startdt');
		$enddt		= $this->post('enddt');
		
		$sql="budgetid>0 $where";
		$year=0;$month=0;
		if(isdate($startdt)){			
			$year=(int)substr($startdt,0,4);
			$month=(int)substr($startdt,5,2);			
			if($year>0 || $month>0){
				if($type=='yeard'){
					$sql.=" and ndyear>=$year";
				}else{
					$sql.=" and ((ndyear=$year and monnum>=$month) or ndyear>$year)";
				}
			}
		}
		if(isdate($enddt)){
			$year=(int)substr($enddt,0,4);
			$month=(int)substr($enddt,5,2);	
			if($year>0 || $month>0){
				if($type=='yeard'){
					$sql.=" and ndyear<=$year";
				}else{
					$sql.=" and ((ndyear=$year and monnum<=$month) or ndyear<$year)";
				}
			}
		}
		switch ($type) {
			case 'subject':
				$sql="select subjectid,max(sname) as name,max(num) as num,sum(monthvalue) as pvalue,sum(dealvalue) as evalue from `[Q]budgetmonthview` where ".$sql." group by subjectid order by num";
				break;
			case 'yeard':
				$sql="select ndyear,max(bname) as name,sum(monthvalue) as pvalue,sum(dealvalue) as evalue from `[Q]budgetmonthview` where ".$sql." group by ndyear order by ndyear";
				break;
			case 'monthd':
				$sql="select ndyear,monnum,max(bname) as name,sum(monthvalue) as pvalue,sum(dealvalue) as evalue from `[Q]budgetmonthview` where ".$sql." group by ndyear,monnum order by ndyear,monnum";
				break;			
			default:
				//默认deptname
				$sql="select ndyear,max(dname) as name,sum(monthvalue) as pvalue,sum(dealvalue) as evalue from `[Q]budgetmonthview` where ".$sql." group by deptid order by deptid";
				break;
		}
		
		$rows	= $this->db->getall($sql);
		
		$a		= array();
		$totalp=0;$totale=0;
		foreach($rows as $k=>$rs){
			$pvalue=(int)$rs['pvalue'];
			$evalue=(int)$rs['evalue'];
			$totalp+=$pvalue;
			$totale+=$evalue;
			$bili=0;
			if($pvalue>0){
				$bili= round ($evalue/$pvalue*100,2);
			}
			$name=$rs['name'];
			if($type=='monthd'){
				$name=str_replace('度预算','',$name).$rs['monnum'].'月';
			}
			$a[] = array(
				'name'	=> $name,
				'pvalue'	=> $pvalue,
				'evalue'	=> $evalue,
				'bili'	=> $bili
			);
		}	
		
		echo  json_encode(array(
			'rows' => $a,
			'totalp' => $totalp,
			'totale' => $totale
		));
		
		exit;
	}
	
	//现在没用，　只是个例子
	public function monthlistAction()
	{
		$this->tpltype = 'html';
		$budgetid		= $this->jm->gettoken('budgetid');
		$deptid		= $this->jm->gettoken('deptid');			
		$subjectid		= (int)$this->jm->gettoken('subjectid');
		
		$path 		= ''.ROOT_PATH.'/webrock/budget/execution/page/input_'.$num.'.html';
		include_once($mpathname);
		
		
		echo $subjectid;
		exit;
		
		$this->mid  = $mid;
		//流程基本信息
		$moders 	= m('flow_set')->getone("`num`='$num'",'`id`,`num`,`name`,`table`');
		if(!$moders)exit('流程不存在!');
		$this->smartydata['moders']	= $moders;
		$this->smartydata['gridid']	= $gridid;
		$modeid 	= $moders['id'];
		//读取输入界面模板路径
		$path 		= ''.ROOT_PATH.'/webrock/flow/applyview/page/input_'.$num.'.html';		
		$content 	= '';
		//用户信息
		$this->urs  = m('admin')->getone($this->adminid, '`name`,`deptname`,`ranking`,`workdate`,`deptid`');
		//字段元素列表
		$fieldarr 	= m('flow_element')->getrows("`mid`='$modeid' and `iszb`=0",'fields,fieldstype,name,dev,data,isbt,islu,attr','`sort`');
		foreach($fieldarr as $k=>$rs){
			$this->fieldarr[$rs['fields']] = $rs;
		}
		
		$this->smartydata['fieldsjson']	= json_encode($fieldarr);
		$this->moders= $moders;//流程
		//加载输入界面模板
		if(file_exists($path)){
			$content = file_get_contents($path);
		}
		if($content=='')exit('未设置录入页面');
		$this->actclss	= $this;
		//加载读取数据的对象
		$pathss 		= ''.ROOT_PATH.'/webrock/flow/input/mode_'.$num.'Action.php';		
		if(file_exists($pathss)){
			include_once($pathss);
			$clsnam 	= 'mode_'.$num.'ClassAction';
			$this->actclss 	= new $clsnam();
		}
		
		//匹配出输入界面的字段列表 并生成字段显示模型***** 字段列表放在$list
		preg_match_all('/\{(.*?)\}/', $content, $list);
		foreach($list[1] as $k=>$nrs){
			$str		= $this->getfieldcont($nrs, $this->actclss);
			$content	= str_replace('{'.$nrs.'}', $str, $content);
		}
		
		//多列子表匹配的是[]
		$content 	 = $this->pisubduolie($content, $modeid, 1);

		$this->title  = $moders['name'];
		$content						= str_replace('*','<font color=red>*</font>', $content);
		$this->smartydata['content']	= $content;
		$this->smartydata['mid']		= $mid;
		//return;		
	}
}

class executionClassAction extends executionAction{}