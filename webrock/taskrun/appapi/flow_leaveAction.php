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
	* 修改时: 2016-05-09 20:15:24									*	
	*****************************************************************
*/
 class flow_leaveClassAction extends appapiAction{private function saverecord($arr){$arrs = array('kind' => '请假','uid' => $this->adminid,'optid' => $this->adminid,'optdt' => $this->now,'applydt' => $this->date);foreach($arr as $k=>$v)$arrs[$k]=$v;$msg = '';if($this->isempt($arrs['qjkind']))$msg='请选择请假类型';if($msg=='' && $this->isempt($arrs['stime']))$msg='开始时间不能为空';if($msg=='' && $this->isempt($arrs['etime']))$msg='截止时间不能为空';if($msg=='' && $arrs['totals']<=0)$msg='总长(小时)不能小于0';if($msg=='' && $this->isempt($arrs['explain']))$msg='说明不能为空';if($msg==''){$dtobj = c('date');if(!$dtobj->isdate($arrs['stime']))$msg='开始时间格式有误';if($msg=='' && !$dtobj->isdate($arrs['etime']))$msg='截止时间格式有误';if($msg==''){$jg = $dtobj->datediff('i', $arrs['stime'], $arrs['etime']);if($jg<=0)$msg='开始时间不能大于截止时间';}}if($msg=='')$msg = m('kaoqin')->leavepan($arrs['uid'], $arrs['qjkind'], $arrs['stime'], $arrs['etime'], $arrs['totals']);if($msg == ''){m('kq_info')->insert($arrs);$id = $this->db->insert_id();$msg = $this->submitflow($id, 'leave');}$this->showreturn($msg);}public function saveAjax(){$arr = array('qjkind' => $this->post('qjkind'),'stime' => $this->post('stime'),'etime' => $this->post('etime'),'totals' => (int)$this->post('totals'),'explain' => $this->post('explain'));$this->saverecord($arr);}public function savewebAjax(){$arr = array('qjkind' => $this->getvals('qjkind'),'stime' => $this->getvals('stime'),'etime' => $this->getvals('etime'),'totals' => (int)$this->getvals('totals'),'explain' => $this->getvals('explain'));$this->saverecord($arr);}public function totalAjax(){$stime = $this->get('stime','', 1);$etime = $this->get('etime','', 1);$sj = ceil(m('kq')->getsbtime($stime, $etime));$this->showreturn($sj);}public function totalwebAjax(){$stime = $this->getvals('stime');$etime = $this->getvals('etime');$sj = ceil(m('kq')->getsbtime($stime, $etime));$this->showreturn($sj);}}