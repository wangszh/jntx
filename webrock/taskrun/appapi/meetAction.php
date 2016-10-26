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
	* 修改时: 2016-05-09 20:15:35									*	
	*****************************************************************
*/
 class meetClassAction extends appapiAction{public function getcansAjax(){$hyname = $this->option->getmnum('meeting','name');$this->showreturn(array('hyname'=> $hyname));}public function getmeetAjax(){$dt = $this->date;$dtobj = c('date', true);$arr= array();for($i=0; $i<3; $i++){$dt = $dtobj->adddate($dt, 'd', $i);$zts = '今日';if($i==1)$zts = '明天';if($i==2)$zts = '后天';$meet = m('meet')->getmeet($dt, $this->adminid);if(count($meet)>0){$week = $this->rock->cnweek($dt);$arr['['.$zts.']'.$dt.'(周'.$week.')'] = $meet;}}$this->showreturn($arr);}public function saveAjax(){$arr = array('hyname' => $this->getvals('hyname'),'title' => $this->getvals('title'),'startdt' => $this->getvals('startdt'),'enddt' => $this->getvals('enddt'),'explain' => $this->getvals('explain'),'joinname' => $this->getvals('joinname'),'applydt' => $this->date,'joinid' => $this->getvals('joinid'),'istz' => $this->getvals('istz','0'),'optdt'  => $this->now,'optid'  => $this->adminid,'uid'  => $this->adminid,'optname'  => $this->adminname,);foreach($arr as $k=>$v){if($k=='explain')break;if($this->isempt($v))$this->showreturn('',''.$k.' is empty',201);}$msg  = m('meet')->isapplymsg($arr['startdt'], $arr['enddt'], $arr['hyname']);if($msg!='')$this->showreturn('', $msg, 201);m('meet')->insert($arr);$id = $this->db->insert_id();$msg = $this->submitflow($id, 'meet');$this->showreturn($msg);}}