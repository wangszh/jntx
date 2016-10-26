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
	* 修改时: 2016-05-09 20:15:40									*	
	*****************************************************************
*/
 class userClassAction extends appapiAction{public function gereninforAjax(){$uid = $this->get('uid', $this->adminid);$rs = m('admin')->getone($uid,'`name`,`user`,`deptname`,`ranking`,`face`,`companyid`,`tel`,`mobile`,`email`,`gender`');$rs['company'] = m('company')->getmou('name',"`id`='".$rs['companyid']."'");$this->showreturn($rs);}public function getdeptadminAjax(){$arr['dept'] = $this->getdept(0);$arr['user'] = $this->getadmin(0);$this->showreturn($arr);}public function getdeptAjax(){$str = $this->getdept(0);$this->showreturn($str);}public function getuserAjax(){$str = $this->getadmin(0);$this->showreturn($str);}public function getdept($lx=0){$rows = m('dept')->getall("1 order by `pid`,`sort`", '`id`,`name`,`pid`');if($lx==0){$str = '';foreach($rows as $k=>$rs){$str.=','.$rs['id'].'|'.$rs['name'].'|'.$rs['pid'].'';}if($str!='')$str=substr($str,1);return $str;}else{return $rows;}}public function getadmin($lx=0){$rows = m('admin')->getall("`status`=1 and `state`<>5 order by `sort`", '`id`,`name`,`deptid`,`deptname`,`ranking`,`face`');if($lx==0){$str = '';foreach($rows as $k=>$rs){$str.=','.$rs['id'].'|'.$rs['name'].'|'.$rs['ranking'].'|'.$rs['deptname'].'|'.$rs['deptid'].'|'.$rs['face'].'';}if($str!='')$str=substr($str,1);return $str;}else{return $rows;}}}