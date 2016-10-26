var connectbool = false,readfilebo = false,readfilebotime,righthistroboj,relianshotime_time,notifyobj,systemtitle,otherlogin=false;
function initbody(){
	var fces=js.getoption('adminface');
	get('index_face').src=fces;
	$('body').click(function(e){
		return js.downbody(this, e);
	});
	resetw();
	$(window).resize(function(){
		resetw();
	});
	im.init();
	righthistroboj = $.rockmenu({
		data:[],
		itemsclick:function(d){
			im.rightclick(d);
		}
	});
	window.onbeforeunload=function(){
		if(connectbool)return '确定要退出REIM页面嘛？';
	}
	notifyobj=new notifyClass({
		title:'REIM提醒',
		sound:'public/sound/msn.mp3',
		sounderr:'public/sound/error.mp3',
		soundbo:im.getsound()
	});
	nwjs.init();
}
function bodyunload(){
	nwjs.removetray();
	js.ajaxss('reimweb','loginexit');
}
function righthistorh(e){
	righthistroboj.showAt(e.clientX-3,e.clientY-3);
	return false;
}
function resetw(){
	var h = winHb();
	if(h<50)return;
	$('#webimindex').css({width:winWb()+'px',height:''+h+'px'});
	$('#headercenter').css({height:''+(h-180-1)+'px'});
}
function tabchagne(oi,o1){
	var ia = ['user','yingyong','dengdai'];
	$('.headertab div').removeClass();
	o1.className = 'active';
	for(var i=0;i<3; i++){
		$("img[tabimg='"+i+"']").attr('src', 'images/im/'+ia[i]+'.png');
	}
	$("img[tabimg='"+oi+"']").attr('src', 'images/im/'+ia[oi]+'_blue.png');
	$('#headercenter').find("div[tabdiv]").hide();
	$('#headercenter').find("div[tabdiv='"+oi+"']").show();
}
function connectserver(){
	if(otherlogin)return;
	if(isempt(fromrecid)||fromwshost.indexOf('ws:')!=0){
		js.msg('msg','暂时无法使用<br>请先设置REIM服务器信息',-1);
		return;
	}
	setTimeout('linkbooschange()',10*1000);
	clearTimeout(relianshotime_time);
	if(typeof(websocketobj)!='undefined'){
		websocketobj.connect();
		js.msg('wait','连接中...');
		return false;
	}
	websocketobj = new websocketClass({
		adminid:adminid,
		reimfrom:fromrecid,
		wshost:fromwshost,
		sendname:adminname,
		onerror:function(o,ws){
			connectbool=false;
			js.msg('msg','无法连接服务器1<br><span id="lianmiao"></span><a href="javascript:;" onclick="return connectserver()">[重连]</a>',-1);
			relianshotime(30);
		},
		onmessage:function(str){
			connectbool=true;
			var a=js.decode(str);
			im.receivemesb(a);
		},
		onopen:function(){
			connectbool=true;
			js.msg('none');
			im.initnotify();
		},
		onclose:function(){
			connectbool=false;
			js.msg('msg','连接已经断开了<br><span id="lianmiao"></span><a href="javascript:;" onclick="return connectserver()">[重连]</a>',-1);
			notifyobj.playerrsound();
			relianshotime(30);
		}
	});
	return false;
}
function linkbooschange(){
	if(otherlogin)return;
	if(!connectbool){
		js.msg('msg','无法连接服务器2<br><span id="lianmiao"></span><a href="javascript:;" onclick="return connectserver()">[重连]</a>',-1);
		relianshotime(30);
	}
}
function relianshotime(oi){
	clearTimeout(relianshotime_time);
	$('#lianmiao').html('('+oi+'秒后重连)');
	if(oi<=0){
		connectserver();
	}else{
		relianshotime_time=setTimeout('relianshotime('+(oi-1)+')',1000);
	}
}
function send(a){
	if(!connectbool)return false;
	return websocketobj.send(a);
}
function sendtype(receid,type){
	send({'receid':receid,'type':type});
}
function showapopup(msg, icon, url){
	notifyobj.showpopup(msg,{
		icon:icon
	});
	return false;
}
function connectcloseexit(bos){
	if(!bos){
		js.tanbody('close','系统提示',200,150,{
			html:'<div style="padding:15px">确定要退出REIM页面嘛？</div>',btn:[{
				text:'确定退出'
			}]
		});
		$('#close_btn0').click(function(){
			connectcloseexit(true);
		});
	}else{
		connectbool=false;
		js.setoption('appapikey','');
		js.setoption('admintoken','');
		js.setoption('autologin','');
		js.location('login.html');
	}
}

function openrecord(lx, lxid){
	im.openrecord(lx, lxid);
}
function loadgroup(){
	im.loadgroup();
}
function backdeptchange(num, str){
	runwinscript(num,'backyaoqing', str);
}
var userarr = {},deptarr={},agentarr={},
	grouparr= {},maindata;
var im = {
	wdarr:[],
	wdtotal:0,
	init:function(){
		this.loadinit();
		this.dingshilas();
	},
	dingshila:function(){
		js.ajaxss('reimweb','dingshiup',function(a){
			im.showweidu(a.wdarr);
		});
		this.dingshilas();
	},
	dingshilas:function(){
		setTimeout('im.dingshila()', 10*60*1000);
	},
	indexreload:function(){
		connectbool=false;
		location.reload();
	},
	loadinit:function(){
		js.ajaxss('reimweb','loadinit',function(a){
			adminid=a.myrs.id;
			adminname=a.myrs.name;
			adminface=a.myrs.face;
			systemtitle=a.myrs.reimtitle;
			get('index_face').src=adminface;
			$('#index_name').html(adminname);
			var tits = ''+systemtitle+'-'+adminname+'';
			document.title = tits
			nwjs.createtray(tits, 1);
			fromwshost=jm.base64decode(a.myrs.fromwshost);
			fromrecid=a.myrs.fromrecid;
			connectserver();
			maindata = a;
			im.showuser(a.uarr, true);
			im.showgroup(a.garr)
			im.showagent(a.agent);
			im.showweidu(a.wdarr);
			im.showhistory(a.history);
			im.initsearchinput();			
		});
	},
	setwd:function(type, aid, oi){
		var i,sot,bo=false;
		for(i=0; i<this.wdarr.length; i++){
			if(this.wdarr[i].type==type && this.wdarr[i].id == aid){
				sot = this.wdarr[i].stotal;
				if(oi==0)sot=0;
				if(oi==1)sot++;
				this.wdarr[i].stotal = sot;
				bo = true;
			}
		}
		if(!bo){
			this.wdarr.push({
				id:aid,type:type,stotal:oi
			});
		}
		this.showweidu(this.wdarr);
	},
	showweidu:function(wda){
		var i,to=0,d=[],a,sto,tylx;
		for(i=0; i<wda.length; i++){
			sto		= parseInt(wda[i].stotal);
			tylx	= wda[i].type;
			if(tylx=='taolun')tylx='group';
			if(sto>0){
				to = to + sto;
				if(tylx=='user'){
					a = userarr[wda[i].id];
					if(a){
						wda[i].name  = a.name;
						wda[i].icons = a.face;
					}
				}
				if(tylx=='group' || tylx=='taolun' || tylx=='system'){
					a = grouparr[wda[i].id];
					if(a){
						wda[i].name  = a.name;
						wda[i].icons = a.face;
					}
				}
				if(tylx=='agent'){
					a = agentarr[wda[i].id];
					if(a){
						wda[i].name  = a.name;
						wda[i].icons = a.face;
					}
				}
				d.push(wda[i]);
			}
		}
		this.wdarr = d;
		var inos = 0;
		if(to>0)inos=1;
		$('#tixingtotal').html(to);
		nwjs.changeicon(to);
		this.wdtotal = to;
		if(this.showwemenu){
			this.showwemenu.setData(d);
			return;
		}
		if(to>0){
			this.showwemenu = $('#tixingtotalspan').rockmenu({
				data:d,top:24,left:15,width:160,
				resultbody:function(d1, o, oi){
					return '<img src="'+d1.icons+'" class="iconsa">'+d1.name+' <font color=#ff6600>('+d1.stotal+')</font>';
				},
				itemsclick:function(d1){
					if(d1.type=='user'){
						get('user_'+d1.id+'').click();
					}
					if(d1.type=='group' || d1.type=='taolun' || d1.type=='system'){
						get('group_'+d1.id+'').click();
					}
					if(d1.type=='agent'){
						im.openagents(d1.id);
					}
				}
			});
		}
	},
	showuser:function(a, clab){
		var s = '',i,st,o1,o2,ol,
			o = $('#grouplist8');
		if(clab)o.html('<span id="userlistonline"></span><span id="userlistoffline"></span>');
		for(i=0; i<a.length; i++){
			ol = a[i].imonline;
			if(!clab)$('#user_'+a[i].id+'').remove();
			s  = this.getusers(a[i], 0);
			userarr[a[i].id] = a[i];
			o2 = $('#userlist'+this.onlinearr[ol]+'');
			o1 = this.getsort(a[i].name, ol);
			if(o1){
				o1.before(s);
			}else{
				o2.append(s);
			}
		}
		var zt = o.find('div').length;
		$('#total_user').html(''+zt);
		zt = $('#userlistonline').find('div').length;
		$('#total_useronline').html(''+zt);
	},
	//加载组
	loadgroup:function(){
		js.ajaxss('reimweb','loadgroup', function(a){
			im.showgroup(a.garr)
			im.showweidu(a.wdarr);
		});
	},
	showgroup:function(a){
		var s = '',i,lx,
			toa  = [0,0,0];
		for(i=0; i<3; i++){	
			$('#grouplist'+i+'').html('');	
			$('#grouptotal'+i+'').html('(0)');	
		}
		for(i=0; i<a.length; i++){
			lx	= a[i].type;
			$('#group_'+a[i].id+'').remove();
			s	= '<div id="group_'+a[i].id+'"  onclick="im.opengroup('+a[i].id+')"><img src="'+a[i].face+'" align="absmiddle">'+a[i].name+'</div>';
			grouparr[a[i].id] = a[i];
			toa[lx]++;
			$('#grouptotal'+lx+'').html('('+toa[lx]+')');
			$('#grouplist'+lx+'').append(s);
		}
	},
	showagent:function(a){
		var s = '',lx;
		for(i=0;i<a.length;i++){
			agentarr[a[i].id] = a[i];
			s+='<div id="agent_'+a[i].id+'" oncontextmenu="im.rightdivobj=this" tsaid="'+a[i].id+'"  tsaype="agent" rtype="agent" class="listcont" onclick="im.openagent('+a[i].id+')">';
			s+='	<table width="100%">';
			s+='		<tr>';
			s+='			<td width="45" align="center">';
			s+='				<div style="height:30px;overflow:hidden"><img height="30" width="30" src="'+a[i].face+'"></div>';
			s+='			</td>';
			s+='			<td><div class="index_title">'+a[i].name+'</div><div id="agent_'+a[i].id+'_titles" class="index_titles"></div></td>';
			s+='			<td ><div align="right"><span style="font-size:12px;" class="badge"></span></div></td>';
			s+='			<td width="5"></td>';
			s+='		</tr>';
			s+='	</table>';
			s+='</div>';	
		}
		$('#agentlist').html(s);
	},
	hidealislist:function(oi, o1){
		$('#grouplist'+oi+'').toggle();
		var src = 'xiangyou';
		if(get('grouplist'+oi+'').style.display != 'none')src = 'xiangyou1';
		$(o1).find('img').attr('src','images/im/'+src+'.png');
		if(oi==3)this.showdept(maindata.darr,'fist');
	},
	getusers:function(a,lx, attr){
		var s,st,sid;
		st = '';
		if(a.imonline !=1 )st='offline';
		sid= 'user_'+a.id+'';
		if(!attr)attr='';
		if(lx==1){
			sid= 'userhistory_'+a.id+'';
			$('#'+sid+'').remove();
		}
		if(lx==2)sid='';
		s = '<div class="'+st+'" id="'+sid+'" '+attr+' userid="'+a.id+'" onclick="im.openuser('+a.id+')"><img width="20" height="20" src="'+a.face+'" align="absmiddle">'+a.name+' <span style="font-size:12px">('+a.ranking+')</span></div>';
		return s;
	},
	onlinearr:['offline','online'],
	openuser:function(uid){
		var bo = false,
		winobj = 'windowuser'+uid+'',
			a  = userarr[uid];
		var url= 'user.html?uid='+uid+'&aid='+adminid+'&winobj='+winobj+'&token='+admintoken+'';
		js.open(url, 550,480, winobj,{},{title:a.name});
		this.setwd('user', uid, 0);
	},
	opengroup:function(gid){
		var bo = false,width = 550,types = 'group',
			a  = grouparr[gid],
			na = a.name;
		var winobj = 'windowgroup'+gid+'';
		var url= 'group.html?gid='+gid+'&aid='+adminid+'&winobj='+winobj+'&token='+admintoken+'';
		js.open(url, 550,480, winobj,{},{title:a.name});
		this.setwd(types, gid, 0);
	},
	openagent:function(gid){
		var a = agentarr[gid];
		if(isempt(a.url)){
			this.openagents(gid);
			return;
		}
		var winobj = 'windowagent'+gid+'',url=a.url,lj='?',w=a.width,h=a.height;
		if(url.indexOf('?')>0)lj='&';
		url+=''+lj+'gid='+gid+'&aid='+adminid+'&winobj='+winobj+'&token='+admintoken+'';
		if(h==0)h=480;
		if(w==0)w=700;
		js.open(url, w,h, winobj,{},{title:a.name});
	},
	openagents:function(gid){
		var a = agentarr[gid];
		var winobj = 'windowagents'+gid+'';
		var url='agent.html?gid='+gid+'&aid='+adminid+'&winobj='+winobj+'&token='+admintoken+'';
		js.open(url, 400,450, winobj,{},{title:a.name});
		this.setwd('agent', gid, 0);
	},
	onoffline:function(uid, lx){
		var a = userarr[uid];
		var ol= 0,o2,o1,s;
		if(lx=='online')ol=1;
		if(a){
			if(a.imonline != ol){
				a.imonline = ol;
				im.showuser([a], false);
			}
		//不存在	
		}else{
			$.get(js.getajaxurl('getuserone','index','webim',{sholauid:uid,aid:adminid}), function(da){
				var a = js.decode(da);
				im.showuser(a, false);
			});
		}
		var o = $("div[userid='"+uid+"']");
		o.removeClass();
		if(ol==0)o.addClass('offline');
	},
	getsort:function(na, lx){
		var o  = $('#userlist'+this.onlinearr[lx]+'').find('div');
		var i,len = o.size(),o1,nas='',o2 = false;
		for(i=0; i<len; i++){
			o1 = $(o[i]);
			nas= o1.text();
			if(na.localeCompare(nas)<0){
				o2 = o1;
				break;
			}
		}
		return o2;
	},
	otherlogin:function(){
		window.focus();
		nwjs.winshow();
		var msg='您的帐号已在别的地方登录';
		notifyobj.showpopup(msg,{soundbo:false});
		js.tanbody('close','系统提示',200,150,{
			html:'<div style="padding:15px">'+msg+'</div>',btn:[{
				text:'重新登录'
			}],
			closed:'none'
		});
		$('#close_btn0').click(function(){
			connectcloseexit(true);
		});
		otherlogin=true;
		setTimeout("js.msg('none')",100);
		clearTimeout(relianshotime_time);
	},
	receivemesb:function(d){
		var lx=d.type,sendid=d.adminid,num,ops=false,msg='';
		if(lx=='offoline'){
			this.otherlogin();
			return;
		}
		var a 	= userarr[sendid];
		if(!a)return;
		d.sendname=a.name;
		d.face = a.face;
		if(lx=='onoffline'){
			if(sendid!=adminid)this.onoffline(sendid, d.cont);
		}
		if(lx=='getonline'){
			//this.onoffline(sendid, d.cont);
		}
		if(lx == 'user'){
			num		= 'windowuser'+sendid+'';
			ops 	= js.openarr[num];
			if(ops){
				try{ops.guser.receivemess(d);ops.focus();}catch(e){ops=false;js.msg('msg','出错了1')}
			}
			if(!ops){
				msg = '人员['+d.sendname+']，发来一条信息';
				notifyobj.showpopup(msg,{icon:d.face,sendid:sendid,click:function(b){
					im.openuser(b.sendid);
					return true;
				}});
				this.setwd('user', sendid, 1);
			}
			this.addhistory(lx,sendid);
		}
		if(lx == 'group'){
			var garr= grouparr[d.gid];
			if(!garr)this.loadgroup();
			num		= 'windowgroup'+d.gid+'';
			ops 	= js.openarr[num];
			if(ops){
				try{ops.guser.receivemess(d);ops.focus();}catch(e){ops=false;js.msg('msg','出错了2')}
			}
			if(!ops){
				msg = '人员['+d.sendname+']，发来一条信息，来自['+d.gname+']';
				notifyobj.showpopup(msg,{icon:garr.face,gid:d.gid,click:function(b){
					im.opengroup(b.gid);
					return true;
				}});
				this.setwd('group', d.gid, 1);
			}
			this.addhistory(lx,d.gid);
		}
		if(lx == 'agent'){
			var aarr= agentarr[d.agentid];
			if(!aarr)this.loadagent();
			num		= 'windowagents'+d.agentid+'';
			ops 	= js.openarr[num];
			if(ops){
				try{ops.guser.receivemess(d);}catch(e){ops=false;js.msg('msg','出错了3')}
			}
			msg = '人员['+d.sendname+']通过应用『'+d.agent+'』，发来一条信息';
			notifyobj.showpopup(msg,{icon:aarr.face,gid:d.agentid,click:function(b){
				im.openagents(b.gid);
				return true;
			}});
			if(!ops)this.setwd('agent', d.agentid, 1);
			this.addhistory(lx,d.agentid);
		}
		if(lx == 'loadgroup'){
			im.loadgroup();
		}
	},
	loadagent:function(){
		
	},
	openrecord:function(lx, lxid){
		if(!lx)lx='';
		if(!lxid)lxid='';
		var num = 'openrecord';
		var url = 'record.html?aid='+adminid+'&stype='+lx+'&sid='+lxid+'&token='+admintoken+'&winobj='+num+'';
		var ops = js.open(url, 750,450, num);
		if(ops){
			ops.a_openrecord(lx, lxid);
			setTimeout(function(){ops.focus()},100);
		}
	},
	
	showdept:function(a, lxs){
		var o = $('#grouplist3');
		if(o.html()!='')return;
		var s = this.showdept1(a,0);
		o.html(s);
	},
	showdept1:function(a, oi){
		var i,s='',s1='',st,j=0,facea;
		if(!a)return s;
		for(i=0; i<a.length; i++){
			s1 = this.showdept1(a[i].children, oi+1);
			st = '';
			if(a[i].imonline !=1 && a[i].type=='u'){
				st='class="offline"';
			}	
			if(a[i].type=='u'){
				st+=' userid="'+a[i].uid+'"';
			}else{
				deptarr[a[i].did] = a[i];
			}
			facea = a[i].face;
			if(isempt(facea)){
				facea='images/im/filess.png';
				if(s1=='')facea='images/im/file.png';
			}	
			s+='<div '+st+' id="dept_'+a[i].id+'" ondblclick="im.opendept(\''+a[i].id+'\')">';
			for(j=0;j<oi;j++)s+='<img src="images/white.gif" align="absmiddle">';
			if(a[i].type=='u'){
				s+='<img src="'+facea+'" align="absmiddle">';
			}else{
				s+='<img src="'+facea+'" onclick="im.openadept(\''+a[i].id+'\')" align="absmiddle">';
			}
			s+=''+a[i].name+'</div>';
			if(s1!=''){
				s+='<span style="display:none" id="downdept_'+a[i].id+'">'+s1+'</span>';
			}
		}
		return s;
	},
	opendept:function(sid){
		var t = sid.substr(0, 1),
		   id1= sid.substr(1);
		if(t=='u'){
			this.openuser(id1);
		}else{
			
		}
	},
	openadept:function(sid){
		$('#downdept_'+sid+'').toggle();
	},
	createlun:function(){
		var s='<div style="padding:10px">';
		s+='<div>创建讨论组名称：</div>';
		s+='<div style="padding:10px"><input id="keylasou" maxlength="15" style="line-height:26px;height:30px;border:1px #cccccc solid;background-color:white;width:120px;padding:0px 5px"></div>';
		s+='<div style="padding:10px"><a class="webbtn" onclick="return false" id="yaoqingbtn" href="javascript:">确定</a>&nbsp;<span id="msgview_yaoqing"></span></div>';
		s+='</div>';
		js.tanbody('yaoqingla','创建讨论组', 200,200,{html:s,bbar:'none'});
		$('#yaoqingbtn').click(function(){
			var v = get('keylasou').value;
			if(v==''){
				js.setmsg('没有输入','red', 'msgview_yaoqing');
				return;
			}
			js.setmsg('创建中...','', 'msgview_yaoqing');
			js.ajaxss('reimweb','createlun', function(da){
				if(da.indexOf('success')==0){
					js.msg('success','创建成功');
					im.loadgroup();
					js.tanclose('yaoqingla');
				}else{
					js.setmsg(da,'red', 'msgview_yaoqing');
				}
			},{val:jm.base64encode(v)});
		});
		get('keylasou').focus();
		return false;
	},
	
	showhistory:function(a){
		this.showhistorys(a, 0);
	},
	showhistorys:function(da,lxa){
		var o  = $('#recoredlist'),i,a,d,s1,attr;
		if(lxa==0)o.html('');
		for(i=0; i<da.length;i++){
			a = da[i];s1= '';
			attr = 'oncontextmenu="im.rightdivobj=this" tsaid="'+a.receid+'" tsaype="'+a.type+'" ';
			if(a.type=='user'){
				d = userarr[a.receid];
				if(d){
					s1 = this.getusers(d, 1, attr+' rtype="hist"');
				}
			}else if(a.type=='group'){
				d 	= grouparr[a.receid];
				if(d){
					$('#grouphistory_'+d.id+'').remove();
					s1	= '<div id="grouphistory_'+d.id+'" '+attr+' rtype="hist" onclick="im.opengroup('+d.id+')"><img src="'+d.face+'" align="absmiddle">'+d.name+'</div>';
				}
			}else if(a.type=='agent'){
				d 	= agentarr[a.receid];
				if(d){
					$('#agenthistory_'+d.id+'').remove();
					s1	= '<div id="agenthistory_'+d.id+'" '+attr+' rtype="histagent" onclick="im.openagent('+d.id+')"><img src="'+d.face+'" align="absmiddle">'+d.name+'</div>';
				}
			}
			if(s1!=''){
				if(lxa==0)o.append(s1);
				if(lxa==1)o.prepend(s1);
			}
		}
	},
	addhistory:function(type,sid){
		this.showhistorys([{type:type,receid:sid}], 1);
	},
	removehistory:function(lx){
		var o = $(this.rightobjla);
		var type = o.attr('divtype'),
			typeid = o.attr('divtypeid');
		o.remove();
		if(lx==1)type='all';
		try{
			s = window.external.delhistory(type,typeid);
		}catch(e){}
		if(type=='all'){
			$('#recoredlist').html('');
		}
	},
	
	initsearchinput:function(){
		var o = $('#searchinput');
		o.focus(function(){
			this.select();
			im.initsearchinputkeyup();
		});
		o.blur(function(){
			im.initsearchinputblue();
		});
		o.keyup(function(){
			im.initsearchinputkeyup();
		});
		this.initsearchinputmenu = $.rockmenu({
			data:[],donghua:false,
			resultbody:function(d1, o, oi){
				return im.getusers(d1,2);
			},autohide:false
		});
	},
	initsearchinputblue:function(o){
		var o = $('#searchinput');
		if(isempt(o.val()))o.val('搜索联系人');
	},
	initsearchinputkeyup:function(){
		clearTimeout(this.initsearchinputtime);
		this.initsearchinputtime = setTimeout('im.initsearchinputkeyups()', 300);
	},
	initsearchinputkeyups:function(){
		var o = $('#searchinput');
		var val = o.val();
		if(val.indexOf('搜索')>-1)val='';
		var d = [],i,a,oi=0;
		if(val){for(i in userarr){
			a = userarr[i];
			if(a.name.indexOf(val)>-1 || a.ranking.indexOf(val)>-1){
				d.push(a);
				oi++;
			}
			if(oi>=15)break;
		}}
		if(oi==0){
			this.initsearchinputmenu.remove();
			return;
		}
		this.initsearchinputmenu.setData(d);
		var off = o.offset();
		this.initsearchinputmenu.showAt(4, off.top+36, winWb()-6);
	},
	initnotify:function(){
		var lx=notifyobj.getaccess();
		if(lx!='ok'){
			js.msg('msg','为了可及时收到信息通知 <br>请开启提醒,<span class="zhu cursor" onclick="im.indexsyscog()">[开启]</span>',-1);
		}
	},
	indexsyscogs:function(){
		var str = notifyobj.getnotifystr('im.indexsyscogss()');
		return '桌面通知提醒'+str+'';
	},
	indexsyscogss:function(){
		notifyobj.opennotify(function(){
			$('#indexsyscog_msg').html(im.indexsyscogs());
		});
	},
	getsound:function(){
		var lx = js.getoption('soundcog'),chs=false;
		if(lx=='')lx='1';
		if(lx==1)chs=true;
		return chs;
	},
	setsound:function(o1){
		var lx=(o1.checked)?'1':'2';
		js.setoption('soundcog', lx);
		notifyobj.setsound(o1.checked);
	},
	indexsyscog:function(){
		var chs= (this.getsound())?'checked':'';
		var s='<div style="height:100px;">';
		s+='<div style="padding:5px 0px;" id="indexsyscog_msg">'+this.indexsyscogs()+'</div>';
		s+='<div style="padding:5px 0px;border-top:1px #eeeeee solid"><label><input '+chs+' onclick="im.setsound(this)" type="checkbox">新信息声音提示</label></div>';
		if(nwjsgui){
			var ver=nwjsgui.App.manifest.version;
			s+='<div style="padding:5px 0px;border-top:1px #eeeeee solid">&nbsp;当前版本V'+ver+',<a href="javascript:;" onclick="nwjs.banben(this)">[检测版本]</a></div>';
		}
		s+='</div>';
		js.tanbody('syscogshow','设置',220,160,{
			html:s,
			bodystyle:'padding:5px'
		});
	},
	getrighttype:function(){
		
	},
	bodyright:function(e, lx){
		var rt = $(im.rightdivobj).attr('rtype');
		if(isempt(rt))return;
		var d=[{name:'打开信息窗口',lx:0}];
		if(rt.indexOf('agent')>-1){
			d.push({name:'打开窗口',lx:1});
		}
		if(rt.indexOf('hist')>-1){
			d.push({name:'删除此记录',lx:2});
		}
		d.push({name:'查看信息记录',lx:3});
		righthistroboj.setData(d);
		righthistroboj.showAt(e.clientX-3,e.clientY-3);
	},
	rightclick:function(d){
		var lx=d.lx;
		var o1 = $(im.rightdivobj);
		var tsaid = o1.attr('tsaid'),
			tsayp = o1.attr('tsaype');
		if(lx==0){
			if(tsayp=='agent')im.openagents(tsaid);
			if(tsayp=='user')im.openuser(tsaid);
			if(tsayp=='group')im.opengroup(tsaid);
		}
		if(lx==1){
			im.openagent(tsaid);
		}
		if(lx==2){
			o1.remove();
			js.ajaxss('reimweb','remhistory',function(){},{type:tsayp,mid:tsaid});
		}
		if(lx==3)im.openrecord(tsayp, tsaid);
	}
}