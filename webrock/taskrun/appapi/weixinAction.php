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
	* 修改时: 2016-05-09 20:15:41									*	
	*****************************************************************
*/
 class weixinClassAction extends appapiAction{public function getsignAjax(){$url = $this->getvals('url');$arr = m('weixin:signjssdk')->getsignsdk($url);$this->showreturn($arr);}}