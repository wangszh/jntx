////工具 -> Internet选项 -> 安全 -> 自定义级别 -> 找到“其他”中的“将本地文件上载至服务器时包含本地目录路径”，选中“启用”
var upload = {
	upsize:1024*200,
	mkdir:js.now('Y-m'),
	bool:false,
	maxsize:1, //最大10M
	uptype:'',
	upsizestring:'',
	rand:function(){
		var rand	= ''+js.now('d_His')+''+parseInt(Math.random()*9999)+'';
		return rand;
	},
	reset:function(){
		document.myformupfile.reset();
	},
	changefile:function(lx){
		if(this.bool){
			js.msg('msg','太快了?请稍后在试!');
			return;
		}
		this.uptype = lx;
		get('filesssid').click();
	},
	init:function(){
		$('#filesssid').change(function(){
			upload.filechange(this);
		});
	},
	filechange:function(o){
		this.removeerror();
		var nas = o.value;
		var filename = nas.substr(nas.lastIndexOf('\\')+1);
		var fileext	 = filename.substr(filename.lastIndexOf('.')+1).toLowerCase();
		var tstype=',jpg,png,gif,bmp,jpeg,';
		if(this.uptype!='image'){
			tstype += 'docx,doc,zip,rar,xls,xlsx,ppt,pptx,pdf,psd,';
		}
		if(tstype.indexOf(','+fileext+',')<0){
			this.errorprogress('['+filename+']类型的文件不符合要求');
			this.reset();
			return false;
		}
		if(o.files){
			var file		= o.files[0];
			var filesize	= file.size;
			var filesizecn	= js.formatsize(filesize);
			if(filesize>1024*1024*this.maxsize){
				this.errorprogress('['+filename+']文件太大，应在'+this.maxsize+'M内，当前文件'+filesizecn+'');
				this.reset();
				return false;
			}
		}
		this.startup('upfile',filename);
	},
	startup:function(lx){
		$('body').append('<iframe name="uploadiframe" style="display:none;width:0px;height:0px;" id="uploadiframeid"></iframe>');
		$('#uploadiframeid').load(function(){
			upload.iframeback();
		});
		var forms=document['myform'+lx+''];
		forms.action = js.apiurl(lx,'upload',{thumbtype:1,maxsize:this.maxsize});
		try{forms.submit();}catch(e){
			js.msg('msg','无法上传发送,请不要用IE');
			$('#uploadiframeid').remove();
			return;
		}
		this.bool=true;
		this.progress('<img src="images/loadings.gif" align="absmiddle"> ['+filename+']上传中...', 100);
	},
	upbase64:function(){
		var nr=$('#upcontent').val();
		if(nr=='')return;
		this.uptype='image';
		this.startup('upcont','截图.png');
	},
	iframeback:function(){
		if(!this.bool)return;
		$('#uploadiframeid').remove();
		$('#upcontent').val('');
		js.ajaxss('upload','getfile', function(ret){
			upload.uploadsuccess(ret);
		},{},'none',function(str){
			upload.errorprogress(str);
			upload.progresshide();
		});
		this.bool=false;
	},
	uploadback:function(str, fsize, path){
		if(str==''){
			this.errorprogress('无法读取文件,无法上传2');
			return;
		}
		fsize		= parseInt(fsize);
		this.readinit(path, 'aa',0);
		var len		= str.length;
		this.maxsend= Math.ceil(len/this.upsize);
		this.uparr.filecout 	= str;
		this.uparr.filesize 	= fsize;
		this.uparr.filesizecn 	= js.formatsize(this.uparr.filesize);
		this.starts(0);
	},
	progress:function(text, w){
		if(!get('progress_show')){
			var s = '<div id="progress_show" class="progresscls"><div id="progress_text" class="div02">'+text+'</div><div id="progress_ress" class="div01"></div></div>';
			$('#contentdiv').append(s);
		}
		$('#progress_text').html(text);
		$('#progress_ress').css('width',''+w+'%');
	},
	progresshide:function(){
		setTimeout("$('#progress_show').remove()", 500);
	},
	uploadsuccess:function(d){
		this.progress('上传成功',100);
		this.bool = false;
		this.progresshide();
		var lx = this.uptype,cont;
		if(lx == 'image'){
			cont = strformat.addcode('图片', '[IMGS]'+apiurl+''+d.thumbpath+'[/IMGS]');
			$('#viewimg').attr('src', ''+apiurl+''+d.thumbpath+'');
			$('#viewimgtext').html('图片'+strformat.sendcuxo+'预览');
		}else{
			cont = '[FILE]'+d.filename+'|'+d.id+'|'+d.fileext+'[/FILE] ('+d.filesizecn+')';
			cont = strformat.addcode('文件:'+d.filename+'', cont);
		}
		var o = $('#content');
		o.val(o.val()+cont);
		o.focus();
		this.reset();
	},
	errorprogress :function(txt){
		this.bool = false;
		this.progress('<font color=red>'+txt+'</font>&nbsp;<a href="javascript:" onclick="$(\'#progress_show\').remove();return false;">[取消]</a>', 0);
		this.reset();
	},
	removeerror:function(){
		$('#progress_show').remove();
	},
	uploaderror:function(){
		this.errorprogress('无法读取文件,无法上传1');
	},
	
	readclip:function(evt){
		var clipboardData = evt.clipboardData;
		if(!clipboardData)return;
		for(var i=0; i<clipboardData.items.length; i++){  
			var item = clipboardData.items[i];  
			if(item.kind=='file'&&item.type.match(/^image\//i)){  
				var blob = item.getAsFile(),reader = new FileReader();  
				reader.onload=function(){  
					var cont=this.result;
					get('viewimg').src=cont;
					$('#upcontent').val(cont.substr(cont.indexOf(',')+1));
					$('#viewimgtext').html('<a onclick="upload.upbase64()" href="javascript:;">上传截图</a>');
				}  
				reader.readAsDataURL(blob);
			}  
		} 
	},
	cropput:function(evt){
		js.msg('msg','请使用快捷键Ctrl+V');
	},
	//截屏
	cropScreen:function(lx){
		if(!nwjsgui){
			js.msg('msg','无法使用截图，请使用客户端,<a href="http://www.rockoa.com/view_reim.html" target="_blank">[去下载]</a>');
			return;
		}
		var oatg = this.getpath();
		nwjsgui.Shell.openItem(''+oatg+'/images/reimcaptScreen.exe');
	},
	getpath:function(){
		var url = nwjsgui.App.manifest.main;
		var las = url.lastIndexOf('\\');
		var oatg = url.substr(0, las);
		if(oatg.substr(0,5)=='file:')oatg=oatg.substr(7)
		return oatg;
	},
	getemts:function(o){
		if(!get('aemtsdiv')){
			var s = '<div id="aemtsdiv" style="width:400px;height:200px;overflow-y:auto;border:1px #cccccc solid;background:white;box-shadow:0px 0px 5px rgba(0,0,0,0.3);left:3px;top:5px;position:absolute;display:none;z-index:6">';
			s+='<div style="padding:5px">';
			s+=this.getemtsbq('qq',0, 96, 11, 24);
			s+='</div>';
			s+='</div>';
			$('body').append(s);
			js.addbody('emts','hide','aemtsdiv');
		}
		var o1  = $('#aemtsdiv');
		o1.toggle();
		var off = o.offset();
		o1.css('top',''+(off.top-205)+'px');
	},
	getemtsbq:function(wj, oi1,oi2, fzd, dx){
		var i,oi=0,j1 = js.float(100/fzd);
		var s = '<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>';
		for(i=oi1; i<=oi2; i++){
			oi++;
			s+='<td width="'+j1+'%" title="'+strformat.emotsarr[i+1]+'" align="center"><img onclick="upload.backemts(\''+strformat.emotsarr[i+1]+'\')" src="images/im/emots/'+wj+'/'+i+'.gif" width="'+dx+'" height="'+dx+'"></td>';
			if(oi % fzd==0)s+='</tr><tr>';
		}
		s+='</tr></table>';
		return s;
	},
	backemts:function(s){
		var o = $('#content');
		o.val(o.val()+s);
		o.focus();
		$('#aemtsdiv').hide();
	}
};

var strformat = {
	sendcodearr:{},
	sendcuxo:0,
	emotsstr:',[微笑],[撇嘴],[色],[发呆],[得意],[流泪],[害羞],[闭嘴],[睡],[大哭],[尴尬],[发怒],[调皮],[呲牙],[惊讶],[难过],[酷],[冷汗],[抓狂],[吐],[偷笑],[愉快],[白眼],[傲慢],[饥饿],[困],[恐惧],[流汗],[憨笑],[悠闲],[奋斗],[咒骂],[疑问],[嘘],[晕],[疯了],[衰],[骷髅],[敲打],[再见],[擦汗],[抠鼻],[鼓掌],[糗大了],[坏笑],[左哼哼],[右哼哼],[哈欠],[鄙视],[委屈],[快哭了],[阴险],[亲亲],[吓],[可怜],[无语],[蜡烛],[叹气],[石化],[狂汗],[扮鬼脸],[偷可怜],[猪头],[玫瑰],[凋谢],[嘴唇],[爱心],[心碎],[蛋糕],[闪电],[炸弹],[刀],[足球],[瓢虫],[便便],[月亮],[太阳],[礼物],[拥抱],[强],[弱],[握手],[胜利],[抱拳],[勾引],[拳头],[差劲],[爱你],[NO],[OK],[菜刀],[西瓜],[啤酒],[篮球],[乒乓],[咖啡],[饭]',
	addcode:function(key, val){
		this.sendcuxo++;
		key	= key+','+this.sendcuxo;
		this.sendcodearr[key] = val;
		return '[C]'+key+'[/C]'
	},
	geturl:function(d){
		if(!d)d={'url':''};
		var url = d.url;
		if(!url&&d.table&&d.mid)url='?m=flow&a=view&d=taskrun&table='+d.table+'&mid='+d.mid+'&uid='+adminid+'';
		return url;
	},
	//格式化内容
	strcont:function(nr){
		//获取表情的转化
		var str = unescape(nr);
		str	= this.strcontss(str,'A', '<a target="_blank" href="{s1}">{s2}</a>');//[A]名称|URL[/A]
		str	= this.strcontss(str,'IMGS', '<img src="{s1}" onclick="strformat.openimg(this.src)">');
		str	= this.strcontss(str,'IMG', '<img src="{s1}" onclick="strformat.openimg(this.src)" width="150">');
		str	= this.strcontss(str,'FILE', '<a onclick="strformat.downshow(\'{s1}\')" href="javascript:;"><img src="images/fileicons/{s3}.gif" align="absmiddle" class="icon">{s2}</a>');
		var patt1	= new RegExp("\\[(.*?)\\](.*?)", "gi"),emu,i,st1,oi;
		 emu		= str.match(patt1);
		if(emu!=null){
			for(i=0;i<emu.length; i++){
				st1=emu[i];
				oi=this.emotsarrss[st1];
				if(oi)str	= str.replace(st1, '<img src="images/im/emots/qq/'+(oi-1)+'.gif">');
			}
		}
		str	= str.replace(/\n/gi, '<br>');
		return str;
	},
	downshow:function(sid){
		var url = 'mode/upload/uploadshow.php?id='+sid+'';
		openurlla(url, 400, 300);
		return false;
	},
	strcontss:function(str,bq,rstr){
		var patt1	= new RegExp("\\["+bq+"\\](.*?)\\[\\/"+bq+"\\]", "gi");
		var emu		= str.match(patt1);
		if(emu != null){
			bq1	= bq.toLowerCase();
			for(var i=0;i<emu.length; i++){
				var s0	= emu[i].replace('['+bq+']','').replace('[/'+bq+']','');
				s0		= s0.replace('['+bq1+']','').replace('[/'+bq1+']','');//小写的
				var s1	= s0,s2 = s0,s3='',sa;
				if(s0.indexOf('|')>0){
					sa = s0.split('|');
					s1 = sa[1];
					s2 = sa[0];
					s3 = sa[2];
				}
				var s4	= rstr.replace('{s1}',s1).replace('{s2}',s2).replace('{s3}',s3);
				str		= str.replace(emu[i], s4);
			}
		}
		return str;
	},
	
	//发送前信息转化
	sendinstr:function(str, tuas){
		var bq		= 'C';
		var patt1	= new RegExp("\\["+bq+"\\](.*?)\\[\\/"+bq+"\\]", "gi");
		var emu		= str.match(patt1);
		
		if(emu != null){
			for(var i=0;i<emu.length; i++){
				var s0	= emu[i].replace('['+bq+']','').replace('[/'+bq+']','');
				str		= str.replace(emu[i], this.sendcodearr[s0]);
			}
		}
		var nowa	= js.serverdt('Y-m-d H:i:s 星期W'),
			nowas	= nowa.split(' ');
		var ztstr	= [['now',nowa],['date',nowas[0]],['time',nowas[1]],['week',nowas[2]],['百度','https://www.baidu.com/',1]];
		var patt1,a,thnr,ths='';
		for(var i=0; i<ztstr.length; i++){
			a	=	ztstr[i];
			if(a[2] == 1){
				patt1	= new RegExp(""+a[0]+"", "gi");
				thnr	= '[A]'+a[0]+'|'+a[1]+'[/A]';
			}else{
				thnr	= a[1];
				patt1	= new RegExp("\\["+a[0]+"\\]", "gi");
			}
			str	= str.replace(patt1, thnr);
		}
		return str;
	},
	
	//气泡样式
	showqp:function(type,name,dt,cont,nuid, fase, msid){
		
		var nr	= '';
		nr+='<div class="ltcont">';
		nr+='	<div class="qipao" align="'+type+'">';
		nr+='		<div class="dt" style="padding-'+type+':61px">'+name+'('+dt.substr(5,11)+')'+((msid)?'<input name="checkname" value="'+msid+'" type="checkbox">':'')+'</div>';
		nr+='		<table border="0" cellspacing="0" cellpadding="0">';
		
		nr+='		<tr valign="top">';
		if(type == 'left'){
			nr+='			<td width="50" align="center"><img src="'+fase+'"  width="40" height="40"></td>';
			nr+='			<td><div class="qipao'+type+'"><img src="images/im/qipaoleft.jpg"></div></td>';
		}else{
			nr+='			<td width="60" align="right">';
			if(nuid)nr+='<img src="images/loadings.gif" title="发送中..." id="'+nuid+'" style="margin-top:5px" align="absmiddle">&nbsp;';
			nr+='			</td>';
		}
		
		nr+='			<td><div class="qipaocont qipaocont'+type+'">';//内容显示
		nr+='			'+this.strcont(cont)+'';
		nr+='			</div></td>';
		
		if(type == 'right'){
			nr+='			<td><div class="qipao'+type+'"><img src="images/im/qipaoright.jpg"></div></td>';
			nr+='			<td width="50" align="center"><img src="'+fase+'"  width="40" height="40"></td>';
		}else{
			nr+='			<td width="60"></td>';
		}
		
		nr+='		</tr></table>';
		nr+='	</div>';
		nr+='</div>';
		return nr;
	},
	
	//打开图片
	openimg:function(src)
	{
		var img = src;
		if(src.indexOf('thumb')>0){
			var ext = src.substr(src.lastIndexOf('.')+1);
			img = src.substr(0,src.lastIndexOf('_'))+'.'+ext;
		}
		js.open(img);
	},
	emotsarrss:{},
	init:function(){
		var a = this.emotsstr.split(',');
		this.emotsarr=a;
		var len = a.length,i;
		for(i=1;i<len;i++){
			this.emotsarrss[a[i]]=i;
		}
	}
}
strformat.init();

function openrecord(lx,sid){
	opener.im.openrecord(lx,sid);
}

function connectclose(){
	window.close();	
}

function openurlla(url, w, h){
	if(url.indexOf('http')<0)url=apiurl+url;
	if(!w)w=850;
	if(!h)h=500;
	url+='&token='+admintoken+'';
	js.open(url, w,h);
	return false;
}