<?php 
/**
*	创建二维码
*/
include_once(ROOT_PATH.'/include/phpqrcode/phpqrcode.php');
class qrcodeChajian extends Chajian
{
	public function show($url='')
	{
		//header("Content-type:image/png");

		if($url=='')$url 		= 'http://m.rockoa.com/'; 
		$filename 	= 'upload/mrockoa.png'; 
		$errorCorrectionLevel = 'L';  // 纠错级别：L、M、Q、H 
		$matrixPointSize 		= 6;  // 点的大小：1到10 
		$margin 				= 1;  //表示二维码周围边框空白区域间距值；
		
		QRcode::png($url, $filename, $errorCorrectionLevel, $matrixPointSize, $margin, false);
		return $filename;
	}
}                                                                                                                                                            