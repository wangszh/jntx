<?php
/**
 *****************************************************************
 * 说  明: 核心代码/或者在线安装代码								*
 *****************************************************************
 */
$GLOBALS['rockModelImport'] = array();
function m($name) {$cls = NULL;
	$pats = '';
	if (isset($GLOBALS['rockModelImport'][$name])) {$cls = $GLOBALS['rockModelImport'][$name];
	} else {$nas = $name;
		$asq = explode(':', $nas);
		if (count($asq) > 1) {$nas = $asq[1];
			$pats = $asq[0] . '/';
			$_pats = '' . ROOT_PATH . '/' . PROJECT . '/model/' . $asq[0] . '/' . $asq[0] . '.php';
			if (file_exists($_pats))
				include_once ($_pats);
		}$class = '' . $nas . 'ClassModel';
		$path = '' . ROOT_PATH . '/' . PROJECT . '/model/' . $pats . '' . $nas . 'Model.php';
		if (file_exists($path)) {
			include_once ($path);
			$cls = new $class($nas);
		} else {$cls = new sModel($nas);
		}$GLOBALS['rockModelImport'][$name] = $cls;
	}
	return $cls;
}

//参数１插件名称　参数２是否加载对象
function c($name, $inbo = true, $param1 = '', $param2 = '') {$class = '' . $name . 'Chajian';
	$path = '' . ROOT_PATH . '/include/chajian/' . $class . '.php';
	$cls = NULL;
	if (file_exists($path)) {
		include_once ($path);
		if ($inbo)
			$cls = new $class($param1, $param2);
	}
	return $cls;
}

function import($name, $inbo = true) {$class = '' . $name . 'Class';
	$path = '' . ROOT_PATH . '/include/class/' . $class . '.php';
	$cls = NULL;
	if (file_exists($path)) {
		include_once ($path);
		if ($inbo) {$cls = new $class();
		}
	}
	return $cls;
}

function getconfig($key) {$a = array();
	if (isset($GLOBALS['config']))
		$a = $GLOBALS['config'];
	$s = '';
	if (isset($a[$key]))
		$s = $a[$key];
	return $s;
}

function isempt($str) {$bool = false;
	if (($str == '' || $str == NULL || empty($str)) && (!is_numeric($str)))
		$bool = true;
	return $bool;
}

function contain($str, $a) {$bool = false;
	if (!isempt($a) && !isempt($str)) {$ad = strpos($str, $a);
		if ($ad > 0 || !is_bool($ad))
			$bool = true;
	}
	return $bool;
}

function isajax() {
	if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
		return true;
	} else {
		return false;
	};
}

/**
 * 方法:isdate()
 * 功能:判断日期格式是否正确
 * 参数:$str 日期字符串 $format日期格式
 * 返回:布儿值
 */
function isdate($str, $format = "Y-m-d") {
	$strArr = explode("-", $str);
	if (empty($strArr)) {
		return false;
	}
	foreach ($strArr as $val) {
		if (strlen($val) < 2) {$val = "0" . $val;
		}$newArr[] = $val;
	}
	$str = implode("-", $newArr);
	$unixTime = strtotime($str);
	$checkDate = date($format, $unixTime);
	if ($checkDate == $str)
		return true;
	else
		return false;
}
