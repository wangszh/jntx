function initbody(){
	if(!opener){alert('sorry!');return;}
	adminid=js.request('aid');
	receiveid=js.request('gid');
	var garr = opener.agentarr[receiveid];
	receivename=garr.name;
	adminname = opener.adminname;
	adminface = opener.adminface;
	receiveface=garr.face;

	document.title=receivename;
	
	$('#uname_div').html(receivename);
	get('uface').src=receiveface;
	get('icon_show').href=receiveface;
	
	resetw();
	$(window).resize(function(){
		resetw();
	});
	$('body').keydown(guser.onkeyup);
	js.getsplit();
	$('#AltC').click(function(){
		connectclose();
	});
	guser.init();
}

function resetw(){
	var h = winHb();
	if(h<50)return;
	h = h-40-36;
	$('#listcontent').css({height:''+(h)+'px'});
}

var guser = {
	bool:false,
	loadcount:1,
	init:function(){
		js.setmsg('加载中...','','histordiv');
		js.ajaxss('reim','getgroupreinfo', function(ret){
			$('#histordiv').remove();
			var a = ret.rows;
			var i,len = a.length,cont,lex,nas,fase,str,url;
			for(i= len-1; i>=0; i--){
				lex = 'left';
				nas = a[i].sendname;
				fase= a[i].face;
				if(a[i].sendid==adminid){
					nas='我';
					lex='right';
				}
				str = jm.base64decode(a[i].cont);
				url = strformat.geturl(a[i]);
				if(!isempt(url)){
					str+='<br><a href="javascript:" onclick="return openurlla(\''+url+'\')">打开地址&gt;&gt;</a>';
				}
				cont= strformat.showqp(lex,nas,a[i].optdt, str,'', fase);
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
		},{type:'agent',receid:receiveid,loadcount:this.loadcount});
		this.loadcount++;
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
	receivemess:function(d){
		var cont= strformat.showqp('left',d.sendname,d.optdt, jm.base64decode(d.cont), '', d.face);
		this.addcont(cont);
		this.setyd(d.messid);
	},
	setyd :function(s){
		if(s)js.ajaxss('reim','setyd',function(){},{ids:s});
	},
	onkeyup:function(evtnt){
		var code	= event.keyCode;
		if(code==27){
			connectclose();
			return false;
		}
		if(event.altKey){
			if(code == 67){
				connectclose();
				return false;
			}
		}
		return true;
	}
}