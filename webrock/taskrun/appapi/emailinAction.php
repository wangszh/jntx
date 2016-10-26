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
	* 修改时: 2016-05-09 20:15:45									*	
	*****************************************************************
*/
 class emailinClassAction extends appapiAction{public function getdataAjax(){$page= (int)$this->request('page','1');$protype= (int)$this->request('atype','0');$uid = $this->adminid;$dt = $this->date;$s = m('emailin')->getstrwhere($protype, $uid);$fen = 5;$count = $this->db->rows("[Q]emailm", "id>0 and $s");$sql= "select `id`,`title`,`sendname`,`recename`,`senddt` from `[Q]emailm` where id>0 and $s order by `senddt` desc limit ".(($page-1)*$fen).",".$fen."";$rows = $this->db->getall($sql);$dtc = c('date');foreach($rows as $k=>$rs){$rows[$k]['senddt'] = $dtc->stringdt($rs['senddt'],'Y-m-d(周w)H:i');}$maxpage= ceil($count/$fen);$wwctotal= m('emailin')->getwdtotal($uid);$this->showreturn(array('rows'=> $rows,'count' => $count,'maxpage' => $maxpage,'page' => $page,'wwctotal'=> $wwctotal));}public function saveAjax(){$arr = array('title' => $this->getvals('title'),'receid' => $this->getvals('receid'),'recename' => $this->getvals('recename'),'content' => $this->getvals('content'),'isturn' => '1','status' => '1','senddt'  => $this->now,'optdt'  => $this->now,'sendid'  => $this->adminid,'uid'  => $this->adminid,'optid'  => $this->adminid,'applydt'  => $this->date,'sendname'  => $this->adminname,'optname'  => $this->adminname,);foreach($arr as $k=>$v){if($k=='recename')break;if($this->isempt($v))$this->showreturn('',''.$k.' is empty',201);}m('emailm')->insert($arr);$mid = $this->db->insert_id();$nr = $this->submitflow($mid, 'emailin');$this->showreturn($nr);}}