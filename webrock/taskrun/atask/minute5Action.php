<?php 
/**
	5分钟执行一次的，会议通知等
*/
class minute5ClassAction extends ataskAction{
	
	public function runtaskAjax()
	{
		$this->meettodo();
		echo 'success';
	}
	
	/**
	*	会议通知
	*/
	private function meettodo()
	{
		$db		= m('meet');
		$rows 	= $db->getall("`state` in(0,1) and `type`=0 and `startdt` like '".$this->date."%' and `status`=1");
		$time	= time();
		$todo	= m('todo');
		$adm	= m('admin');
		foreach($rows as $k=>$rs){
			$zt 	= $rs['state'];
			$dts	= explode(' ', $rs['startdt']);
			$sttime = strtotime($rs['startdt']);
			$ettime = strtotime($rs['enddt']);
			$nzt	= -1;
			$istz	= 0;
			if($ettime <= $time){
				$nzt = 2;
			}else{
				if($time >= $sttime && $time< $ettime){
					if($zt==0)$nzt = 1;//进行中
				}else{
					$jg = $sttime - $time;
					if($jg <= 6*60 && $rs['istz'] == 0 && $zt==0){
						$istz = 1;
						$tzuid = $adm->gjoin($rs['joinid']);
						$cont  = '['.$rs['title'].']会议将在5分钟后'.$dts[1].'开始，请做好准备,会议室['.$rs['hyname'].']';
						if($tzuid != ''){
							$flow = f('meet');
							$flow->initrecord($rs['id']);
							$flow->sendtodo($tzuid, array(
								'zntx' => array(
									'cont' 	 => $cont,
									'title' => '会议通知'
								),
								'wxtx' => array(
									'agentname'		=> '今日会议',
									'title'			=> '会议.{title}',
									'description' 	=> $cont
								)
							));
						}
						$db->update("`istz`='$istz'", $rs['id']);
					}
				}
			}
			if($nzt != -1)$db->update("`state`='$nzt'", $rs['id']);
		}
	}
}