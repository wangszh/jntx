<?php 
/**
	工作流的插件
*/

class flowChajian extends Chajian{

	public $flownum;//流程编号 flow_set的num
	public $flowname;//流程名称 flow_set的name
	public $table;//流程关联表（表单表）的表名
	public $id;//申请的ＩＤ   流程关联表（表单表）的ＩＤ
	public $setid;//flow_set的id 流程ＩＤ
	public $idtype;//0pc,1移动  客户端类型
	public $rs;//流程关联表（表单表）的一条记录，　当前申请记录
	public $mdb;//流程关联表（表单表）的模型引用　或者申请表引用
	public $urs;//申请操作人用户记录
	public $drs;//申请操作人单位记录
	public $brs;//flow_bill的记录　一条申请一条　一一对应
	public $uid;//申请操作人用户ＩＤ
	public $sericnum;//申请单编号
	
	public $flowrs;//flow_set的当前记录
	public $errormsg;//错误信息
	public $where;//"`table`='$this->table' and `mid`='$this->id'"　　设置查询当前申请的条件
	public $flowarr;//可走的整个流程 非start 非end
	public $fieldsarr;
	public $checksm;
	public $todotplarr = array();
	
	public function __construct($num)
	{
		parent::__construct();
		$this->flownum 		= $num;
		$this->errormsg 	= '';
		$this->where	 	= '';
		$this->initflows();
		$this->initflow();
	}
	
	protected function initflow(){}
	protected function initdachange(){}
	protected function flowcheckname($num){return '';}
	protected function flowsubmit($lx){}
	protected function flowcheckjudge(){}
	protected function flowcheckbefore($zt,$nrs){}
	protected function flownothrough(){}
	protected function flowthrough($sm){}
	protected function contentother(){}
	protected function flowfields($arr){}
	
	
	
	private function initflows()
	{
		$this->dbcourse = m('flow_course');//flow_course的模型引用
		$this->dblog 	= m('flow_log');//flow_log的模型引用
		$this->dbrule 	= m('flow_rule');//flow_rule的模型引用
		$this->dbadmin 	= m('admin');//admin的模型引用
		$this->dbwhere 	= m('where');//where的模型引用
		$this->dbtodo 	= m('todo');//todo的模型引用
		$this->flowrs	= m('flow_set')->getone("`num`='$this->flownum'");//流程基本信息
		if(!$this->flowrs){
			exit('流程不存在;');
			return;
		}	
		$this->table			= $this->flowrs['table'];
		$this->flowname			= $this->flowrs['name'];
		$this->setid			= $this->flowrs['id'];
		$this->uidfields		= $this->rock->repempt($this->flowrs['uidfields'], 'uid');//用户字段名
		$this->statusfields		= $this->rock->repempt($this->flowrs['statusfields'], 'status');
		$this->nstatusfields	= 'nstatus';
		$this->statusmanfields	= 'statusman';
		$this->fieldsarr		= array(
			'base_name' 		=> '姓名',
			'base_deptname' 	=> '部门',
			'base_flowname' 	=> '模块',
			'base_sericnum' 	=> '单号'
		);
		$this->mdb				= m($this->table);
	}
	
	public function addmsg($msg='')
	{
		$this->errormsg .= $msg;
	}
	
	public function initrecord($id, $islx=0)
	{		
		$this->id		= $id;//申请的ＩＤ
		$this->idtype	= $islx; //0pc,1移动    客户端类型
		//获取一条申请记录，流程关联表的一条记录
		$this->rs		= $this->mdb->getone("`id`='$id'");//得到一条申请
		
		
		//echo 'aaa'.$this->rs['openbank'].'bbb';
		//exit;
		
		$this->where	= "`table`='$this->table' and `mid`='$this->id'";
		if(!$this->rs){
			$this->addmsg('['.$id.']记录不存在;');
			return;
		}else{
			if(!isset($this->rs[$this->uidfields]))$this->rs[$this->uidfields]=0;//如果申请中用户字段没有设置，则设为0
			if(!isset($this->rs['applydt']))$this->rs['applydt']='';//如果申请中申请日期字段没有设置，则设为空字符串
		}
		$this->rs['base_name'] = '';//用户名
		$this->rs['base_deptname'] = '';//用户部门名称
		$this->uid	= $this->rs[$this->uidfields];
		//如果申请人uid没有设定，则获取操作人id optid的值赋给this->uid
		if($this->uid==0 && isset($this->rs['optid']))$this->uid = $this->rs['optid'];
		if($this->isempt($this->rs['applydt'])&&isset($this->rs['optdt']))$this->rs['applydt']=substr($this->rs['optdt'],0,10);
		if($this->isempt($this->rs['applydt']))$this->rs['applydt']=$this->rock->date;
		//获取uid的详细信息
		$this->urs	= $this->dbadmin->getone("`id`='$this->uid'",'`id`,`deptname`,`name`,`ranking`,`deptid`,`deptpath`,`superid`,`superman`,`finge`');
		if($this->urs){
			//获取用户的单位信息
			$this->drs	= $this->db->getone('[Q]dept', "`id`='".$this->urs['deptid']."'");
			$this->rs['base_name']		= $this->urs['name'];
			if($this->drs){
				$this->rs['base_deptname']	= $this->drs['name'];
			}	
		}
		$this->sericnum	= '';//申请单号
		//前面主要设置申请数据的合理性
		$this->brs		= m('flow_bill')->getone($this->where);
		//保存流程申请与流程相关的内容
		if(!$this->brs&&$this->urs)$this->brs=$this->savebill();
		$this->sericnum	= $this->brs['sericnum'];//申请表单号
		$this->rs['base_flowname']	= $this->flowname;
		$this->rs['base_sericnum']	= $this->sericnum;
		$this->initdachange();//空
		$this->rs['base_summary']	= $this->rock->reparr($this->flowrs['summary'], $this->rs);
	}
	
	//获取当前申请，当前状态下能走的流程节点，已经完成的节点则判断是否已经通过$showtype＝２，正执行的则只返回剩下的审核人列表
	public function getflow()
	{
		$this->flowarr		= array();
		$this->a_tempid		= '0';
		$rsone	= $this->prmatchflow($this->setid);//获取流程入口　flow_courser的一条数据   多个入口根据条件选择一个
		if(!$rsone){
			$this->addmsg('匹配不到流程;');
			return;
		}
		//获取可走的从头到尾的整个流程，排除end和start，分支的只列出符合条件的，包括入口(非end和非start)　　按顺序存放在flowarr数组中
		$this->getflows($rsone, $this->setid);//要判断的start、end和分支条件成立
		//流程遍历
		foreach($this->flowarr as $k=>$crs){
			
			//得到节点的审核人列表******************************************************************************
			$uarr 	= $this->getcheckname($crs);//$crs为流程节点
			//得到节点的审核人列表******************************************************************************
			
			
			
			$zssh	= $crs['zscheck'];//至少多少人审核才能通过
			$courid	= $crs['id'];//当前节点ＩＤ
			$checkid	= $uarr[0];//本节点所有可用审核人ＩＤ列表   字符串
			$checkname	= $uarr[1];//本节点所有可用审核人名称列表   字符串
			$showtype	= 1;//1当前节点，2已审核完成
			
			$nesid	= $this->gettzzt($courid);//动作值数组    字符串
			//根据动作值，从flow_log中查找本节点的所有已经审核的审核人 ID数组　　　$this->where 表明了是当前申请
			$geusr 	= $this->dblog->getarr("$this->where and `courseid`='$courid' and `status` in($nesid) group by `checkid`",'checkid');
			$_uars 	= array();//已经审核的审核人ＩＤ列表数组
			foreach($geusr as $k1=>$rs1){
				$_uars[]=$rs1['checkid'];
			}
			$looi	= count($_uars);//已经审核的审核人人数
			if(!$this->isempt($checkid)){
				$_suid = '';
				$_suna = '';
				$csarid  = explode(',', $checkid);
				$csarna  = explode(',', $checkname);
				
				if($zssh<=0){//本节点需要全部审核人审核通过，才能进入下一节点
					foreach($csarid as $k2=>$u2){
						if(!in_array($u2, $_uars)){//获取不在已经审核人列表中的ＩＤ列表$_suid，如果这个值为空，则该节点已经审核通过
							$_suid .= ','.$u2.'';
							$_suna .= ','.$csarna[$k2].'';
						}
					}
					if($_suid=='' && $looi>0)$showtype=2;//如果这个值为空，则该节点已经审核通过
				}else{//本节点只需Ｎ个人审核就可以进入下一节点，
					//这里有bug，至少一个的情况下是可以的，如果是两人及两人以上就会出现问题，好在前台指明了就一个人
					if($looi>=$zssh){
						$showtype = 2;
					}
				}
				if($_suid!=''){
					$checkid 	= substr($_suid,1);
					$checkname 	= substr($_suna,1);
				}
			}
			$this->flowarr[$k]['showtype'] 	= $showtype;
			$this->flowarr[$k]['checkid'] 	= $checkid;//本节点还没审核的审核人ＩＤ列表   字符串
			$this->flowarr[$k]['checkname'] = $checkname;//本节点还没审的核审核人名称列表   字符串
			$this->flowarr[$k]['checkidal'] 	= $uarr[0];//本节点所有可用审核人ＩＤ列表   字符串
			$this->flowarr[$k]['checknameal'] 	= $uarr[1];//本节点所有可用审核人名称列表   字符串
		}
//exit;
	}
	
	//得到节点的审核人列表******************************************************************************
	//$crs为流程节点
	private function getcheckname($crs)
	{
		$type	= $crs['checktype'];
		$cuid 	= $name = '';//$cuid为审批人ＩＤ列表，$name为审批人名称列表　　多个ＩＤ或用户名用逗号分开 2,8   管理员１,张飞
		
		//获取审核人从表flow_checks中  这个表是做什么用的，还不清楚    获取后直接返回了
		$_ches	= $this->db->getone('[Q]flow_checks',"$this->where and `courseid`='".$crs['id']."'",'checkid,checkname');
		if($_ches){
			$cuid = $_ches['checkid'];
			$name = $_ches['checkname'];
			if(!$this->isempt($cuid))return array($cuid, $name);
		}
		
		$uarr	= $this->flowcheckname($crs['num']);//空处理
		if(is_array($uarr)){
			if(!$this->isempt($uarr[0]))return $uarr;
		}
		
		//这里要写，************************　start
		if($type=='group'){
			//申请中有科目ＩＤ－－〉职位－－〉用户列表，流程节点中有组名－－〉用户列表，两者相同部分就是审核人
			//sjoin中选取type=zs的记录   mid为职位id  sid为科目id
			
			//获取申请中科目的对应职位ＩＤ
			$tempsql="";
			if(isset($this->rs['subjectid'])){
				$_sqzwlist	= $this->db->getall("select `mid` from `[Q]sjoin` where `type` ='zs' and `sid`=".$this->rs['subjectid']);
				foreach($_sqzwlist as $k=>$vzw){
					$tempsql.=",".$vzw['mid'];
				}			
			}			

			$_uars 	= array();//存放用户列表
			if($tempsql!=""){
				$tempsql = '('.substr($tempsql, 1).')';
				//获取科目对应的用户ＩＤ和name（多个）
				$_squlist	= $this->db->getall("select `id`,`name` from `[Q]admin` where `state`<>5 and `zwid` in $tempsql");
				foreach($_squlist as $k=>$vuw){
					$_uars[$vuw['id']]= $vuw['name'];
				}
			}
			
			//根据流程节点的组获取用户列表
			$_squlist1	= $this->db->getall("select `id`,`name` from `[Q]admin` where `state`<>5 and CONCAT(',',`groupname`,',') like '%,".trim($crs['groupname']).",%'");
			
			foreach($_squlist1 as $k=>$vuw1){
				if(isset($_uars[$vuw1['id']])){
					$cuid.=','.$vuw1['id'].'';
					$name.=','.$_uars[$vuw1['id']].'';
				}
			}			
			
			if($cuid != ''){
				$cuid = substr($cuid, 1);
				$name = substr($name, 1);
			}
			/*
			echo "<br><br><br>".$crs['id']."<br>";
			print_r($_squlist);
			echo '<br>';
			print_r($_squlist1);
			echo '<br>';
			echo $cuid;
			echo '=>';
			echo $name;
			echo '<br>';
			echo "select `id`,`name` from `[Q]admin` where `state`<>5 and `groupname` = '".trim($crs['groupname'])."'";
			*/
		}
		//这里要写，************************　end

		if($type=='super'){
			$cuid = $this->urs['superid'];
			$name = $this->urs['superman'];
		}
		if($type=='dept' || $type=='super'){
			if($this->isempt($cuid)){
				$cuid = $this->drs['headid'];
				$name = $this->drs['headman'];
			}
		}
		if($type=='apply'){
			$cuid = $this->urs['id'];
			$name = $this->urs['name'];
		}
		if($type=='user'){
			$cuid = $crs['checktypeid'];
			$name = $crs['checktypename'];
		}
		if($type=='rank'){
			$rank = $crs['checktypename'];
			if(!$this->isempt($rank)){
				$rnurs	= $this->dbadmin->getall("`status`=1 and `ranking`='$rank' order by `sort`");
				foreach($rnurs as $k=>$rns){
					$cuid.=','.$rns['id'].'';
					$name.=','.$rns['name'].'';
				}
				if($cuid != ''){
					$cuid = substr($cuid, 1);
					$name = substr($name, 1);
				}
			}
		}
		if($type=='depta'){
			$duid = $crs['checktypeid'];
			if(!$this->isempt($duid)){
				$usar = $this->dbadmin->getall("`deptid` in($duid) and `status`=1 and `state`<>5",'`id`,`name`');
				foreach($usar as $k=>$rs){
					$cuid.=','.$rs['id'].'';
					$name.=','.$rs['name'].'';
				}
				if($cuid!=''){
					$cuid = substr($cuid, 1);
					$name = substr($name, 1);
				}
			}
		}
		$cuid	= $this->rock->repempt($cuid);
		$name	= $this->rock->repempt($name);
		return array($cuid, $name);
	}
	
	private function getflows($rsa, $sid)
	{
		if(!$rsa)return;//入口为空，则返回
		$id		= (int)$rsa['id'];
		$this->a_tempid .= ','.$id.'';
		$type	= $rsa['checktype'];//审核类型
		if( !($type == 'start' || $type =='end'))$this->flowarr[] = $rsa;//获取一个可操作的流程节点　非start 非end
		//获取下一级的Ｎ个流程节点   N大于１时为多分支，需要判断条件
		$allrs	= $this->dbcourse->getall("`pid`='$id' and `setid`='$sid' and `id` not in($this->a_tempid) order by `sort`");
		$nrs	= false;
		$k1		= 0;
		foreach($allrs as $k=>$srs){
			if($k==0)$nrs = $srs;
			$k1++;
		}
		if($k1>1){//多分支要判断条件成立的
			foreach($allrs as $k=>$srs){
				//判断当前节点是否符合条件
				if($this->pandanwhere($srs['id'])){//判断申请的当前节点条件是否成立，传送参数为节点ＩＤ
					$nrs = $srs;
					break;
				}
			}
		}
		if($nrs){
			$this->getflows($nrs, $sid);
		}else{
			$nid = (int)$rsa['nid'];
			if($nid >0 ){
				$tenrs = $this->dbcourse->getone("`id`='$nid' and `setid`='$sid' and `id` not in($this->a_tempid) ");
				if($tenrs)$this->getflows($tenrs, $sid);
			}
		}		
	}
	
	//多分支条件判断  str_replace(array(' ',"'",'AND','='), array('[K]','[F]','[A]','[D]') ,$s)  [Q]为前缀
	//判断本节点是否符合条件
	private function pandanwhere($sid)
	{
		$bo 	= false;
		//生成分支条件的字符串 　　表where
		$where  = $this->dbwhere->getstring('flowcourse_'.$sid, 'a.', 'b.');//参数１为where表的标记　参数２为field的where表前缀（多表联合）　参数３为field的用户表前缀（多表联合）
		if($where != ''){
			//从流程关联表（表单表）中，判断当前申请是否是条件
			$total	= $this->db->rows("`[Q]$this->table` a left join `[Q]admin` b on a.`$this->uidfields`=b.`id`", "a.`id`='$this->id' $where");
			if($this->db->nowerror){
				$this->addmsg('判断条件有错('.$sid.'):'.$this->db->error().';');
			}
			if($total > 0)$bo=true;
		}
		return $bo;
	}
	
	//提前匹配flow（flow_courser的一条数据） $fsid为flow_set的ID　　主要是找流程入口    多个入口根据条件选择一个
	private function prmatchflow($fsid)
	{
		$rsone	= false;
		$rsone1	= false;
		//获取flow_course的入口
		$rsall	= $this->dbcourse->getall("`setid`='$fsid' and `pid`=0 order by `sort`");
		$utid  	= array();
		$dtid  	= array();
		//多个入口遍历，根据针对的人员范围选择不同的入口
		foreach($rsall as $k=>$rsa){
			$atype	= $rsa['atype'];//针对的人员范围
			//如果针对范围是ALL,则直接返回本入口
			if($this->rock->isempt($atype) || $atype == 'all'){
				$rsone1	= $rsa;
				continue;
			}
			$artid = explode(',', $rsa['atypeid']);
			foreach($artid as $ssid){
				if($ssid=='')continue;
				$fs  = substr($ssid, 0, 1);
				$sid = str_replace('u','', $ssid);
				$sid = str_replace('d','', $sid);
				if($fs=='d'){
					$dtid[$sid]= $rsa;
				}else{
					$utid[$sid]= $rsa;
				}					
			}
		}
		//根据ＵＩＤ获取流程入口
		if(isset($utid[$this->uid]))$rsone = $utid[$this->uid];
		//获取本用户的部门信息，由根遍历的部门上下级关系
		if(!$rsone){
			$depath = $this->urs['deptpath'];//获取本用户的部门信息，由根遍历的部门上下级关系
			if(!$this->rock->isempt($depath)){
				$depa = explode(',', str_replace(array('[',']'), array('',''), $depath));
				foreach($depa as $depas){
					if(isset($dtid[$depas]))$rsone = $dtid[$depas];
				}
			}
		}
		if(!$rsone)$rsone=$rsone1;
		return $rsone;//返回流程入口记录　flow_courser的一条数据
	}
	
	public function addlog($arr=array(),$fileid='')
	{
		$addarr	= array(
			'table'		=> $this->table,
			'mid'		=> $this->id,
			'checkname'	=> $this->adminname, 
			'checkid'	=> $this->adminid, 
			'optdt'		=> $this->rock->now,
			'courseid'	=> '0',
			'status'	=> '1',
			'ip'		=> $this->rock->ip,
			'web'		=> $this->rock->web,
			'modeid'	=> $this->setid
		);
		foreach($arr as $k=>$v)$addarr[$k]=$v;//'name'		=> $name,	'explain'	=> $sm
		$this->dblog->insert($addarr);
		$ssid = $this->db->insert_id();
		if($fileid!='')m('file')->addfile($fileid, $this->table, $this->id);
		return $ssid;
	}
	
	public function addlogs($zt, $na='', $sm='',$fileid='')
	{
		$arrs['statusname'] = $zt;
		$arrs['explain'] 	= $sm;
		$arrs['name'] 		= $na;
		return $this->addlog($arrs, $fileid);
	}
	
	//读取跳过状态动作
	private function gettzzt($courid)
	{
		$nesid	= '';
		$nsrs	= $this->db->getarr('[Q]flow_courseact',"`cid`='$courid' and `nid`=0",'`actv`');
		if(is_array($nsrs)){
			foreach($nsrs as $ns1=>$csrs)$nesid.=','.$csrs['actv'].'';
			if($nesid!='')$nesid = substr($nesid, 1);
		}
		if($nesid=='')$nesid='1';
		return $nesid;
	}
	
	private function getrule($upd=false)
	{
		$this->getflow();//获取本申请所用流程的信息,从头到尾的，不包括start、end   存放在$this->flowarr中   并查找申请节点所有的审核人及还没审核的审核人
		$allcourseid	= $alluserid = $alluser	= $allcheckid = $nowuser = $nowuserid= '';
		$step			= $nowcourseid	= $nextcourseid	= 0;
		$this->nowcoursers	= array();//当前节点
		$this->nextcoursers	= array();//下一个节点
		$allstep		= count($this->flowarr);//适用流程步长
		foreach($this->flowarr as $k=>$ars){
			$courid			= $ars['id'];//当前节点ＩＤ
			$allcourseid   .= '|'.$courid.'';//所有节点ＩＤ
			$alluserid     .= '|'.$ars['checkidal'].'';//所有节点可用审核人ＩＤ列表   字符串                节点内容用逗号分开，节点之间用|分开
			$alluser       .= '|'.$ars['checknameal'].'';//所有节点可用审核人名称列表   字符串                  节点内容用逗号分开，节点之间用|分开
			if($ars['showtype'] == 1 && $step == 0 ){//当前可审核节点
				$step 			= $k+1;
				$nowcourseid	= $courid;//当前节点ＩＤ
				$nowuserid		= $ars['checkid'];//本节点还没审核审核人ＩＤ列表   字符串
				$nowuser		= $ars['checkname'];//本节点还没审核审核人名称列表   字符串
				$this->nowcoursers	= $ars;//当前节点
				if($step < $allstep){
					$this->nextcoursers	= $this->flowarr[$k+1];//下一个节点
					$nextcourseid		= $this->nextcoursers['id'];//下一个节点ＩＤ
				}	
			}	
		}
		if($allcourseid != ''){
			$allcourseid	= substr($allcourseid, 1);
			$alluserid		= substr($alluserid, 1);
			$alluser		= substr($alluser, 1);
			$allcheckid		= str_replace('|', ',', $alluserid);
		}
		$nstatus	= (int)$this->dblog->getmou('status', $this->where.' and `courseid`>0 order by id desc'); 	
		$uarr		= array(
			'flowname'		=> $this->flowname,//流程名称 flow_set的name
			'flowid'		=> $this->setid,//flow_set的id 流程ＩＤ
			'rulename'		=> $this->urs['name'],//用户记录中的用户名
			'allcourseid'	=> $allcourseid,//所有节点ＩＤ
			'alluserid'		=> $alluserid,//所有节点可用审核人ＩＤ列表   字符串     节点内容用逗号分开，节点之间用|分开
			'alluser'		=> $alluser,//所有节点可用审核人名称列表   字符串     节点内容用逗号分开，节点之间用|分开
			'allstep'		=> $allstep,//适用流程步长
			'step'			=> $step,//是否有当前可操作的节点，０没有，１有
			'table'			=> $this->table,//流程关联表（表单表）的表名
			'mid'			=> $this->id,//流程关联表（表单表）的表的ＩＤ　申请ＩＤ
			'adddt'			=> $this->rock->now,//当前操作时间
			'nowcourseid'	=> $nowcourseid,//当前节点ＩＤ
			'nextcourseid'	=> $nextcourseid,//下一节点ＩＤ
			'nowuser'		=> $nowuser,//本节点还没审核审核人名称列表   字符串   用逗号分开
			'nowuserid'		=> $nowuserid,//本节点还没审核审核人ＩＤ列表   字符串   用逗号分开
			'allcheckid'	=> $allcheckid,//整个可用流程所有节点的可用审核人列表，　　全部用逗号分开
			'nstatus'		=> $nstatus//本申请当前的状态　　最新的流程动作值
		);
		if($upd)$this->ruleupdate($uarr);//是否保存规则，则将流程规则保存入flow_rule，如果不保存，则不更新flow_rule。  并更新　flow_bill,流程单据表mdb   
		return $uarr;
	}
	
	private function ruleupdate($uarr)
	{
		$where	= $this->where;
		$allcid	= $uarr['allcheckid'];//整个可用流程所有节点的可用审核人列表，　　全部用逗号分开
		if($allcid=='')$allcid='0';
		$allcids= '['.str_replace(',', '],[', $allcid).']';
		//查询漏网之鱼
		$lora	= $this->dblog->getall("$where and `courseid`>0 group by `checkid`", '`checkid`');
		foreach($lora as $k=>$lors){
			if(!$this->rock->contain($allcids, '['.$lors['checkid'].']')){
				$allcid.=','.$lors['checkid'].'';
			}
		}
		$uarr['allcheckid']	= $allcid;
		$ruid	= $this->dbrule->rows($where);
		if($ruid == 0){
			$where	= '';
		}
		$this->dbrule->record($uarr, $where);
		$urarr	= array(
			'allcheckid'	=> $uarr['allcheckid'],
			'nowcheckid'	=> $uarr['nowuserid'],
			'nowcheckname'	=> $uarr['nowuser']
		);
		$this->mdb->record($urarr, "`id`='$this->id'");
		m('flow_bill')->record(array(
			'allcheckid' => $uarr['allcheckid'],
			'nstatus' 	 => $uarr['nstatus']
		),  $this->where);
	}
	
	/**
		第一步提交时
		@param 	int 	$lx 	类型：0保存/1提交
		@param 	string 	$sm 	提交说明
	*/
	public function submit($lx=0, $sm='')
	{
		$name	= '保存';
		$this->savebill();
		
		$arr['nowuserid'] 	= '';
		$uarr['isturn'] 	= $lx;//类型：0保存/1提交
		if($lx==1){//1提交
			if($this->errormsg != '')return $this->errormsg;
			$name	= '提交';
			if($this->flowrs['isflow']==1){//在提交状态下，如果有流程　则status为０，则获取流程信息
				$arr	= $this->getrule(true);//获取流程规则，并保存flow_rule表
				$uarr['status'] = 0;
			}else{//在提交状态下，如果没有流程　则status为1,表示完毕
				$uarr['status'] = 1;
				$this->rs['status'] = 1;
			}
		}
		$this->mdb->update($uarr, "`id`='$this->id'");//设置表单表申请表状态         status为0，表示正在进行      status为1,表示完毕
		$this->addlog(array(
			'name'		=> $name,
			'explain'	=> $sm
		));//增加流程申请/审核操作日志
		if($lx==1){
			$this->nexttodocl($arr['nowuserid'], 'next', $sm);//根据不同的动作（下一节点next，退回nothrough，完成finish）,返回提醒信息，并发送此信息
		}
		$this->flowsubmit($lx);//空
		return $name.'成功';//保存/提交成功
	}
	
	public function addtodo($uid,$tits='', $msg='', $url='')
	{
		if($tits=='')$tits = $this->flowname;
		$this->dbtodo->add($uid, $tits, $msg, array(
			'table' => $this->table,
			'mid'	=> $this->id,
			'url'	=> $url
		));
	}
	
	/**
		创建单号
	*/
	public function createnum()
	{
		$num = $this->flowrs['sericnum'];
		if($num=='无'||$this->isempt($num))$num='TM-Ymd-';
		$apdt 	= str_replace('-','',$this->rs['applydt']);
		$num	= str_replace('Ymd',$apdt,$num);
		return $this->db->sericnum($num,'[Q]flow_bill');
	}
	public function savebill()
	{
		if($this->flowrs['isflow']==0)return;//没有流程，则直接返回，不保存
		$dbs = m('flow_bill');
		$whes= $this->where;
		$biid= (int)$dbs->getmou('id', $whes);
		$arr = array(
			'table' => $this->table,
			'mid' 	=> $this->id,
			'optdt' => $this->rock->now,
			'optname' 	=> $this->adminname,
			'optid' 	=> $this->adminid,
			'modeid'  	=> $this->setid,
			'isdel'		=> '0',
			'nstatus'	=> $this->rs['status'],
			'applydt'	=> $this->rs['applydt'],
			'modename'  => $this->flowname
		);
		if($biid==0){
			$arr['uid'] 	= $this->uid;
			$arr['sericnum']= $this->createnum();
			$whes	= '';
		}
		$dbs->record($arr, $whes);
		return $arr;
	}
	
	private $_fieldssel = array();
	public function getfields()
	{
		$arr	= array();
		$farr 	= m('flow_element')->getall("`mid`='$this->setid' and `iszb`=0 and `iszs`=1",'fields,name','`sort`');
		if($farr){
			foreach($farr as $k=>$rs){
				$arr[$rs['fields']]=$rs['name'];
			}
		}else{
			$farr	= c('edit')->getfield($this->table, 1);
			foreach($farr as $k=>$rs){
				$arr[$k] = $rs['name'];
				$this->_fieldssel[$k] = $rs['selarr'];
			}
		}
		$arrs = $this->flowfields($arr);
		if(is_array($arrs))$arr = $arrs;
		return $arr;
	}
	
	public function contentview($lx='')
	{
		$fields = $this->fieldsarr;
		
		$fields = array_merge($fields, $this->getfields());
		$fstr	= m('file')->getstr($this->table, $this->id);
		if($fstr != ''){
			$fields['file_content'] 	= '相关文件';
			$this->rs['file_content'] 	= $fstr;
		}
		
		$rows 	= $this->rs;
		foreach($rows as $k=>$v){
			if(isset($this->_fieldssel[$k])){
				$selarr = $this->_fieldssel[$k];
				if(isset($selarr[$v]))$rows[$k]=$selarr[$v];
			}
		}
		
		$ohtrn	= $this->contentother($fields);
		if(is_array($ohtrn)){
			foreach($ohtrn as $k=>$ors){
				$fid 			= $ors['fields'];
				$fields[$fid] 	= $ors['name'];
				$rows[$fid]   	= $ors['data'];
				if(isset($ors['fields_style']))$rows[$fid.'_style'] = $ors['fields_style'];
			}
		}
		
		$path 	= ''.ROOT_PATH.'/'.PROJECT.'/flow/applyview/page/page_'.$this->flownum.'';//此文件可以没有
		
		if($this->idtype==1)$path .='_mobile';
		$path  .= '.html';
		$cont	= $s = '';
		if(file_exists($path)){
			$cont = file_get_contents($path);
		}
		
		if(!$this->isempt($cont)){
			$s 	 = $this->rock->reparr($cont, $rows);
		}else{			
			if($this->idtype==0)$s = c('html')->createtable($fields, $rows, $this->flowname, $lx);//如果没有模板文件，则生成显示视图
		}		
		
		return $s;
	}
	

	public function sendtodo($nuid,$tmarr=array(),$sm='')
	{
		foreach($tmarr as $k=>$v)$this->todotplarr[$k]=$v;
		$this->nexttodocl($nuid,'next',$sm);
	}
	
	//发送通知
	private function gettxsscont($lx, $lxs='')
	{
		$msg = '';
		if(isset($this->todotplarr[$lx])){
			$msg= $this->todotplarr[$lx];
			$msg= $this->rock->reparr($msg, $this->rs);
		}
		if($lxs!='' && $msg=='')$msg=$this->gettxsscont($lxs);
		return $msg;
	}
	
	//根据不同的动作（下一节点next，退回nothrough，完成finish）,返回提醒信息todo，并发送此信息
	private function nexttodocl($nuid, $type='next',$sm='', $oarr=array())
	{
		if($this->isempt($nuid))return;
		if($nuid!='all')$this->dbtodo->delete($this->where." and uid in($nuid)");//
		$msg	= $cont	= $emal = $appcont = $agentname = $wxurl = '';
		$wxarr	= false;
		$url	= $this->createcheckurl($nuid);//创建一个流程路径标签　$url 	= '?rocktoken='.$token.'';
		$zntx	= $this->flowrs['zntx'];//是否站内提醒
		$imtx	= $this->flowrs['imtx'];//是否REIM提醒
		$emtx	= $this->flowrs['emtx'];//是否邮件提醒
		$wxtx	= $this->flowrs['wxtx'];//是否微信推送@0|否,1|是
		$apptx	= $this->flowrs['apptx'];//是否app提醒
		$this->rs['check_explain'] = $sm;
		if($wxtx==1)$wxurl	= m('option')->getval('weixin_url');//从选项表中查找weixin_url
		if($this->isempt($wxurl))$wxtx=0;//weixin_url为空，则$wxtx=0
		$zntitle 	= $this->flowname;
		$apptitle 	= $this->flowname;
		$agentname 	= ''.$this->flowname.',单据待办';
		$imsendnae 	= $agentname;
		$wxopenurl	= ''.$wxurl.'xiang.html?num='.$this->flownum.'&mid='.$this->id.'';
		if($type == 'next'){
			if($zntx==1){
				$msg 	= $this->gettxsscont('zntx');//得到提醒信息内容
				if(is_array($msg)){
					if(isset($msg['cont']))$msg=$msg['cont'];
					if(isset($msg['title']))$zntitle=$msg['title'];
				}
				if($msg=='')$msg = '您有['.$this->urs['name'].']的['.$this->flowname.',单号:'.$this->sericnum.']需要处理';
				if($sm!='')$msg .= ',说明:'.$sm.'';
			}
			if($imtx == 1){
				$cont 	= $this->gettxsscont('imtx', 'zntx');
				if(is_array($cont)){
					if(isset($cont['cont']))$cont=$cont['cont'];
					if(isset($cont['title']))$imsendnae=$cont['title'].','.$imsendnae.'';
				}
				if($cont=='')$cont= '单据处理<br>模块:'.$this->flowname.'<br>单号:'.$this->sericnum.'<br>申请人:'.$this->urs['name'].'<br>部门:'.$this->drs['name'].'';
				if($sm!='')$cont .= '<br>说明:'.$sm.'';
			}
			if($emtx == 1){
				$yjcont	= $this->contentview();
				$emal 	= $this->gettxsscont('emtx');
				if($emal=='')$emal	= '您好:<br>您有['.$this->rs['base_deptname'].'.'.$this->rs['base_name'].']的['.$this->flowname.',单号:'.$this->sericnum.']需要处理';
				if($sm!='')$emal .= ',说明:'.$sm.'';
				$emal	.= '。请尽快去处理，谢谢！(邮件由系统自动发送)<br><a href="'.SYSURL.''.$url.'" target="_blank" style="color:blue"><u>打开地址&gt;&gt;</u></a><br><br>';
				$emal	.= $yjcont;
			}
			if($wxtx == 1){
				$owxarr = array();
				if(isset($this->todotplarr['wxtx'])){
					$owxarr = $this->todotplarr['wxtx'];
				}
				$wxarr = array(
					'title' 		=> '单据处理['.$this->flowname.']',
					'description' 	=> "模块：".$this->flowname."\n单号：".$this->sericnum."\n申请人：".$this->rs['base_name']."\n部门：".$this->rs['base_deptname']."\n操作时间：".$this->rs['optdt']."\n摘要：".$this->rs['base_summary']."",
					'url'			=> $wxopenurl
				);
				foreach($owxarr as $k=>$v)$wxarr[$k]=$v;
				if(isset($wxarr['agentname']))$agentname=$wxarr['agentname'].','.$agentname.'';
				$wxarr['description'] 	= $this->rock->reparr($wxarr['description'], $this->rs);
				$wxarr['title'] 		= $this->rock->reparr($wxarr['title'], $this->rs);
				m('weixin:index')->sendnews($nuid, $agentname, $wxarr);
			}
			if($apptx==1){
				$appcont 	= $this->gettxsscont('apptx','zntx');
				if(is_array($appcont)){
					if(isset($appcont['cont']))$appcont=$appcont['cont'];
					if(isset($appcont['title']))$apptitle=$appcont['title'];
				}
				if($appcont=='')$appcont = '您有['.$this->urs['name'].']的['.$this->flowname.',单号:'.$this->sericnum.']需要处理';
				if($sm!='')$appcont .= ',说明:'.$sm.'';
			}
		}
		$agentname 	= ''.$this->flowname.',单据申请';
		//退回
		if($type == 'nothrough'){
			$msg	= '您提交['.$this->flowname.',单号:'.$this->sericnum.']'.$oarr['checkname'].'处理['.$oarr['ztname'].']，原因:['.$oarr['sm'].']';	
			if($imtx == 1){
				$cont	= $msg;	
			}
			if($wxtx == 1){
				m('weixin:index')->sendnews($nuid,$agentname, array(
					'title' 		=> '您提交['.$this->flowname.']处理:'.$oarr['ztname'].'',
					'description' 	=> "处理人：".$this->adminname."\n单号：".$this->sericnum."\n处理动作：".$oarr['ztname']."\n原因：".$oarr['sm']."",
					'url'			=> $wxopenurl
				));
			}
			if($apptx==1){
				$appcont= $msg;
			}
		}
		//完成
		if($type == 'finish'){
			$msg	= '您提交的['.$this->flowname.',单号:'.$this->sericnum.']已全部处理完成';
			if($imtx == 1){
				$cont	= $msg;
			}
			if($wxtx == 1){
				m('weixin:index')->sendnews($nuid,$agentname, array(
					'title' 		=> '您提交['.$this->flowname.']已全部处理完成',
					'description' 	=> "单号：".$this->sericnum."\n最后处理人：".$this->adminname."\n说明：".$sm."\n摘要：".$this->rs['base_summary']."",
					'url'			=> $wxopenurl
				));
			}
			if($apptx==1){
				$appcont= $msg;
			}
		}
		
		if($msg != ''){
			if($nuid!='all')$this->addtodo($nuid,$zntitle, $msg);
		}
		if($cont != ''){
			m('reim')->sendsystem($this->adminid, $nuid, $imsendnae, $cont, $this->table, $this->id);
		}
		if($emal != ''){
			$rows 	= $this->rs;
			$rows['send_content'] = $emal;
			if($nuid!='all')m('email')->sendmail('flowchecktodo', $nuid, $rows);
		}
		if($appcont!=''){
			c('xgpush')->sendandroid($nuid, $apptitle, $appcont);
		}
	}
	
	public function createcheckurl($nuid)
	{
		$token	= $this->rock->jm->strrocktoken(array(
			'm' => 'flow',
			'd' => 'taskrun',
			'a' => 'view',
			'uid' => $nuid,
			'modenum' => $this->flownum,
			'mid' => $this->id
		));
		$url 	= '?rocktoken='.$token.'';
		return $url;
	}

	//添加指定记录审核
	//$senid下一节点审核人　$nextcourseid下一节点ＩＤ　$checkid当前审核人ＩＤ　$checkname当前审核人名称
	private function addchecks($senid, $courseid, $checkid, $checkname)
	{
		$_carr = array(
			'table'	=> $this->table,
			'mid'	=> $this->id,
			'courseid'	=> $courseid,
			'checkid'	=> $senid,
			'checkname'	=> $this->db->getjoinval('[Q]admin','name',"`id` in($senid)"),
			'optid'		=> $checkid,
			'optname'	=> $checkname,
			'optdt'		=> $this->rock->now
		);
		$dbsae 		= m('flow_checks');
		$_seahwherr = "$this->where and `courseid`='$courseid'";
		if($dbsae->rows($_seahwherr)==0)$_seahwherr='';
		$dbsae->record($_carr, $_seahwherr);
	}
	
	//处理审批动作
	//$zt动作　$sm说明    $shuid当前用户ＩＤ　$senid即check_nextchangeid  $zyna转给其他人name  $zyid转给其他人ID
	public function check($zt, $sm='', $shuid=0, $senid='', $zyna='', $zyid='')
	{
		if($this->errormsg != '')return $this->errormsg;
		$this->checksm = $sm;//说明
		$msg		= '';
		$ztfields	= $this->statusfields;//status
		
		$this->dbtodo->delete($this->where." and uid='$this->uid'");//删除申请用户本申请下的所有（通知）， 这里是通知，不是日志，所有可以删除
		if($this->rs[$ztfields] == 1){//status=1表示已经完成
			$msg = '记录已审核完成了';
			return $msg;
		}
		
		$checkid			= $this->adminid;
		$checkname			= $this->adminname;
		if($shuid > 0){
			$tens_rs		= $this->dbadmin->getone("`id`='$shuid'", '`id`,`name`'); 
			$checkid		= $tens_rs['id']; 
			$checkname		= $tens_rs['name']; 
		}
		$checkid			= (int)$checkid;
		if($checkid <= 0){
			$msg = '审核人不存在';
			return $msg;
		}
		if($this->errormsg != ''){
			$msg = $this->errormsg;
			return $msg;
		}		
		
		
		$arr				= $this->dbrule->getone($this->where);
		$nowuserid		= $arr['nowuserid'];
		if(!$this->rock->contain(','.$nowuserid.',', ','.$checkid.',')){
			$msg='当前审核人是:['.$arr['nowuser'].','.$nowuserid.']';
			return $msg;
		}
		$msg	= '处理成功';
		$nextcourseid		= (int)$arr['nextcourseid'];
		$nowcourseid		= $arr['nowcourseid'];
		$this->nowcoursers	= $this->dbcourse->getone("`id`='$nowcourseid'");
		$nowcoursers		= $this->nowcoursers;
		$isback				= 0;
		$ztname				= '';
		$isend				= 0;
		$ztnamearr			= array('','通过','不通过');
		$this->flowcheckbefore($zt, $nowcoursers);//空操作
		$_shcnarr			= m('flow_courseact')->getone("`cid`='$nowcourseid' and `actv`='$zt'");//获取自定义的动作		
		
		//自定义动作的自定义处理函数
		$isendre=false;//自定义动作，是否需要提前结束流程
		if($_shcnarr){			
			$selfaction=$_shcnarr['action'];
			if(!$this->rock->isempt($selfaction)){
				if(method_exists($this, $selfaction)){
					$isendre=$this->$selfaction();//执行自定义动作函数     如：存入预算库
				}
			}
		}		
			
		$color 				= '';
		if(!$_shcnarr){//为空时，表示没有自定义的动作
			if($zt==2)$isback = 1;//动作值为２时，为退回(不通过)
			$ztname	= $ztnamearr[$zt];
		}else{//有自定义的动作
			if($_shcnarr['nid']==-1)$isback = 1;//nid表示是正常，还是退回（-1退回去提交人）
			$ztname	= $_shcnarr['name'];//动作主名称
			$color	= $_shcnarr['color'];
			if(!$this->isempt($_shcnarr['names']))$ztname = $_shcnarr['names'];//动作副名称不为空时，则名称将显示副名称，不再显示主名称
		}
		
		//得到流程节点是否是所有人通过才进入一下节点
		//$_zscheck=(int)m('flow_course')->getmou('zscheck', "`id`='$nowcourseid'");
		//if($_zscheck==0){
			
		//}
		
		if(!$this->isempt($senid) && $nextcourseid!=0 && $zt==1){//原没有。增加本节点是否所有人通过，才进入下一节点
			$this->addchecks($senid, $nextcourseid, $checkid, $checkname);//增加下一节点的审核   *********************************************************
			//$senid下一节点审核人　$nextcourseid下一节点ＩＤ　$checkid当前审核人ＩＤ　$checkname当前审核人名称
		}
		
		$this->dbtodo->delete($this->where." and `uid`='$checkid'");
		$alogar = array(
			'name'		=> $nowcoursers['name'],
			'status'	=> $zt,//动作值
			'statusname'=> $ztname,//动作名称
			'explain'	=> $sm,//说明
			'checkname'	=> $checkname,//当前审核人名称
			'checkid'	=> $checkid,//当前审核人ＩＤ
			'color'		=> $color,//red
			'courseid'	=> $nowcourseid//当前节点ＩＤ
		);
		
		//转给谁办,还是在此节点，但是转给别人办理了
		if(!$this->isempt($zyna) && !$this->isempt($zyid) && $zt==1){
			$this->addchecks($zyid, $nowcourseid, $checkid, $checkname);
			$isback = 0;
			$alogar['courseid'] 	= 0;//不计入流程节点日志
			$alogar['statusname'] 	= '转办';
			$alogar['color'] 		= '#ff6600';
			if($sm==''){$sm='转给：'.$zyna.'';}else{$sm .='，转给：'.$zyna.'';}
			$alogar['explain']		= $sm;
		}
		
		$loid 			= $this->addlog($alogar);//写日志
		$fileid			= $this->rock->post('fileid');//文件信息
		m('file')->addfile($fileid, 'flow_log', $loid);		
		
		$nextcheckid	= '';
		$narr			= $this->getrule(true);//生成新的规则
		if($isback == 0){//不退回
			$nextcheckid	= $narr['nowuserid'];//当前节点，还没有审核的用户
		}
		
		$uparr	= array(
			$this->nstatusfields	=> $zt, //nsstatus
			$this->statusmanfields	=> $checkname, 
			$ztfields				=> '0'//status
		);
		if($isback == 1)$uparr[$ztfields] = $zt;//动作值
						
		if($narr['step'] == 0 || $isendre){
			if($zt>2){
				$uparr[$ztfields] 	= 1;
			}else{
				$uparr[$ztfields] 	= $zt;//这个值待确认？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？　不是０
			}
			$isend			 	= 1;//是否结束
		}
		$this->mdb->record($uparr, "`id`='$this->id'");//修改申请表的状态信息			
		
		
		$this->flowcheckjudge($nowcoursers, $this->nowcoursers, $zt, $sm);//空操作
		
		//前置审核判断(弃用)
		/*
		if(!$this->rock->isempt($nextcheckid) && !$_shcnarr && 1==2){
			$tempshrid	= (int)$this->dblog->getmou('checkid', "$this->where and `courseid`>0 and `status`=1 and `checkid` in($nextcheckid)");
			if($tempshrid > 0){
				$msg	= $this->check(1, '前置自动审核', $tempshrid);
				return $msg;
			}
		}		 
		 */				
		
		if($isback == 1){//退回操作
			$this->nexttodocl($this->uid, 'nothrough', $sm, array('ztname'=>$ztname,'sm'=>$sm,'checkname'=>$checkname,'checkid'=>$checkid));
			$this->flownothrough($sm);//退回，并写说明      空操作
		}		
		
		if($isend == 1){
			$this->endflow($zt,$sm);	//结束流程
		}else{
			if(!$this->rock->isempt($nextcheckid)){
				$this->nexttodocl($nextcheckid, 'next', $sm);
			}
		}
		return $msg;
	}
	
	private function endflow($zt,$sm)
	{
		if($zt==1 || $zt==3){
			$this->dbrule->delete($this->where);//删除规则
			$this->nexttodocl($this->uid, 'finish', $sm);
			$this->flowthrough($sm);//空操作
		}
	}

	public function flowdelete($sm='')
	{
		$msg = '';
		if($this->rs[$this->statusfields]==1)$msg = '已完成不允许删除';
		if($msg == '' && $this->uid != $this->adminid && $this->rs['optid'] != $this->adminid)$msg='不是您的单据';
		if($msg == ''){
			$this->mdb->update("`$this->statusfields`=5", $this->id);
			$this->dbrule->delete($this->where);
			$this->db->update('[Q]flow_bill', "`isdel`=1", $this->where);
			$this->addlog(array(
				'name'		=> '删除',
				'explain'	=> $sm
			));
			$this->dbtodo->delete($this->where);
			m('im_mess')->delete($this->where);
		}
		return $msg;
	}
	
	public function addzhuijia($sm='',$fileid='')
	{
		$msg = '';
		if($this->rs[$this->statusfields]==1)$msg = '已完成不用追加';
		if($msg == '' && $this->uid != $this->adminid && $this->rs['optid'] != $this->adminid)$msg='不是您的单据';
		if($msg == ''){
			$this->mdb->update("`$this->statusfields`=0", $this->id);
			$this->addlog(array(
				'name'		=> '追加说明',
				'explain'	=> $sm
			));
			if($fileid!='')m('file')->addfile($fileid, $this->table, $this->id);
			if($this->rs[$this->statusfields]==2)$this->nexttodocl($this->rs['nowcheckid'], 'next', $sm);
		}
		return $msg;
	}
	
	
	
	
	
	
	
	

	public function reloadpipei()
	{
		return $this->reloadpipeisss();
	}
	private function reloadpipeisss()
	{
		$whre	= $this->dbwhere->getstring('flowset_'.$this->flownum);
		$where	= "`isturn`=1  and ifnull(`uid`, 0)>0 and `status`<>1 and `status`<>5 and `uid` in(select `id` from `[Q]admin` where `status`=1) $whre";
		$rows	= $this->mdb->getall($where, '`id`');
		$total	= $this->db->count;
		$str	= '';
		$piep	= $wclt	= $ycli	= 0;
		$pieid	= $wclid = $yclid	= '0';
		$oic	= 0;
		$oistr	= '';
		foreach($rows as $k=>$rs){
			$bid	= $rs['id'];
			$this->initrecord($bid);
			$ztar	= $this->repipeirule();
			$zt		= $ztar[0];
			if($zt == 1){
				$piep++;
				$pieid.=','.$bid.'';
			}
			if($zt == 2){
				$yclid.=','.$bid.'';
				$ycli++;
			}
			if($zt == 3){
				$wclid.=','.$bid.'';
				$wclt++;
			}
			if($ztar[1] != ''){
				$oic++;
				$oistr.=''.$oic.'、【ID:'.$bid.','.$this->urs['name'].'】: '.$ztar[1].'<br>';
			}
		}
		$msg = '['.$this->flowname.']共记录'.$total.'条,重新匹配<font color="blue">('.$piep.')</font>条,异常<font color="red">('.$ycli.')</font>条,完成<font color="#ff6600">('.$wclt.')</font>条。<br>';
		$mess= ''.$msg.'重新匹配ID['.$pieid.'],异常ID['.$yclid.'],完成ID['.$wclid.']<br>'.$oistr.'<br>';
		return array($msg, $mess, $piep, $wclt);
	}
	private function repipeirule()
	{
		$olda	= $this->dbrule->getone($this->where);
		$lea	= 0;
		$leas	= '';
		if(!$olda){
			$tea_ra	= $this->getrule(true);
			$lea	= 1;
			$leas	= '新建流程为【'.$tea_ra['alluser'].':'.$tea_ra['alluserid'].'】;';
			return array($lea, $leas);
		}
		$newa	= $this->getrule(false);
		$bofda	= $this->rock->isempt($newa['nowuserid']);
		if($newa['step'] == 0 || $bofda){
			if($newa['step'] == 0 && $bofda){
				$ztss 	= $newa['nstatus'];
				$uparr	= array($this->statusfields	=> $ztss);
				$this->mdb->record($uparr, "`id`='$this->id'");
				$this->endflow($ztss);
				$lea	= 3;
				$leas	= '标识为'.$ztss.';';
			}else{
				$this->ruleupdate($newa);
				$leas	= '异常,当前没有审核人;';
				$lea	= 2;
			}
		}else{
			$ostep = (int)$olda['step'];
			$oldcid	= explode('|', $olda['allcourseid']);
			$olduid	= explode('|', $olda['alluserid']);
			$oldcstr= ''; $oldustr='';
			if($ostep>0){
				for($i=$olda['step']-1; $i<$olda['allstep']; $i++){
					$oldcstr.='|'.$oldcid[$i].'';
					$oldustr.='|'.$olduid[$i].'';
				}
			}
			$newcid	= explode('|', $newa['allcourseid']);
			$newuid	= explode('|', $newa['alluserid']);
			$newcstr= ''; $newustr='';
			for($i=$newa['step']-1; $i<$newa['allstep']; $i++){
				$newcstr.='|'.$newcid[$i].'';
				$newustr.='|'.$newuid[$i].'';
			}
			if($oldcstr != $newcstr || $oldustr != $newustr){
				$this->ruleupdate($newa);
				$leas	= '【'.$olda['alluser'].'：'.$olda['alluserid'].'】→【'.$newa['alluser'].'：'.$newa['alluserid'].'】;';
				$lea	= 1;
			}
		}
		return array($lea, $leas);
	}
}