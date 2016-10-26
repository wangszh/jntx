<?php
class optionClassModel extends Model
{
	/**
		获取选项
	*/
	public function getval($num, $dev='', $lx=0)
	{
		$val= '';
		$rs = $this->getone("`num`='$num'", '`name`,`value`');
		if($rs){
			if($lx==0)$val=$rs['value'];
			if($lx==1)$val=$rs['name'];
		}
		if($this->rock->isempt($val))$val=$dev;
		return $val;
	}
	
	public function getmnum($mnum,$fields='')
	{
		if($fields=='')$fields= '`id`,`name`,`value`,`num`,`mnum`,`xu`';
		return $this->getall("`mnum`='$mnum' order by `xu`,`id`", $fields);
	}
	
	public function setval($num, $val='')
	{
		$where = "`num`='$num'";
		if($this->rows($where)==0)$where='';
		$this->record(array(
			'num'	=> $num,
			'value'	=> $val,
			'optdt'	=> $this->rock->now
		), $where);
	}
}