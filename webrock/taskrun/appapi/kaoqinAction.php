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
	* 修改时: 2016-05-09 20:15:32									*	
	*****************************************************************
*/
 class kaoqinClassAction extends appapiAction{public function wxdkAjax(){$user= $this->post('user');$location_x= $this->post('location_x');$location_y= $this->post('location_y');$scale= $this->post('scale');$label= base64_decode($this->post('label'));$this->adddaka($user, $location_x, $location_y, $scale, $label);}public function dwdkAjax(){$location_x= $this->get('location_x');$location_y= $this->get('location_y');$scale= $this->get('scale');$label= $this->getvals('label');$this->adddaka($this->adminid, $location_x, $location_y, $scale, $label);}private function adddaka($user='', $location_x, $location_y, $scale, $label){$msg = '';if($user=='')$msg='error1';$uid = 0;$finge = $name= '';$urs = m('admin')->getone("1 and (`user`='$user' or `id`='$user')", "`id`,`finge`,`name`,`user`");if($urs){$uid = $urs['id'];$finge = $urs['finge'];$name = $urs['name'];$user = $urs['user'];}$arr = array('user' => $user,'optdt' => $this->rock->now,'uid' => $uid,'location_x' => $location_x,'location_y' => $location_y,'scale' => $scale,'label' => $label);if($msg==''){$bo = m('wx_location')->insert($arr);if($bo){$lid = $this->db->insert_id();m('kq_dkjl')->insert(array('finge'=> $finge,'name'=> $name,'checktime'=> $this->rock->now,'web'=> $this->rock->web,'ip'=> $this->rock->ip,'type'  => '3','locationid'=> $lid));}else{$msg='error2';}}$this->showreturn('', $msg);}public function getlocationAjax(){$rows = m('wx_location')->getall("`uid`='$this->adminid' order by `id` desc limit 5");$this->showreturn($rows);}public function getdkjlAjax(){$month= $this->get('month', date('Y-m'));$arr = m('kaoqin')->getdkjl($this->userrs['finge'], $month);$this->showreturn($arr);}public function getanayAjax(){$month= $this->get('month', date('Y-m'));$arr = m('kaoqin')->getanay($this->adminid, $month);$this->showreturn($arr);}}