<?php 
if(!defined('HOST'))exit('not access');
class indexClassAction extends Action{
	
	public $allmenuid	= '';
	
	public function defaultAction()
	{
		$this->tpltype	= 'html';
		$this->rock->savesession(array(QOM.'adminallmenuid'	=> $this->getuserext($this->adminid)));
		$this->allmenuid			= $this->getsession('adminallmenuid');
		
		$mewhere	= '';
		$myext		= $this->allmenuid;
		$admintype	= '1';
		if($myext != '-1'){
			$admintype	= '0';
			$mewhere	= ' and `id` in('.str_replace(array('[',']'), array('',''), $myext).')';
		}
		$menu							= $this->db->getrows('[Q]menu',"`pid`=0 and `status`=1 $mewhere",'`id`,`name`,`icons`','`sort`');
		$my								= $this->db->getone('[Q]admin', $this->adminid, '`id`,`name`,`deptname`,`ranking`,`face`,`style`,`loginci`,`deptid`,`user`');
		if(!$my)exit('sorry!');
		$dept							= $this->db->getone('[Q]dept', $my['deptid']);
		

		$this->smartydata['menu']		= json_encode($menu); 
		$this->smartydata['my']			= $my;
		$this->smartydata['admintype']	= $admintype;
		$this->smartydata['dept']		= $dept;
		$this->smartydata['face']		= $this->rock->repempt($my['face'], 'images/noface.jpg');
		$this->smartydata['systemtitle']= $this->option->getval('systemtitle');
		$this->smartydata['systemlogo']	= $this->option->getval('systemlogo', 'images/icons40.png');
		
		$style  = (int)$this->rock->repempt($my['style'], '0');
		$stylea	= array('classic','neptune','access','gray');
		$this->smartydata['style']		= $style;
		$this->smartydata['stylenep']	= $stylea[$style];
	}
	
	public function changestyleAjax()
	{
		$xu = $this->get('xu');
		m('admin')->update("`style`='$xu'", $this->adminid);
	}

	/**
		获取菜单
	*/
	public function getmenuAjax()
	{
		$pid				= (int)$this->get('pid');
		$this->allmenuid	= $this->getsession('adminallmenuid');
		if($pid == 4){
			$menu = $this->getmenuchang();
		}else{
			$where	= "`pid`='$pid'";
			$menu	= $this->getmenu($where);
		}
		echo json_encode($menu);
	}
	public function getmenu($whe)
	{
		$stotal	= $this->db->getsql(array('table'	=> '[Q]menu',	'fields'=> 'count(1)',	'where'	=> '`pid`=a.`id` and `status`=1'));
		$menu	= $this->db->getrows('`[Q]menu` a', "$whe and `status`=1", '`name`,`id`,`icons`,`url`,`num`,`isopen`,`ischeck`,('.$stotal.')as `stotal`', '`sort`');
		$rows	= array();
		foreach($menu as $k=>$rs){
			$id	= $rs['id'];
			$st = $rs['stotal'];
			$children = false;
			if($id==4){
				$children=$this->getmenuchang();
			}
			$sd	= '['.$id.']';
			$num= $rs['num'];
			$rs['text'] = $rs['name'];
			if($this->isempt($num))$num = 'menunum_'.$id.'';
			$bo	= true;
			$rs['leaf'] = true;
			if(!$this->isempt($rs['icons']))$rs['icon']='mode/icons/'.$rs['icons'].'.png';
			if($rs['isopen']==1)$rs['expanded'] = true;
			
			if($st>0 || $children){
				$rs['leaf'] 	= false;
				if(!$children)$children	= $this->getmenu("`pid`='$id'");	
				$rs['children']	= $children;
				if(count($children)<=0)$bo=false;
			}else{
				if(!$this->contain($this->allmenuid,$sd))$bo = false;
			}
			$rs['stotal']	= $st;
			if($this->allmenuid == '-1')$bo = true;
			$rs['num']		= $num;
			$rs['menutype']	= 'sys';
			if($bo)$rows[]	= $rs;
		}
		return $rows;
	}
	
	//常用菜单
	public function getmenuchang()
	{
		$arr = array();
		$rows = m('menucom')->getall("`uid`='$this->adminid' order by `sort`,`id`");
		foreach($rows as $k=>$rs){
			$arr[] = array(
				'leaf' => true,
				'name' => $rs['name'],
				'text' => $rs['name'],
				'icon' => $rs['icon'],
				'icons' => str_replace(array('mode/icons/','.png'),array('',''), $rs['icon']),
				'url' => $rs['url'],
				'num' => $rs['num'],
				'menutype' => 'cy'
			);
		}
		return $arr;
	}
	
	//添加常用
	public function addchangmenuAjax()
	{
		$num = $this->post('num');
		if($num=='')return;
		$db 	= m('menucom');
		$where 	= "`num`='$num' and `uid`='$this->adminid'";
		if($db->rows($where)==0)$where='';
		$db->record(array(
			'uid' => $this->adminid,
			'url' => $this->post('url'),
			'num' => $this->post('num'),
			'name' => $this->post('name'),
			'icon' => $this->post('icon'),
			'menuid' => $this->post('menuid'),
			'optdt' => $this->now
		), $where);
	}

	/**
		查看菜单权限
	*/	
	private function getuserext($uid)
	{
		$guid 	= '-1';
		if($this->adminuser=='admin')return $guid;
		$gasql	= " ( id in( select `sid` from `[Q]sjoin` where `type`='ug' and `mid`='$uid') or id in( select `mid` from `[Q]sjoin` where `type`='gu' and `sid`='$uid') )";//用户所在组id
		$gsql	= "select `id` from `[Q]group` where $gasql ";
		$owhe	= " and (`id` in(select `sid` from `[Q]sjoin` where ((`type`='um' and `mid`='$uid') or (`type`='gm' and `mid` in($gsql) ) ) ) or `id` in(select `mid` from `[Q]sjoin` where ((`type`='mu' and `sid`='$uid') or (`type`='mg' and `sid` in($gsql) )) ))";
		if($this->db->rows('`[Q]group`',"`ispir`=0 and $gasql")>0){	//不用权限验证的用户
			$owhe=''; 
			return $guid;
		}
		$guid	= '[0]';
		if($owhe != ''){
			$arss	= $this->db->getall("select `id`,`pid`,(select `pid` from `[Q]menu` where `id`=a.`pid`)as `mpid` from `[Q]menu` a where (`status` =1 $owhe) or (`status` =1 and `ispir`=0) order by `sort`");
			foreach($arss as $ars){
				$guid.=',['.$ars['id'].']';
				$bpid	= $ars['pid'];
				$bmpid	= $ars['mpid'];
				if(!$this->rock->contain($guid, '['.$bpid.']')){
					$guid.=',['.$bpid.']';
				}
				if(!$this->rock->isempt($bmpid)){
					if(!$this->rock->contain($guid, '['.$bmpid.']')){
						$guid.=',['.$bmpid.']';
					}
				}
			}
		}
		return $guid;
	}
	
	public function testAction()
	{
		$this->display = false;
		echo c('reim')->send($this->adminid, $this->adminid,array(
			'cont' 	=> $this->jm->base64encode('testcont'),
			'type' 	=> 'user',
			'now' 	=> $this->now,
			'messid' => 0
		));
	}
	
	
	public function getmnumAjax()
	{
		$mnum	= $this->rock->request('mnum');
		$leval	= (int)$this->rock->request('showlevel');
		$rows	= $this->option->getmnum($mnum);
		$arr 	= array();
		foreach($rows as $k=>$rs){
			$arr[] 	= $rs;
			$num	= $rs['num'];
			if(!$this->isempt($num) && $leval==2){
				$rowss = $this->option->getmnum($num);
				foreach($rowss as $k1=>$rs1){
					$rs1['name'] = $rs1['name'];
					$arr[] = $rs1;
				}
			}
		}
		echo json_encode($arr);
	}
	
	
	public function getqrcodeAjax()
	{
		$an  = m('log')->ismode(8);
		if($an){
			//$url = 'http://m.rockoa.com/login.html?url='.$this->jm->base64encode(URL).'';
			$url = 'http://m.rockoa.com/login.html?url='.$this->jm->base64encode(URL).'&token='.$this->admintoken.'&user='.$this->jm->base64encode($this->adminuser).'';
			$img = c('qrcode')->show($url);
			$s = '<div >';
			$s.='<img src="'.$img.'?'.time().'" width="130" height="130">';
			$s.='</div>';
			$s.='<div>直接扫一扫即可登录</div>';
			echo $s;
		}else{
			echo '<div style="padding:10px" align="left">系统还未安装API无法使用手机版<br>请到【系统管理→辅助功能→模块安装升级】下安装</div>';
		}
	}
	
	
	
	//获取预算年度列表时特殊处理
	public function deallistbudget($table,$rows)
	{		
		if(is_array($rows)){
			foreach($rows as $kv=>$vv)
			{
				if($vv['iscurrent']=='1'){
					$rows[$kv]['title']='<font color=red>'.$vv['name'].'</font>';
				}else{
					$rows[$kv]['title']=$vv['name'];
				}
			}
		}
		$bacarr	= array(			
			'rows'		=> $rows
		);
		return $bacarr;
	}
	
	
	//保存预算年度前特殊处理   只能一个当前年度　如果没有则根据当前年份自动选择
	public function beforesaveabudget($table,$rows,$id)
	{
		if($table =='' ){
			return;			
		}
		$db		= m($table);
		if(isset($rows['iscurrent'])){
			if($rows['iscurrent']==1){
				$db->update("`iscurrent`=0", "`iscurrent`=1");							
			}
		}
		return;
	}
	
	//保存预算年度后特殊处理   如果没有则根据当前年份自动选择
	public function aftersaveabudget($table,$rows,$id,$idadd)
	{
		if($table =='' ){
			return;
		}
		$db		= m($table);
		$rs=$db->getone("`iscurrent`=1",'`id`');
		if(!$rs){//没有当前年度的预算，则指定当前当前日期的预算为当前年度预算，如果还没有，则不做处理		
			$db->update("`iscurrent`=1", "`ndyear`=". date('Y'));
		}		
	}
	
	
	public function todoAction()
	{
		
	}
}