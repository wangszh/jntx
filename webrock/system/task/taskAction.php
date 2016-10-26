<?php
class taskClassAction extends Action
{
	public function taskrestartAjax()
	{
		$msg = c('socket')->sendshell('taskrestart');
		echo $msg;
	}
	public function taskaftershow($table, $rows)
	{
		$db = m('taskuser');
		foreach($rows as $k=>$rs){
			$s = '';
			if($rs['zntx'])$s.=',站内';
			if($rs['emtx'])$s.=',邮件';
			if($s!=''){
				$s = substr($s, 1).'通知';
				$rso = $db->getone("`id`='".$rs['confuid']."'",'recename,chaoname');
				if($rso){
					$s.='<br>接收:'.$rso['recename'].'';
					if(!$this->isempt($rso['chaoname']))$s.=';抄送:'.$rso['chaoname'].'';
				}
			}
			$rows[$k]['todocont'] = $s;
		}
		return array('rows'=>$rows);
	}
	
	public function publicaftersave($table, $cans, $id)
	{
		$ffsid	= $this->rock->post('timeidPost','0');
		$db = m('tasktime');
		$db->record(array('table'=>$table,'mid'=>$id), "id in($ffsid)");
		$db->delete("`table`='$table' and mid='$id' and id not in($ffsid)");
	}
	
	public function gettaketimeAjax()
	{
		$mid	= $this->get('mid');
		$table	= $this->get('table');
		$rows	= m('tasktime')->getall("`table`='$table' and mid='$mid' order by id asc");
		echo  json_encode($rows);
	}

	public function taskqueueAjax()
	{
		$rate	= c('rate', true);
		$ndt	= date('Y-m-d');
		$dt		= $this->post('dt', $ndt);
		$hor	= '';
		$rows	= $rate->result('task', $dt, 'and `status`=1', $hor);
		echo json_encode(array(
			'totalCount'=> count($rows),
			'rows'		=> $rows
		));
	}
	
	public function gettaskuserAjax()
	{
		$rows = m('taskuser')->getall('id>0 order by `sort`','id,name');
		echo json_encode($rows);
	}
	
	
	public function downbatAjax()
	{
		$ljth = str_replace('/','\\',ROOT_PATH);
		echo '<title>定时任务创建方法</title>';

		if(!$this->contain(PHP_OS,'WIN')){
			echo '您的服务器系统是：Linux，可根据以下设置定时任务<br>';
			echo '根据以下命令设置运行：<br><br>';
			echo 'crontab -e<br>';
			echo '#每5分钟运行一次<br>';
			echo '*/5 * * * * php '.ROOT_PATH.'/task.php<br>';
			exit;
		}
		
		echo '您的服务器系统是：Windows，可根据以下设置定时任务<br>';
		$path = exec('where php.exe');
		$str1 = '@echo off
'.$path.' '.$ljth.'\task.php';
		$this->rock->createtxt('upload/RockOABase.bat', $str1);
		echo '::在您的win服务器上，开始菜单→运行 输入 cmd 回车，输入以下命令(每5分钟运行一次)：<br><br>';
		echo 'schtasks /create /sc DAILY /mo 1 /du "24:00" /ri 5 /sd "2016/04/01" /st "00:00:00"  /tn "RockOABase" /tr '.$ljth.'\upload\RockOABase.bat';
	}
}