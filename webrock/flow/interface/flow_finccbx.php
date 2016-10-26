<?php
class finccbxflowClass extends flowChajian
{
	
	protected function contentother()
	{
		$subdata = m('items')->getitemsdata($this->setid, $this->table, $this->id);
		$headstr = 'address,发送地点@name,所属项目@startdt,发生日期@moneys,金额@explain,说明';
		$rows    = isset($subdata['subdata0'])?$subdata['subdata0']:array();
		$arr[] = array(
			'fields' 		=> 'hdhhd',
			'fields_style' 	=> '',
			'name' => '报销明细',
			'data' => c('html')->createrows($rows, $headstr, '#cccccc', 'noborder'),
		);
		return $arr;
	}
	
	
}