<?php 
include_once('../../config/config.php');
$id	= (int)$rock->get('id','0');
if($id==0)exit('Sorry!');
$db	= import(DB_DRIVE);
$rs	= $db->getone('[Q]file', "`id`='$id'");
if(!$rs)exit('504 Not find files');
$db->update('[Q]file', "`downci`=`downci`+1" ,"`id`='$id'");

$filepath	= '../../'.$rs['filepath'];
if(!file_exists($filepath))exit('404 Not find files');
$filename	= $rs['filename'];
$filesize 	= $rs['filesize'];
if(substr($filepath,-4)=='temp'){
	header('Content-type:application/vnd.ms-excel');
	header('Content-type: text/plain');
	header('Accept-Ranges: bytes');
	header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
    header('Pragma: no-cache');
    header('Expires: 0');
	header('Content-disposition:attachment;filename='.iconv("utf-8","gb2312",str_replace(' ','',$filename)).'');
	$content	= file_get_contents($filepath);
	echo base64_decode($content);
}else{
	header('location:'.$filepath.'');
}