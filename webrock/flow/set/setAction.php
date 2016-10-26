<?php
class setClassAction extends Action
{
	
	public function pandtablelabefore($table, $cans)
	{
		$s = '';
		if($this->contain(URL, 'demo.'))$s='演示系统请不要修改,谢谢';
		return $s;
	}

	public function savefieldsAjax()
	{
		$id = $this->rock->post('id');
		m('flow_set')->record(array(
			'fields'	=> $this->rock->post('fields')
		), $id);
	}
	
	
	public function pipeiAjax()
	{
		$sid 	= $this->request('id');
		$rows	= m('flow_set')->getall("`id` in($sid) and `isflow`=1 and `table` is not null order by `sort`", 'num');
		$str	= '';
		$mess	= '';//邮件内容
		$naes	= '';
		
		foreach($rows as $k=>$rsss){
			$flow	 = f($rsss['num']);
			$arrs	 = $flow->reloadpipei();
			$str	.= ''.($k+1).'、'.$arrs[0];
		}
		echo $str;
	}
	
	public function pandtablela($table, $cans, $id)
	{
		$tab 		= $cans['table'];
		if($this->isempt($tab))return;
		$alltabls 	= $this->db->getalltable();
		if(!in_array(''.PREFIX.''.$tab.'', $alltabls)){
			$sql = "CREATE TABLE `[Q]".$tab."` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0',
  `isturn` tinyint(1) DEFAULT '0',
  `nowcheckid` varchar(50) DEFAULT NULL,
  `allcheckid` varchar(200) DEFAULT NULL,
  `nstatus` tinyint(1) DEFAULT '0',
  `statusman` varchar(20) DEFAULT NULL,
  `nowcheckname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;";
			$this->db->query($sql);
		}
	}
	
	
	public function pagesetAction()
	{
		$setid	= $this->get('setid');
		$atype	= $this->get('atype');
		$rs 	= m('flow_set')->getone("`id`='$setid'");
		if(!$rs)exit('sorry!');
		$this->smartydata['rs'] = $rs;
		$this->title  = $rs['name'].'_页面设置';
		
		$table  = $rs['table'];
		$farr	= c('edit')->getfield($table, 1);
		$fleft	= array();
		$fleft[]= array('base_name', '申请人');
		$fleft[]= array('base_deptname', '申请部门');
		$fleft[]= array('base_sericnum', '单号');
		foreach($farr as $k=>$rs1){
			$fleft[] = array($k, $rs1['name']);
		}
		$fleft[] = array('file_content', '相关文件');
		$this->smartydata['fleft'] = $fleft;
		$path 		= ''.ROOT_PATH.'/webrock/flow/applyview/page/page_'.$rs['num'].'';
		if($atype=='1')$path .= '_mobile';
		$path	   .= '.html';
		$content 	= '';
		if(file_exists($path)){
			$content = file_get_contents($path);
		}
		$this->smartydata['content'] = $content;
		$this->smartydata['atype'] 	= $atype;
	}
	
	public function pagesaveAjax()
	{
		$content = $this->post('content');
		$num 	 = $this->post('num');
		$atype 	 = $this->post('atype');
		$path 		= 'webrock/flow/applyview/page/page_'.$num.'';
		if($atype=='1')$path .= '_mobile';
		$path	   .= '.html';
		$this->rock->createtxt($path, $content);
		echo 'success';
	}
	
	public function createlistAjax()
	{
		$id	= (int)$this->get('id');
		$mors = m('flow_set')->getone($id,'`table`,`num`,`name`,`isflow`');
		if($mors['isflow']==0)$this->backmsg('不是有流程的模块，请自行开发');
		
		$farr = m('flow_element')->getall("`mid`='$id' and `iszb`=0 and `iszs`=1",'`fields`,`name`,`fieldstype`,`lattr`,`isss`,`width`','`sort`');
		$num  = $mors['num'];
		$keywhere = $this->jm->base64encode(m('where')->getstring('flowset_'.$num,'a.','b.'));
		$str 	 = "{'xtype':'rownumberer','width':40}";
		$str 	.= ",{'text':'申请人','dataIndex':'name','width':90,search:true}";
		$str 	.= ",{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true}";
		
		foreach($farr as $k=>$rs){
			$sea	= ($rs['isss']==1)?'true':'false';
			$width	= $rs['width'];
			$str	.= ",{'text':'".$rs['name']."','dataIndex':'".$rs['fields']."','atype':'".$rs['fieldstype']."','search':$sea";
			if(!$this->isempt($width)){
				if(is_numeric($width)){
					$str.=",'width':$width";
				}else{
					$str.=",'width':'$width'";
				}
			}
			if(!$this->isempt($rs['lattr']))$str.=",".$rs['lattr']."";
			$str	.= '}';
		}
		
		$str 	.= ",{'text':'状态','dataIndex':'status'}";
		
		$columns   = "[$str]";
		$path 	   = 'webrock/flow/applylist/ext_applylist_'.$num.'script.js';
		$oldcont 	= file_get_contents($path);
		$autoquye	= $this->rock->getcai($oldcont,'//[自定义区域start]','//[自定义区域end]');
$str = "/**
*	模块【".$num.".".$mors['name']."】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：$this->now
*	创建人：$this->adminname
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'$num',
	tablename:'".$mors['table']."',defaultorder:'id desc',url:publiccheckstore('mode_".$num."|input','flow'),
	formtitle:'".$mors['name']."',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode('$keywhere'),
	columns:$columns
};
//[自定义区域start]

$autoquye

//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;";
		
		$this->rock->createtxt($path, $str);
		$this->backmsg('','ok');
	}
}