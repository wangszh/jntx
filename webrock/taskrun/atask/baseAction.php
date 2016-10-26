<?php 
class baseClassAction extends ataskAction{
	
	/**
	*	运行 php F:\IIS\rock\task.php
	*/
	public function runAjax()
	{
		$time	= time();
		$arr 	= json_decode($this->getcont($time, false), true);
		$jg		= 20;
		$yxarr	= array();
		foreach($arr as $k=>$rs){
			$ts = $rs['runtimes']-$time;
			if($ts<=$jg && $ts>=0-$jg){
				$yxarr[] = $rs;
			}
		}
		unset($arr);
		$cg 	= $oi = $sb = 0;	
		$curl 	= c('curl');
		$bdurl	= getconfig('localurl');
		if($bdurl=='')$bdurl = URL;
		foreach($yxarr as $k=>$rs){
			$rurl	= $rs['url'];
			if(substr($rurl,0,4)!='http'){
				$a1	  	= explode(',', $rurl);
				$rurl 	= $bdurl."?a=".$a1[1]."&m=".$a1[0]."|atask&d=taskrun&ajaxbool=true&mid=".$rs['mid']."&sid=".$rs['sid']."";
			}
			$jg 	= $curl->getcurl($rurl);
			if($jg=='success'){
				$cg++;
			}else{
				$sb++;
			}
			$oi++;
		}
		echo 'total('.$oi.'),success('.$cg.'),fail('.$sb.')';
	}
	
	public function reloadrunAjax()
	{
		$this->getcont(time(), true);
		echo 'success';
	}
	
	public function getcont($time, $lbo=false)
	{
		$path 	= 'upload/tasklist.txt';
		$paths 	= ''.ROOT_PATH.'/'.$path.'';
		$cbo	= true;
		$dt		= $this->date;
		$cont 	= '[]';
		if(file_exists($paths)){
			$lasttime 	= filemtime($paths); //最后修改时间
			$lastdt 	= date('Y-m-d', $lasttime);
			$cont		= file_get_contents($paths);
			$cbo		= false;
			if($time - $lasttime>1*3600 || $lastdt!=$dt){
				$cbo = true;
			}
		}
		if($lbo)$cbo = true;
		if($cbo){
			$rows	= c('rate')->result('task', $dt, 'and `status`=1');
			$rowa	= array();
			foreach($rows as $k=>$rs){
				if($rs['ohui']==0){
					$rowa[] = array(
						'runtime' 	=> $rs['runtime'],
						'runtimes' 	=> $rs['runtimes'],
						'name' 	=> $rs['name'],
						'url' 	=> $rs['url'],
						'mid' 	=> $rs['mid'],
						'sid' 	=> $rs['sid']
					);
				}
			}
			$cont 	= json_encode($rowa);
			$this->rock->createtxt($path, $cont);
		}
		if($this->isempt($cont))$cont='[]';
		return $cont;
	}
}