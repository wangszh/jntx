<?php 
/**
*	api的接口,用于外部的噢(暂时还未用到)
*/
include_once('config/config.php');
unset($_GET['d']);
$d	= 'taskrun';
$m	= $rock->get('m','reim');
unset($_GET['m']);
$m 	= ''.$m.'|apeapi';
include_once('include/View.php');