<?php
/**
	*****************************************************************
	* 联系QQ：290802026/1073744729									*
	* QQ  群：429403774，提供技术交流等								*
	* 版  本：V2.2+													*
	* 开发者：RockOA研发中心/雨中磐石工作室							*
	* 邮  箱：admin@rockoa.com										*
	* 网  址：http://www.rockoa.com/								*
	* 说  明: 核心代码/或者在线安装代码								*
	* 备  注: 未经允许不得商业出售，代码欢迎参考纠正				*
	* 修改时: 2016-05-09 20:15:29									*	
	*****************************************************************
*/
 class gongClassAction extends appapiAction{public function getinforAjax(){$stype= (int)$this->get('stype','0');$sid = m('log')->getread('infor', $this->adminid);$s1 = m('admin')->getjoinstr('faobjid', $this->adminid);if($stype==1)$s1.=" and `id` not in($sid)";$s = 'isshow=1 '.$s1.' order by xu,optdt desc limit 15';$rows= m('infor')->getall($s,'id,typename,title,optdt');$sid = ','.$sid.',';foreach($rows as $k=>$rs){$wd = 1;if($this->contain($sid, ','.$rs['id'].','))$wd=0;$rows[$k]['wd'] = $wd;}$arr['rows']= $rows;$arr['wdshu']= m('gong')->getwdto($this->adminid);$this->showreturn($arr);}public function viewinforAjax(){$id = $this->get('id');$rs = m('infor')->getone($id);m('log')->addread('infor', $id);$this->showreturn($rs);}public function savegongAjax(){$arr = array('title' => $this->getvals('title'),'typenum' => 'notice','typename' => $this->getvals('typename'),'content' => $this->getvals('content'),'zuozhe' => $this->getvals('zuozhe'),'faobjname' => $this->getvals('faobjname'),'faobjid' => $this->getvals('faobjid'),'indate'  => $this->now,'optdt'  => $this->now,'isshow'  => 1,'optid'  => $this->adminid,'optname'  => $this->adminname,);foreach($arr as $k=>$v){if($k=='typename')break;if($this->isempt($v))$this->showreturn('',''.$k.' is empty',201);}m('infor')->insert($arr);$id = $this->db->insert_id();$msg = $this->submitflow($id, 'gong');$this->showreturn($msg);}}