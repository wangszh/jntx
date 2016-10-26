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
	* 修改时: 2016-05-09 20:15:21									*	
	*****************************************************************
*/
 class flow_dailyClassAction extends appapiAction{private function saverecord($dts=0, $content='', $plan=''){$id = 0;$msg = '';$dt = $this->date;$dtobj= c('date', true);if($dts!=0)$dt = $dtobj->adddate($dt, 'd', $dts);$db = m('daily');$tos= $db->rows("`dt`='$dt' and `uid`='$this->adminid'");if($tos >0 ){$msg = '['.$dt.']日报已写过了';}if($msg == '' && $content=='')$msg='内容不能为空';if($msg == ''){$arr = array('uid' => $this->adminid,'optid' => $this->adminid,'dt' => $dt,'content' => $content,'plan' => $plan,'optdt' => $this->now,'adddt' => $this->now,'type' => '0','optname' => $this->adminname,);$db->insert($arr);$id = $this->db->insert_id();$this->filesave('daily',$id);$msg= 'success';}$this->showreturn($msg);}public function saveAjax(){$dts= (int)$this->post('dts','0');$content= $this->post('content');$this->saverecord($dts, $content);}public function savewebAjax(){$dts= (int)$this->getvals('dts');$content= $this->getvals('content');$plan= $this->getvals('plan');$this->saverecord($dts, $content, $plan);}}