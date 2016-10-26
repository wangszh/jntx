function initbody(){
	if(!opener){alert('sorry!');return;}
	adminid=js.request('aid');
	receiveid=js.request('uid');
	var uarr = opener.userarr[receiveid];
	receivename=uarr.name;
	adminname = opener.adminname;
	adminface = opener.adminface;
	
	receiveface=uarr.face;
	receiverank=uarr.ranking;
	document.title=receivename;
	
	
	$('#uname_div').html(receivename);
	$('#rightname').html(receivename);
	$('#rightranking').html(receiverank);
	get('uface').src=receiveface;
	get('uface_big').src=receiveface;
	get('icon_show').href=receiveface;
	if(adminface!='')get('viewimg').src=adminface;
	window.focus();
	get('content').focus();
	resetw();
	$(window).resize(function(){
		resetw();
	});
	$('body').keydown(guser.onkeyup);
	js.getsplit();
	$('#AltC').click(function(){
		connectclose();
	});
	$('#AltS').click(function(){
		guser.send();
	});
	$('#fileid').change(function(){
		upload.change(this);
	});
	$("a[tools]").click(function(evt){
		guser.clicktools(this,evt);
	});
	$('body').click(function(e){
		js.downbody(this, e);
	});
	guser.init();
	upload.init();
}

function resetw(){
	var h = winHb();
	if(h<50)return;
	h = h-40-100-36-30;
	$('#listcontent').css({height:''+(h)+'px'});
}

var guser = {
	bool:false,
	init:function(){
		js.setmsg('加载中...','','histordiv');
		js.ajaxss('reim','getuserreinfo', function(ret){
			$('#histordiv').remove();
			var a = ret.rows;
			var i,len = a.length,cont,lex,nas,fase;
			for(i= len-1; i>=0; i--){
				lex = 'right';
				nas = '我';
				fase= ''+adminface;
				if(a[i].sendid==receiveid){
					lex='left';
					nas= receivename;
					fase= ''+receiveface;
				}
				cont= strformat.showqp(lex,nas,a[i].optdt, jm.base64decode(a[i].cont),'', fase);
				guser.addcont(cont);
			}
			if(len>0){
				var s = '<div id="histordiv" onclick="guser.init()" style="padding:10px;color:#aaaaaa;font-size:12px" align="center">';
				if(ret.wdtotal==0){
					s+='---------↑以上是历史记录---------';
				}else{
					s+='---↑以上是历史,还有未读信息'+ret.wdtotal+'条,点击加载---';
				}
				s+='</div>';
				$('#listcontent').append(s);
			}
		},{type:'user',receid:receiveid});
	},
	addcont:function( cont){
		var o	= $('#listcontent');
		o.append(cont);
		clearTimeout(this.scrolltime);
		this.scrolltime	= setTimeout(function(){
			if(get('listcontent'))o.animate({scrollTop:get('listcontent').scrollHeight},100);
		}, 50);
	},
	strcont:function(nr){
		var str	= strformat.strcont(nr);
		return str;
	},
	now:function(){
		return js.serverdt();
	},
	send:function(ssnr){
		js.setmsg('');
		if(js.ajaxbool)return;
		var o	= $('#content');
		var nr	= strformat.sendinstr(o.val());
		nr		= nr.replace(/</gi,'&lt;').replace(/>/gi,'&gt;').replace(/\n/gi,'<br>');
		if(ssnr)nr=ssnr;
		if(isempt(nr))return false;
		var conss = jm.base64encode(nr);
		if(conss.length>3990){
			js.setmsg('发送内容太多了');
			return;
		}
		var nuid= js.now('time');
		var now	= this.now();
		var cont= strformat.showqp('right','我',now, nr, nuid, adminface);
		this.addcont(cont);
		o.val('');
		o.focus();
		var data = {cont:conss,receid:receiveid,optdt:jm.base64encode(now),nuid:nuid};
		js.ajaxss('reim','senduser',function(a){
			guser.sendsuccess(a,nr, nuid);
		},data,'', function(){
			guser.senderror(nuid);
		});
		return false;
	},
	senderror:function(nuid){
		js.ajaxbool = false;
		get(nuid).src='images/error.png';
		get(nuid).title='发送失败';
	},
	sendsuccess:function(d,nr, nuid){
		this.bool = false;
		if(!d.id){
			this.senderror(nuid);
			return;
		}
		$('#'+d.nuid+'').remove();
		var bo = false;
		d.messid=d.id;
		d.face  = adminface;
		try{
			opener.send(d);
			opener.im.addhistory('user',receiveid);
			bo=true;
		}catch(e){}
		if(!bo)js.msg('msg','信息不能及时推送，但已保存到服务器');
	},
	//接收到内容
	receivemess:function(d){
		var cont= strformat.showqp('left',d.sendname,d.optdt, jm.base64decode(d.cont), '', d.face);
		this.addcont(cont);
		this.setyd(d.messid);
	},
	
	//更新为已读
	setyd :function(s){
		if(s)js.ajaxss('reim','setyd',function(){},{ids:s});
	},
	
	onkeyup:function(event){
		var code	= event.keyCode;
		if(code==27){
			connectclose();
			return false;
		}
		if(event.ctrlKey){//Ctrl+Enter发送
			
			if(code == 13){
				guser.send();
				return false;
			}
		}
		if(event.altKey){
			if(code == 83){
				guser.send();
				return false;
			}
			if(code == 67){
				connectclose();
				return false;
			}
		}
		return true;
	},
	clicktools:function(o1,evt){
		var o = $(o1);
		var lx= o.attr('tools');
		if(lx=='image' || lx=='file'){
			upload.changefile(lx);
		}
		if(lx=='clear'){
			$('#listcontent').html('');
		}
		if(lx == 'crop'){
			upload.cropScreen();
		}
		if(lx == 'cropput'){
			upload.cropput(evt);
		}
		if(lx=='emts'){
			upload.getemts(o);
		}
		if(lx=='jilu'){
			openrecord('user', receiveid);
			return false;
		}
	}
}