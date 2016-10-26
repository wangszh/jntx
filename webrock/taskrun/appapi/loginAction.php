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
	* 修改时: 2016-05-09 20:15:33									*	
	*****************************************************************
*/
 class loginClassAction extends appapiAction{private function checklogin(){$adminuser= $this->getvals('user');$adminpass= $this->getvals('pass');$arr = m('login')->start($adminuser, $adminpass);if(is_array($arr)){$arrs = array('uid' => $arr['uid'],'name' => $arr['name'],'user'=> $arr['user'],'pass'=> $adminpass,'deptname'  => $arr['deptname'],'face'  => $arr['face'],'token'  => $arr['token'],'splittime' => $this->splittime,'apikey'=> md5($this->appapikey));$this->showreturn($arrs);}else{$this->showreturn('', $arr, 201);}}public function checkloginwebAjax(){$this->checklogin();}public function checkloginAjax(){$this->checklogin();}public function exitloginAjax(){m('login')->exitlogin();$this->showreturn('success');}}