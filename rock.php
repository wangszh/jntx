<?php 
/**
	OA后台主文件入口
*/
include_once('config/config.php');
$m			= $rock->jm->gettoken('m', 'index');
$d			= $rock->jm->gettoken('d');
$a			= $rock->jm->gettoken('a', 'default');
$ajaxbool	= $rock->jm->gettoken('ajaxbool', 'false');
$mode		= $rock->get('m', $m);
if(!$config['install'] && $mode != 'install')$rock->location('?m=install');//可删除判断是否有安装的
include_once('include/View.php');