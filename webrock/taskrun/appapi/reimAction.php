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
	* 修改时: 2016-05-09 20:15:37									*	
	*****************************************************************
*/
 class reimClassAction extends appapiAction{public function getwdinfoAjax(){$reimarr = m('reim')->getwdarr($this->adminid);$loginkey= $this->get('loginkey');$reim_total = 0;foreach($reimarr as $k=>$rs){$reim_total+=$rs['stotal'];}$arr['wdtotal'] = $reim_total;$arr['reimarr'] = $reimarr;$this->webimonline($loginkey, 0);$this->showreturn($arr);}public function getimgroupAjax(){}public function sendgroupAjax(){$receid = $this->get('receid');$lx = 0;if($this->cfrom=='reim')$lx=1;$arr = m('reims')->sendgroup($receid, array('cont'=> $this->get('cont'),'sendid'=> $this->adminid,'optdt'=> $this->getvals('optdt')), $lx);$this->showreturn($arr);}public function senduserAjax(){$receid = $this->get('receid');$lx = 0;if($this->cfrom=='reim')$lx=1;$arr = m('reims')->senduser($receid, array('cont'=> $this->get('cont'),'sendid'=> $this->adminid,'optdt'=> $this->getvals('optdt')), $lx);$this->showreturn($arr);}public function getmessAjax(){$messid= $this->request('messid', '0'); $rs = m('im_mess')->getone("`id`='$messid'");if($rs)$this->setyd($messid, $rs['receid']);$this->showreturn($rs);}private function setyd($ids, $receid){m('reim')->setyd($ids, $receid);}public function setydAjax(){$ids = $this->get('ids');$this->setyd($ids, $this->adminid);$this->webimonline($this->get('loginkey'), 1);$this->showreturn('');}public function getwdmesslistAjax(){$type = $this->get('type');$dt = $this->date;$aid = $this->get('aid');$receid = $this->get('receid');$maxid = (int)$this->get('maxmessid');$db = m('im_mess');$where1= "`type`='$type' and `zt`=0 and `receid`='$aid' and `sendid`='$receid'";$wetoa= $db->rows($where1);$where= "`id`>$maxid ";if($maxid==0)$where .= " and `optdt` like '$dt%'";$where = "$where and `type`='$type' and ((`receid`='$aid' and `sendid`='$receid') or (`sendid`='$aid' and `receid`='$receid')) order by `id` asc limit 50";if($wetoa>0)$where = "$where1 order by `id` asc";$rows = $db->getall($where);$len= 0;$ids = '0';foreach($rows as $k=>$rs){$len++;if($rs['zt']==0)$ids .= ','.$rs['id'].'';}if($ids!='0')$this->setyd($ids, $aid);$rowss = array();for($i=$len-1; $i>=0; $i--)$rowss[]=$rows[$i];$this->showreturn($rowss);}public function getwdgrouplistAjax(){$dbws= m('reim');$type = $this->get('type');$dt = $this->date;$tblx = (int)$this->get('tblx','0');$uid = $this->get('aid');$maxid = (int)$this->get('maxmessid');$receid = $this->get('receid');$whes= $this->rock->dbinstr('receuid', $uid);$order = '';$where = "`id` in(select `mid` from `[Q]im_messzt` where `uid`='$uid')";$where= "`id`>$maxid ";if($maxid==0)$where .= " and `optdt` <= '$dt 23:59:59'";$wdtotal= $dbws->getweitotal($uid, $type, $receid);$wdwhere= $dbws->getweitotal($uid, $type, $receid, 1);$zwhere = " $where and `receid`='$receid' and `type`='$type' and $whes order by `id` asc limit 20";if($wdtotal > 0){$zwhere = " $wdwhere order by `id` asc limit 20";}$rows= $dbws->getall($zwhere, 'optdt,zt,id,cont,sendid,`table`,mid');$ids = '0';$suids= '0';$len = 0;foreach($rows as $k=>$rs){$len++;$ids .= ','.$rs['id'].'';$suids.= ','.$rs['sendid'];$wdtotal--;}if($type!='system')$rows = $this->ivaregarr($suids, $rows);if($ids!='0')$this->setyd($ids, $uid);$rowss = array();for($i=$len-1; $i>=0; $i--)$rowss[]=$rows[$i];if($wdtotal<0)$wdtotal=0;$this->showreturn(array('rows' => $rowss,'wdtotal' => $wdtotal));}private function webimonline($rand, $oi){}public function getuserreinfoAjax(){$type = 'user';$dt = $this->date;$uid = $this->adminid;$receid = $this->get('receid');$db = m('im_mess');$whes= $this->rock->dbinstr('receuid', $uid);$where1= "`type`='$type' and `zt`=0 and `receid`='$uid' and `sendid`='$receid' and $whes";$wdtotal= $db->rows($where1);if($wdtotal > 0){$where= "$where1 order by `id` desc limit 10";}else{$where = "`type`='$type' and ((`receid`='$uid' and `sendid`='$receid') or (`sendid`='$uid' and `receid`='$receid')) and $whes order by `id` desc limit 5";}$rows = $db->getall($where, 'optdt,zt,id,cont,sendid,`table`,mid');$len= 0;$suids= '0';$ids = '0';foreach($rows as $k=>$rs){$len++;if($rs['zt']==0)$ids .= ','.$rs['id'].'';$suids.= ','.$rs['sendid'];$wdtotal--;}$rows = $this->ivaregarr($suids, $rows);if($ids!='0')$this->setyd($ids, $uid);if($wdtotal<0)$wdtotal=0;$this->showreturn(array('rows' => $rows,'wdtotal' => $wdtotal));}private function ivaregarr($suids,$rows){if($suids=='' || $suids=='0')return $rows;$farr= $this->db->getarr('[Q]admin', "`id` in($suids)",'`face`,`name`');foreach($rows as $k=>$rs){$face =  $name = '';if(isset($farr[$rs['sendid']])){$face = $farr[$rs['sendid']]['face'];$name = $farr[$rs['sendid']]['name'];}if(!$this->isempt($face))$face = URL.''.$face.'';$rows[$k]['face']   = $this->rock->repempt($face, 'images/im/user100.png');;$rows[$k]['sendname'] = $name;}return $rows;}public function getgroupreinfoAjax(){$dbws= m('reim');$type = $this->get('type');$page = (int)$this->get('page', 1);$loci = (int)$this->get('loadcount', 1);$dt = $this->date;$uid = $this->adminid;$receid = $this->get('receid');$whes= $this->rock->dbinstr('receuid', $uid);$order = '';$wdtotal= $dbws->getweitotal($uid, $type, $receid);$wdwhere= $dbws->getweitotal($uid, $type, $receid, 1);if($wdtotal > 0){$zwhere = " $wdwhere order by `id` desc limit 10";}else{$zwhere = " `receid`='$receid' and `type`='$type' and $whes order by `id` desc limit 5";}$rows= $dbws->getall($zwhere, 'optdt,zt,id,cont,sendid,`table`,mid');$ids = '0';$suids= '0';$len = 0;foreach($rows as $k=>$rs){$len++;$ids .= ','.$rs['id'].'';$suids.= ','.$rs['sendid'];$wdtotal--;}if($type!='system')$rows = $this->ivaregarr($suids, $rows);if($ids!='0')$this->setyd($ids, $uid);if($wdtotal<0)$wdtotal=0;$arr['rows'] = $rows;$arr['wdtotal'] = $wdtotal;if($loci==1&&$type=='group')$arr['userarr'] = $this->getgroupuser($receid);$this->showreturn($arr);}private function getgroupuser($gid){$arr = m('reim')->getuser("and `id` in(select `uid` from `[Q]im_groupuser` where `gid`='$gid')");$arro= $arrf = array();foreach($arr as $k=>$rs){if($rs['imonline']==1){$arro[]=$rs;}else{$arrf[]=$rs;}}return array_merge($arro, $arrf);}public function getreloadAjax(){$type = $this->get('type');$receid = $this->get('receid');$uid = $this->adminid;$optdt = $this->getvals('optdt');$maxid = (int)$this->get('maxid',0);$rows= array();$zwhere= '';$ids = $suids= '0';$dbws= m('reim');if($type=='group'){$zwhere= "`id`>$maxid and ".$dbws->getweitotal($uid, $type, $receid, 1)." ";}if($type=='user'){$zwhere= "`id`>$maxid and `type`='$type' and `zt`=0 and `receid`='$uid' and `sendid`='$receid'";}$rows= $dbws->getall($zwhere, 'optdt,zt,id,cont,sendid,`table`,mid', '`id` desc');foreach($rows as $k=>$rs){$ids .= ','.$rs['id'].'';$suids.= ','.$rs['sendid'];}$rows = $this->ivaregarr($suids, $rows);if($ids!='0')$this->setyd($ids, $uid);$this->showreturn(array('rows' => $rows,'wdtotal' => 0));}}