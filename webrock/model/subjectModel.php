<?php
class subjectClassModel extends Model
{
	
	public function getsubject($pid, $type)
	{
		$sql	= $this->rock->strformat('select `id`,`name`,`num` from `?0` where `pid`=?1 order by `num`', '[Q]subject', $pid);
		$arr	= $this->db->getall($sql);
		
		$rows	= array();
		foreach($arr as $k=>$rs){
			$children		= $this->getsubject($rs['id'], $type);
			$uchek			= $this->rock->contain($type, 'check');
			
			if($this->rock->contain($type, 'subject')){
				if($uchek)$ars['checked']=false;
			}
			$ars['children']=$children;
			$ars['name'] 	= $rs['name'];
			$ars['id'] 		= 's'.$rs['id'];
			//$ars['num'] 	= $rs['num'];
			$ars['sid'] 	= $rs['id'];
			$ars['type'] 	= 's';
			$rows[]			= $ars;
		}
		return $rows;
	}
	
}