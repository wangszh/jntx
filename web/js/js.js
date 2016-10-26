var MODE	= '',ACTION = '',DIR='',PROJECT='',adminid=0,adminname='',admindeptname='',adminranking='',LOGINKEY='',isweixin=true,apiurl,appapikey,jssdkwx=false,isapp=false,sysnum='',HOST,systitle='济南通信段财务预算系统';
appapikey 	= '';
apiurl		= '/';//api接口地址//'http://localhost/';//api接口地址
function initbody(){}
function loaddata(){}
$(document).ready(function(){
	js.splittime= parseFloat(js.getoption('splittime','0'));
	appapikey = js.getoption('appapikey');
	
	//document.oncontextmenu=new Function("return false");//屏蔽鼠标右键菜单
	if(typeof(webapp)=='object')isapp=true;
	var lurl = location.href;
	HOST	 = lurl.substr(lurl,lurl.lastIndexOf('/')+1);
	if(lurl.indexOf('.com')>-1)apiurl='http://demo.rockoa.com/';
	
	var ua = navigator.userAgent.toLowerCase(); 
	if(ua.indexOf('micromessenger')<0)isweixin=false;
	js.initmobls();
	initbody();
});
var js={path:'rock',url:'',bool:false,login:{},initdata:{},scroll:function(){},rootpath:''};
var isIE=true;
if(!document.all)isIE=false;
var get=function(id){return document.getElementById(id)};
var isempt=function(an){var ob	= false;if(an==''||an==null||typeof(an)=='undefined'){ob=true;}return ob;}
var strreplace=function(str){if(isempt(str))return '';return str.replace(/[ ]/gi,'').replace(/\s/gi,'')}
var strhtml=function(str){if(isempt(str))return '';return str.replace(/\</gi,'&lt;').replace(/\>/gi,'&gt;')}
var form=function(an,fna){if(!fna)fna='myform';return document[fna][an]}
var xy10=function(s){var s1=''+s+'';if(s1.length<2)s1='0'+s+'';return s1;};
js.getarr=function(caa,bo){
	var s='';
	for(var a in caa)s+=' @@ '+a+'=>'+caa[a]+'';
	if(!bo)alert(s);
	return s;
}
js.str=function(o){
	o.value	= strreplace(o.value);
}
function winHb(){
	var winH=(!isIE)?window.innerHeight:document.documentElement.offsetHeight;
	return winH;
}
function winWb(){
	var winH=(!isIE)?window.innerWidth:document.documentElement.offsetWidth;
	return winH;
}
js.scrolla	= function(){
	var top	= $(document).scrollTop();
	js.scroll(top);
}
js.request=function(name,dev,url){
	if(!dev)dev='';
	if(!name)return dev;
	if(!url)url=location.href;
	if(url.indexOf('\?')<0)return dev;
	neurl=url.split('\?')[1];
	neurl=neurl.split('&');
	var value='';
	for(i=0;i<neurl.length;i++){
		val=neurl[i].split('=');
		if(val[0].toLowerCase()==name.toLowerCase()){
			value=val[1];
			break;
		}
	}
	if(!value)value=dev;
	return value;
}
js.now=function(type,sj){
	if(!type)type='Y-m-d';
	if(type=='now')type='Y-m-d H:i:s';
	var dt,ymd,his,weekArr,Y,m,d,w,H=0,i=0,s=0,W;
	if(typeof(sj)=='string')sj=sj.replace(/\//gi,'-');
	if(/^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}/.test(sj)){
		sj=sj.split(' ');
		ymd=sj[0];
		his=sj[1];if(!his)his='00:00:00';
		ymd=ymd.split('-');
		his=his.split(':');
		H = his[0];if(his.length>1)i = his[1];if(his.length>2)s = his[2];
		dt=new Date(ymd[0],ymd[1]-1,ymd[2],H,i,s);
	}else{
		dt=(typeof(sj)=='number')?new Date(sj):new Date();
	}
	weekArr=new Array('日','一','二','三','四','五','六');
	Y=dt.getFullYear();
	m=xy10(dt.getMonth()+1);
	d=xy10(dt.getDate());
	w=dt.getDay();
	H=xy10(dt.getHours());
	i=xy10(dt.getMinutes());
	s=xy10(dt.getSeconds());
	W=weekArr[w];
	if(type=='time'){
		return dt.getTime();
	}else{
		return type.replace('Y',Y).replace('m',m).replace('d',d).replace('H',H).replace('i',i).replace('s',s).replace('w',w).replace('W',W);
	}
}
js.float=function(num,w){
	if(isNaN(num)||num==''||!num||num==null)num='0';
	num=parseFloat(num);
	if(!w&&w!=0)w=2;
	var m=num.toFixed(w);
	return m;	
}
js.splittime=0;
js.getsplit=function(){
	if(!js.servernow)return false;
	var dt=js.now('Y-m-d H:i:s');
	var d1=js.now('time',dt);	
	var d2=js.now('time',js.servernow);
	js.splittime=d1-d2;
}
js.serverdt=function(atype){
	if(!atype)atype='Y-m-d H:i:s';
	var d1=js.now('time')-js.splittime;
	var dt=js.now(atype,d1);
	return dt;
}
js.decode=function(str){
	var arr	= {length:-1};
	try{
		arr	= new Function('return '+str+'')();
	}catch(e){}
	return arr;
}
js.setdev=function(val,dev){
	var cv	= val;
	if(isempt(cv))cv=dev;
	return cv;
}
js.getajaxurl=function(a,m,d,can){
	if(!can)can={};
	if(!m)m=MODE;
	if(!d)d=DIR;
	if(d=='null')d='';
	var jga	= a.substr(0,1);
	if(jga=='@')a = a.substr(1);
	var url	= ''+js.path+'.php?a='+a+'&m='+m+'&d='+d+'';
	for(var c in can)url+='&'+c+'='+can[c]+'';
	if(jga!='@')url+='&ajaxbool=true';	
	url+='&rnd='+Math.random()+'';	
	return url;
}
js.formatsize=function(size){
	var arr = new Array('Byte', 'KB', 'MB', 'GB', 'TB', 'PB');
	var e	= Math.floor(Math.log(size)/Math.log(1024));
	var fs	= size/Math.pow(1024,Math.floor(e));
	return js.float(fs)+' '+arr[e];
}
js.getformdata=function(na){
	var da	={};
	if(!na)na='myform';
	var obj	= document[na];
	for(var i=0;i<obj.length;i++){
		var type	= obj[i].type;
		var val		= obj[i].value;
		if(type=='checkbox'){
			val	= '0';
			if(obj[i].checked)val='1';
		}
		da[obj[i].name]	= val;
	}
	return da;
}
js.getdata = function(na,da){
	if(!da)da={};
	var obj	= $('#'+na+'');
	var inp	= obj.find('input,select,textarea');
	for(var i=0;i<inp.length;i++){
		var type	= inp[i].type;
		var val		= inp[i].value;
		if(type=='checkbox'){
			val	= '0';
			if(inp[i].checked)val='1';
		}
		var ad1	= inp[i].name;
		if(!ad1)ad1 = inp[i].id;
		da[ad1]	= val;
	}
	return da;
}
js.selall = function(o,na,bh){
	var i,oi1;
	if(bh){
		o1=$("input[name^='"+na+"']");
	}else{
		o1=$("input[name='"+na+"']");
	}
	for(i=0;i<o1.length;i++){
		if(!o1[i].disabled)o1[i].checked = o.checked;
	}
}
js.getchecked=function(na,bh){
	var s = '',o1;
	if(bh){
		o1=$("input[name^='"+na+"']");
	}else{
		o1=$("input[name='"+na+"']");
	}
	for(var i=0;i<o1.length;i++){
		if(o1[i].checked && !o1[i].disabled)s+=','+o1[i].value+'';
	}
	if(s!='')s=s.substr(1);
	return s;
}
js.backtop=function(ci){
	if(!ci)ci=0;
	$('body,html').animate({scrollTop:ci});
	return false;
}
js.backto = function(oid){
	if(!get(oid))return;
	var of	= $('#'+oid+'').offset();
	this.backtop(of.top);
	return false;
}
js.applyIf=function(a,b){
	if(!a)a={};
	if(!b)b={};
	for(var c in b)if(typeof(a[c])=='undefined')a[c]=b[c];
	return a;
}
js.apply=function(a,b){
	if(!a)a={};
	if(!b)b={};
	for(var c in b)a[c]=b[c];
	return a;
}

js.focusval	= '0';
js.number=function(obj){
	val=strreplace(obj.value);
	if(!val){
		obj.value=js.focusval;
		return false;
	}
	if(isNaN(val)){
		js.msg('msg','输入的不是数字');
		obj.value=js.focusval;
		obj.focus();
	}else{
		obj.value=val;
	}
}
js.setmsg=function(txt,col,ids){
	if(!ids)ids='msgview';
	$('#'+ids+'').html(js.getmsg(txt,col));
}
js.getmsg  = function(txt,col){
	if(!col)col='red';
	var s	= '';
	if(!txt)txt='';
	if(txt.indexOf('...')>0){
		s='<img src="'+js.rootpath+'image/loading.gif" height="16" width="16" align="absmiddle"> ';
		col = '#ff6600';
	}	
	s+='<span style="color:'+col+'">'+txt+'</span>';
	if(!txt)s='';
	return s;
}
js.msg=function(lx,txt,sj){
	clearTimeout(this.msgshowtime);
	if(typeof(sj)=='undefined')sj=3;
	$('#msgshowdivla').remove();
	if(lx == 'none' || !lx){
		return;
	}
	if(lx == 'wait'){
		txt	= '<img src="'+js.rootpath+'image/loading_more.gif" height="18" width="18" align="absmiddle"> '+txt;
		sj	= 60;
	}
	if(lx=='msg')txt='<font color=red>'+txt+'</font>';var t=20;
	if(!isweixin)t=55;
	var s = '<div id="msgshowdivla" style="position:fixed;top:'+t+'px;z-index:20;width:100%" align="center"><div style="padding:10px;margin:0px 20px; background:rgba(0,0,0,0.7);color:white;font-size:18px;">'+txt+'</div></div>';
	$('body').append(s);
	if(sj>0)this.msgshowtime= setTimeout("$('#msgshowdivla').remove()",sj*1000);
}
js.repempt=function(stt,v){
	var s = stt;
	if(isempt(s))s=v;
	return s;
}
js.getrand=function(){
	var r;
	r = ''+new Date().getTime()+'';
	r+='_'+parseInt(Math.random()*9999)+'';
	return r;
}
js.arraystr=function(str){
	if(!str)str='1|是,0|否';
	var s = str.split(','),
		d = [],i,s1,nv,vv;
	for(i=0; i<s.length; i++){
		s1 = s[i].split('|');
		nv = s1[0];
		vv = nv;
		if(s1.length>1)nv=s1[1];
		d.push([vv,nv]);
	}	
	return d;
}
js.ajaxs  = function(m,a,funs, cans, ntis, erfs){
	if(js.ajaxbool)return false;
	clearTimeout(js.ajax_time);
	if(!cans)cans={};
	js.ajaxbool = true;
	if(!ntis)ntis='dev';
	if(ntis=='dev')js.tishis('努力处理中...');
	if(ntis=='mod')js.tishi('努力处理中...');
	var url = 'rockm.php?m='+m+'&a='+a+'';
	url+='&cfrom='+js.getcfrom()+'';
	url+='&token='+js.getoption('admintoken')+'';
	url+='&device='+js.getoption('device')+'';
	url+='&adminid='+adminid+'';
	url+='&splittime='+js.splittime+'&rnd='+Math.random()+'';
	cans.apiurl = apiurl;
	
	$.ajax({
		type:'post',data:cans,
		url:url,
		success:function(str){
			js.ajaxbool=false;
			var ret = js.decode(str);$('#listmenutishi').remove();
			var msg = ret.msg;
			if(msg){
				js.setmsg(msg);
				js.msg('msg',msg);
				$('#submitbutton').attr('disabled', false);
			}else{
				js.setmsg('');
				js.msg('none');
				funs(ret.data, str);
			}
			if(ret.sysd){
				var times=ret.sysd.time,ntime=js.now('time')/1000
				js.splittime = parseInt(times-ntime);
				js.setoption('splittime',js.splittime);
			}
		},
		error:function(){
			js.ajaxbool=false;
			var str = 'Error:内部错误';
			js.setmsg(str);
			js.msg('msg',str);
			$('#submitbutton').attr('disabled', false);
			erfs();
		}
	});
	js.ajax_time = setTimeout(function(){
		if(js.ajaxbool){
			var str = 'Error:请求超时?';
			$('#listmenutishi').remove();
			js.setmsg(str);
			js.msg('msg',str);
			js.ajaxbool = false;
			$('#submitbutton').attr('disabled', false);
			erfs();
		}
	}, 1000*30);
}
js.ajaxs  = function(m,a,funs, cans, ntis, erfs){	
	var url=js.apiurl(a,m);
	
	js.ajax(url,funs, cans, ntis, erfs);
}
js.apiurl = function(a,m,cans){
	if(!m)m='appapi';
	var url = apiurl+js.getajaxurl(a, ''+m+'|appapi', 'taskrun', cans)+'&adminid='+adminid+'';
	
	url+='&appapikey='+appapikey+'&callback=?';
	url+='&cfrom='+js.getcfrom()+'';
	url+='&token='+js.getoption('admintoken')+'';
	url+='&device='+js.getoption('device')+'';
	url+='&timekey='+(js.now('time')+js.splittime*1000)+'';
	return url;
}
js.ajaxbool = false;
js.ajax = function(url, funs, cans, ntis, erfs){
	clearTimeout(js.ajax_time);
	if(cans)for(var i in cans)url+='&'+i+'='+cans[i]+'';
	js.ajaxbool = true;
	if(!ntis)ntis='dev';
	if(ntis=='dev')js.tishis('努力处理中...');
	if(ntis=='mod')js.tishi('努力处理中...');
	if(typeof(erfs)!='function')erfs=function(){};
	$.getJSON(url,function(ret){
		$('#listmenutishi').remove();	
		try{
			var msg = ret.msg;
			if(ret.code==299){
				alert('登录已失效，请重新登录');
				js.location('login.html');
				return;
			}
			if(msg){
				js.setmsg(msg);
				js.msg('msg',msg);
				$('#submitbutton').attr('disabled', false);
			}else{
				js.setmsg('');
				js.msg('none');
				funs(ret.data);
			}
			if(ret.sysd){
				var times=ret.sysd.time,ntime=js.now('time')/1000
				js.splittime = parseInt(times-ntime);
				js.setoption('splittime',js.splittime);
			}
		}catch(e){
			var str = 'Error:内部错误';
			js.setmsg(str);
			js.msg('msg',str);
			$('#submitbutton').attr('disabled', false);
			erfs();
		}
		js.ajaxbool = false;
	});
	js.ajax_time = setTimeout(function(){
		if(js.ajaxbool){
			var str = 'Error:请求超时?';
			$('#listmenutishi').remove();
			js.setmsg(str);
			js.msg('msg',str);
			js.ajaxbool = false;
			$('#submitbutton').attr('disabled', false);
			erfs();
		}
	}, 1000*30);
}
js.setinforstr=function(qd){
	js.setoption('device', qd);
}
js.setoption=function(k,v){
	if(!v)v='';
	try{
	if(isempt(v)){
		localStorage.removeItem(k);
	}else{
		localStorage.setItem(k, v);
	}}catch(e){}
	js.webapprun('setoption', k, v);
}
js.getoption=function(k,dev){
	var s='';
	try{s = localStorage.getItem(k);}catch(e){}
	if(isempt(dev))dev='';
	if(isempt(s)){try{s=webapp.getoption(k);}catch(e){s=''}}
	if(isempt(s))s=dev;
	return s;
}
js.location = function(url){
	location.href = url;
}
js.showtotal= function(ids, oi){
	if(oi==0||!oi)oi='';
	var o = $('#'+ids+'');
	o.html(''+oi);
	if(!oi){
		o.hide();
	}else{
		o.show();
	}
}
js.showface	= function(fce, def){
	if(isempt(fce)||fce=='null'){
		if(!def)def='Public/image/noface.jpg';
		fce=def;
	}else{
		if(fce.substr(0,4)!='http')fce=apiurl+fce;
	}
	return fce;
}
js.alert	= function(nr, cnass){
	if(get('rockalerttishi'))return;
	var s = '<div class="listmenu" id="rockalerttishi" ><div onclick="$(this).parent().remove()" class="listmenu_model"></div><div class="listmenu_list box"><div class="one"  id="alerttitle">系统提示</div><div class="lista" style="padding:15px;font-size:16px;line-height:30px" id="alertcontalert"></div><div class="listb"><table width="100%"><tr><td height="44" style="border-right:1px #eeeeee solid" id="alertbtn1" width="50%">确定</td><td width="50%" id="alertbtn2" >取消</td></tr><table></div></div></div>';
	$('body').append(s);
	$('#rockalerttishi').show();
	var cans = js.apply({
		btn2:'',title:'系统提示',
		btn1:'确定',
		fun1:function(){},
		fun2:function(){}
	}, cnass);
	$('#alertcontalert').html(nr);
	$('#alertbtn2').hide();
	if(cans.btn2){
		$('#alertbtn2').show();
		$('#alertbtn2').html(cans.btn2);
	}
	$('#alertbtn1').html(cans.btn1);
	$('#alerttitle').html(cans.title);
	$('#alertbtn1').click(function(){var bo=cans.fun1();if(bo)$('#rockalerttishi').remove();});
	$('#alertbtn2').click(function(){cans.fun2();$('#rockalerttishi').remove();});
}
js.tishi = function(txt){
	$('#listmenutishi').remove();
	if(txt=='none')return;
	if(!txt)txt='努力处理中...';
	var s = '<div class="listmenu" id="listmenutishi"><div class="listmenu_model"></div><div class="listmenu_list listmenu_msg"><div><img src="image/loading_more.gif"></div><div class="listmenu_text">'+txt+'</div></div></div>';
	$('body').append(s);
	$('#listmenutishi').show();
}
js.tishis = function(txt){
	$('#listmenutishi').remove();
	if(txt=='none')return;
	if(!txt)txt='努力处理中...';
	var s = '<div class="listmenu" id="listmenutishi"><div class="listmenu_list listmenu_msgs"><div><img src="image/loading_more.gif"></div><div class="listmenu_text">'+txt+'</div></div></div>';
	$('body').append(s);
	$('#listmenutishi').show();
}
js.webappruns = function(tag, cs1,cs2){
	if(!isapp)return false;
	if(!cs1)cs1='';
	if(!cs2)cs2='';
	try{js.location('webviewapi.'+tag+'@'+cs1+'@'+cs2+'');return true;}catch(e){return false;}
};
js.webapprun = function(tag, cs1,cs2,cs3){
	if(!isapp)return;
	if(!cs1)cs1='';
	if(!cs2)cs2='';
	if(!cs3)cs3='';
	try{webapp[tag](cs1,cs2,cs3);return true;}catch(e){return false;}
};
js.initmobls=function(){
	var s = js.getoption('syssiteurl');
	if(s!=''){
		apiurl=s;
	}
}
function initlogin(rbc){
	adminid 	= js.getoption('adminid','0');
	adminname 	= js.getoption('adminname');
	var loteim 	= parseFloat(js.getoption('logintime', '0'));
	var nowtime	= parseFloat(js.now('time'));
	js.splittime= parseFloat(js.getoption('splittime','0'));
	if(isapp){
		js.webapprun('setTag','');
		loteim=nowtime;
	}
	if(nowtime-loteim>1000*3600 && !isweixin)adminid=0;
	if(adminid==0){
		if(!rbc)rbc=location.href;
		var gurl = 'login.html?backurl='+jm.base64encode(rbc)+'';
		js.location(gurl);
		return false;
	}
	if(!isweixin)$('#topheader').show();
	js.setoption('logintime',js.now('time'));
	mainobj = $('#maindiv');
	return true;
}
js.gotoback = function(){
	if(isapp){
		js.webappruns('close');
	}else{
		history.back();
	}
}
js.getcfrom	 = function(){
	var s = 'mweb';
	if(isweixin)s='weixin';
	if(isapp)s='appandroid';
	return s;
}
js.jssdkwixin=function(){
	var surl= location.href;
	var url = js.apiurl('getsign','weixin',{url:jm.base64encode(surl)});
	js.ajax(url,function(ret){
		wx.config({
			debug: false,
			appId: ret.appId,
			timestamp:ret.timestamp,
			nonceStr: ret.nonceStr,
			signature: ret.signature,
			jsApiList: ['openLocation','getLocation','hideOptionMenu','showOptionMenu','hideMenuItems','showAllNonBaseMenuItem','hideAllNonBaseMenuItem']
		});
		wx.ready(function(){
			wx.hideOptionMenu();
		});
	},{},'none');	
}
function jssdkwixin(){
	if(!isweixin)return;
	$.getScript('http://res.wx.qq.com/open/js/jweixin-1.1.0.js', function(){
		js.jssdkwixin();
	});
}
js.setselectdata = function(o, data, vfs, devs){
	var i,ty = data,sv;
	if(!data)return;	
	if(!vfs)vfs='name';	
	if(typeof(devs)=='undefined')devs=-1;
	for(i=0;i<ty.length;i++){
		o.options.add(new Option(ty[i].name,ty[i][vfs]));
		if(i==devs)sv=ty[i][vfs];
	}
	if(sv)o.value=sv;
}

var changename_uuusw;
function changeuser(na,lx){
	changename_uuusw=na;
	if(!lx)lx='';
	var s='<div class="modediv" id="changmodddid">';
	s+='<iframe name="changdept" height="100%" frameborder="0" scrolling="auto" marginheight="0" marginwidth="0" width="100%" src="dept.html?changetype='+lx+'"></iframe>';
	s+='</div>';
	$('body').append(s);
}
function changecancel(){
	$('#changmodddid').remove();
}
function changeok(sna,sid){
	get(changename_uuusw).value=sna;
	get(changename_uuusw+'_id').value=sid;
}
function clearuser(na){
	get(na).value='';
	get(na+'_id').value='';
}