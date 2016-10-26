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
	* 修改时: 2016-05-09 20:15:25									*	
	*****************************************************************
*/
 class flow_waichuClassAction extends appapiAction{private function saverecord($arr){$arrs = array('uid' => $this->adminid,'optid' => $this->adminid,'optdt' => $this->now,'applydt' => $this->date);foreach($arr as $k=>$v)$arrs[$k]=$v;$msg = '';if($msg=='' && $this->isempt($arrs['atype']))$msg='外出类型不能为空';if($msg=='' && $this->isempt($arrs['outtime']))$msg='外出时间不能为空';if($msg=='' && $this->isempt($arrs['intime']))$msg='预计回岗不能为空';if($msg=='' && $this->isempt($arrs['address']))$msg='前往地址不能为空';if($msg=='' && $this->isempt($arrs['reason']))$msg='外出事由不能为空';if($msg==''){$dtobj = c('date');if(!$dtobj->isdate($arrs['outtime']))$msg='外出时间格式有误';if($msg=='' && !$dtobj->isdate($arrs['intime']))$msg='预计回岗格式有误';if($msg==''){$jg = $dtobj->datediff('i', $arrs['outtime'], $arrs['intime']);if($jg<=0)$msg='外出时间不能大于预计回岗时间';}}if($msg == ''){m('kq_out')->insert($arrs);$id = $this->db->insert_id();$msg = $this->submitflow($id, 'waichu');}$this->showreturn($msg);}public function saveAjax(){$arr = array('atype' => $this->post('atype'),'outtime'=> $this->post('outtime'),'intime' => $this->post('intime'),'address' => $this->post('address'),'reason' => $this->post('reason'),'explain' => $this->post('explain'));$this->saverecord($arr);}public function savewebAjax(){$arr = array('atype' => $this->getvals('atype'),'outtime'=> $this->getvals('outtime'),'intime' => $this->getvals('intime'),'address' => $this->getvals('address'),'reason' => $this->getvals('reason'),'explain' => $this->getvals('explain'));$this->saverecord($arr);}}