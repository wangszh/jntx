<?php 
/**
	信鸽推送
*/
include_once(ROOT_PATH.'/include/XgPush/XingeApp.php');
class xgpushChajian extends Chajian{
	
	public $secretKey 	= '29dc365f4428c568e65f08e08e7a483e';
	public $accessId 	= '2100180331';
	
	public function sendandroid($uid, $title='', $cont='')
	{
		$account	= '';
		if($uid!='all'){
			$rows 		= m('logintoken')->getrows("`uid` in($uid) and `cfrom`='appandroid' and `online`=1",'token');
			$account 	= array();
			$oi			= 0;
			foreach($rows as $k=>$rs){
				$account[] = $rs['token'];
				$oi++;
			}
			if($oi==0)$account='';
			if($oi==1)$account=$rows[0]['token'];
		}else{
			$account = $uid;
			if(m('logintoken')->rows("`cfrom`='appandroid' and `online`=1")==0)$account='';
		}
		$arr = array('err_msg'=>'account is null');
		if($account!='')$arr = XingeApp::PushAccountAndroid($this->accessId, $this->secretKey, $title, $cont, $account);
		return $arr;
	}
	
}