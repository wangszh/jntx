<?php
class dirClassAction extends Action
{
	public function initAction()
	{
		exit;
	}

	
	public function getsysfilodAjax()
	{
		$path = $this->rock->post('path','/');
		$arr  = $this->getFilodes($path, 0);
		$rowss = array('root'=>'.','children'=>$arr);
		echo json_encode($arr);
	}
	
	public function getFilodes($path, $jb=0)
	{
		$arr	= array();
		$paths	= ROOT_PATH.$path;
		if(!is_dir($paths))return $arr;
		$d 		= opendir($paths);
		while( false !== ($file = readdir($d))){
			if($file != '.'  &&  $file!='..'){//遍历目录下文件夹
				if(is_dir($paths.'\\'.$file)){
					$apath  = $path.''.$file.'/';
					$shoarr = array(
						'name'	=> $file,
						'path'	=> $apath,
					);
					if($jb==0)$shoarr['children'] = $this->getFilodes($apath, $jb+1);
					$arr[] = $shoarr;
				}
			}
		}
		return $arr;
	}
	
	public function getfileAjax()
	{
		$path	= $this->rock->post('path','/');
		$rows	= $this->getFile($path);
		$sort  	= $this->rock->post('sort');		//排序字段
		$dir  	= $this->rock->post('dir');			//ASC、DESC
		if($sort != '' && $dir !=''){
			$array		= c('array', true);
			$rows	= $array->order($rows, $sort, $dir);
		}
		echo json_encode(array(
			'totalCount'=> 100,
			'rows'		=> $rows
		));
	}
	
	public function getFile($path='/')
	{
		$arr = array();
		$paths	= ROOT_PATH.$path;
		if(!is_dir($paths))return $arr;
		$d = opendir($paths);
		while( false !== ($file = readdir($d))){
			if($file != '.'  &&  $file!='..'){//遍历目录下文件
				$pafile=''.$paths.'\\'.$file.'';
				if(is_file($pafile)){
					$size=filesize($pafile);//文件大小
					$arra=pathinfo($pafile);
					$type=$arra['extension'];//文件类型
					$editdt=date("Y-m-d H:i:s",filectime($pafile));//上次修改时间
					$lastdt=date("Y-m-d H:i:s",filemtime($pafile));//最后修改的时间
					$file	= iconv('gb2312','utf-8',$file);
					$oi		= count($arr);
					$arr[]	= array(
						//'leaf'	=> '<img src="images/fileicon/'.$type.'.gif" width="16" height="16">',
						//'opt'	=> '<a title="下载" href="javascript:" onclick="return openfile(\''.$file.'\');"><img src="images/down.gif" class="icons"></a> <a title="上传" id="aup'.$oi.'" href="javascript:" onclick="return upfileshow('.$oi.',this)"><img  class="icons" src="images/arrow_up.png"></a>',
						'file'	=> $file,
						'id'	=> $file,
						'sizecn'	=> $this->rock->formatsize($size),
						'size'	=> $size,
						'editdt'=> $editdt,
						'lastdt'=> $lastdt,
						'type'	=> $type
						
					);

				}
			}
		}
		return $arr;
	}
}