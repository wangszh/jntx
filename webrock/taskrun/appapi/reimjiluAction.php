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
	* 修改时: 2016-05-09 20:15:49									*	
	*****************************************************************
*/
 class reimjiluClassAction extends appapiAction{public function dataAjax(){$atype = $this->request('atype');$sid   = $this->request('sid');$aid   = $this->adminid;$page  = (int)$this->request('page', '1');$fen= 20;$whes= $this->rock->dbinstr('receuid', $aid);$where = "";if($atype == 'user'){$where = "and ((`sendid`=$aid and `receid`=$sid) or (`sendid`=$sid and `receid`=$aid)) and $whes ";}if($atype == 'group' || $atype == 'agent' || $atype == 'dept'){$where = "and `receid`=$sid and $whes ";}$count  = m('im_mess')->rows("`type`='$atype' $where");$maxpage= ceil($count / $fen);$sql= "select * from [Q]im_mess where `type`='$atype' $where order by `id` desc limit ".(($page-1)*$fen).",$fen";$rows   = $this->db->getall($sql);$snid = '0'; foreach($rows as $k=>$rs){$snid .=','.$rs['sendid'];}if($snid != '0'){$uarr = m('admin')->getall("`id` in($snid)", '`id`,`name`,`face`');$_ursa= array();foreach($uarr as $k=>$rs){$face = $rs['face'];if(!$this->isempt($face)){$face=URL.$face;}else{$face= 'images/im/user100.png';}$rs['face'] = $face;$_ursa[$rs['id']] = $rs;}foreach($rows as $k=>$rs){$rows[$k]['sendname'] = $_ursa[$rs['sendid']]['name'];$rows[$k]['sendface'] = $_ursa[$rs['sendid']]['face'];}}$arr = array('data'=> $rows,'count'=> $count,'page'=> $page,'maxpage' => $maxpage);$this->showreturn($arr);}public function delrecordAjax(){$ids = $this->get('ids');m('reim')->setyd($ids, $this->adminid);$dbs = m('im_mess');$rows = $dbs->getall("`id` in($ids)", '`receuid`,`id`');$xids= '0';foreach($rows as $k=>$rs){$sid = $rs['id'];if($this->isempt($rs['receuid'])){$xids.=','.$sid.'';}else{$ssid  = '';$uidsa = explode(',', $rs['receuid']);foreach($uidsa as $suid){if($suid != $this->adminid){$ssid.=','.$suid.'';}}if($ssid==''){$xids.=','.$sid.'';}else{$ssid = substr($ssid,1);$dbs->update("`receuid`='$ssid'", $sid);}}}if($xids!='0')$dbs->delete("`id` in($xids)");$this->showreturn('');}}