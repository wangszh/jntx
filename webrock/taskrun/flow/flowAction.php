<?php 
if(!defined('HOST'))exit('not access');

class flowClassAction extends ActionNot{
	
	public function initAction()
	{
		if($this->adminid==0){
			if(isajax()){
				$this->backmsg('not sign');
			}else{
				echo '<script>location.href="?m=login&ltype=1"</script>';
			}
			exit();
		}
	}
	
	public function checkAjax()
	{
		$flownum	= $this->post('flownum');//流程号
		$id			= (int)$this->post('id');//申请ＩＤ
		$cid		= $this->adminid;//当前用户ＩＤ
		$zt			= (int)$this->post('zt');//处理动作 =2需要说明        1通过　2不通过
		$courseid	= (int)$this->post('courseid');//节点ＩＤ
		$checkid	= $this->post('nextcheckid');//下一个节点审核人ＩＤ
		$zyname		= $this->post('zyname');//转给其他人name
		$zynameid	= $this->post('zynameid');//转给其他人ID
		$sm			= $this->post('sm');//说明
		if($flownum==''||$id==0||$cid==0)exit('sorry;');
		$flow = f($flownum);//webrockAction.php的最后一个函数     加载一个工作流插件，并初始化执行
		$flow->adminid 		= $cid;
		$flow->adminname 	= m('admin')->getmou('name',"`id`='$cid'");
		$flow->initrecord($id);//初始化本申请的工作流 　　id为申请ＩＤ    主要写bill表savebill
		$msg = $flow->check($zt, $sm, $cid, $checkid, $zyname, $zynameid);//flowChajian.php 875行
		echo $msg;
	}
	
	public function addlogAjax()
	{
		$flownum	= $this->post('flownum');
		$id			= (int)$this->post('id');
		//$cid		= (int)$this->post('cid');
		$cid		= $this->adminid;
		$name		= $this->post('name');
		$zt			= $this->post('zt');
		if($zt=='')$zt=$name;
		$sm			= $this->post('sm');
		if($flownum==''||$id==0||$cid==0||$sm=='')exit('sorry;');
		$flow = f($flownum);
		$flow->adminid 		= $cid;
		$flow->adminname 	= m('admin')->getmou('name',"`id`='$cid'");
		$flow->initrecord($id);
		$flow->addlogs($zt,$name,$sm);
		echo 'success';
	}
	
	/**
		流程单据查看
	*/
	public function viewAction()
	{
		$this->tpltype = 'html';
		
		$uid		= $this->adminid;
		$modenum	= $this->jm->gettoken('modenum');
		$table		= $this->jm->gettoken('table');
		$notitle	= $this->jm->gettoken('notitle');
		$mid		= (int)$this->jm->gettoken('mid');
		$dbs 		= m('flowlog');
		$modenum	= $dbs->getmodenum($table, $mid, $modenum);
		if($modenum == '' || $mid==0)exit('not found data');
		
		$flow		= f($modenum);
		$flow->initrecord($mid);
		if(!$flow->rs)exit('记录不存在');
		
		$this->title					= $flow->flowname;
		$this->smartydata['content']	= $flow->contentview();//加载申请内容查看内容/include/chajian/flowChajian.php
		
		$table 		= $flow->table;
		$arr		= $dbs->getdatalog($modenum, $table, $mid, $uid);
		$this->smartydata['arr']		= $arr;
		$this->smartydata['urs']		= m('admin')->getall("`id` in($uid) order by `sort`",'`id`,`name`,`ranking`');
		$this->smartydata['inputrs']	= $arr['inputrs'];
		$this->smartydata['notitle']	= $notitle;
		$this->smartydata['uid']		= $uid;
		$torsk	= $this->get('rocktoken','',1);
		if($torsk!=''){
			$torsk=$this->jm->encrypt(str_replace('a=view','a=print', $torsk));
			foreach($_GET as $k=>$v)if($k!='rocktoken')$torsk.='&'.$k.'='.$v.'';
		}
		$this->smartydata['printurl']	= $torsk;
		
		$spagepath 	= ROOT_PATH.'/webrock/flow/applyview/page/page_'.$modenum.'_spage.html';
		
		if(!file_exists($spagepath)){
			$spagepath = '';
		}
		
		$this->smartydata['spagepath']		= $spagepath;
	}
	
	public function printAction()
	{
		$this->tpltype = 'html';
		$uid		= $this->jm->gettoken('uid');
		$uid		= $this->adminid;
		$modenum	= $this->jm->gettoken('modenum');
		$table		= $this->jm->gettoken('table');
		$mid		= (int)$this->jm->gettoken('mid');
		$notitle	= $this->jm->gettoken('notitle');
		$dbs 		= m('flowlog');
		$modenum	= $dbs->getmodenum($table, $mid, $modenum);
		if($modenum == '' || $mid==0)exit('not found data');
		
		$flow		= f($modenum);
		$flow->initrecord($mid);
		if(!$flow->rs)exit('记录不存在');
		
		$this->title					= $flow->flowname;
		$this->smartydata['content']	= $flow->contentview('print');
		$this->smartydata['notitle']	= $notitle;
		$torsk	= $this->get('rocktoken','',1);
		if($torsk!=''){
			$torsk=$this->jm->encrypt(str_replace('a=print','a=word', $torsk));
			foreach($_GET as $k=>$v)if($k!='rocktoken')$torsk.='&'.$k.'='.$v.'';
		}
		$this->smartydata['wordurl']	= $torsk;
	}
	
	public function wordAction()
	{
		$this->printAction();
		$filename = $this->title.'.doc';
		header('Content-type:application/msword');
		header('Content-disposition:attachment;filename='.iconv("utf-8","gb2312", $filename).'');
	}
}