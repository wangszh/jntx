/**
*	nwjs
*/
var nwjs={
	init:function(){
		this.nw = nwjsgui;
		if(!this.nw)return;
		this.win = nwjsgui.Window.get();
	},
	
	createtray:function(tls, lx){
		if(!this.nw)return;
		var icon = 'images/logo.png';
		if(lx==0)icon='images/logo_hui.png';
		var tray = new nwjsgui.Tray({ title:tls, icon: icon});
		tray.tooltip = tls;
		this.win.setShowInTaskbar(false);
		var menu = new nwjsgui.Menu();
		menu.append(new nwjsgui.MenuItem({label: '打开窗口',click:function(){
			nwjs.winshow();
		}}));
		menu.append(new nwjsgui.MenuItem({label: '退出',click:function(){
			nwjs.win.close();
		}}));
		
		tray.menu = menu;
		
		tray.on('click',function(){
			nwjs.winshow();
		});
		
		this.tray = tray;
		if(lx==0)return;
		
		this.win.removeAllListeners('minimize');
		this.win.removeAllListeners('close');
		this.win.on('minimize',function(){
			nwjs.win.hide();
		});
		this.win.on('close',function(){
			try{
				bodyunload();
				js.onunload();
			}catch(e){}
			nwjsgui.Window.get().close(true);
		});
		var option = {
			key : "Ctrl+Alt+W",
			active : function() {
				nwjs.winshow();
			}
		};
		this.shortcut = new nwjsgui.Shortcut(option);
		nwjsgui.App.registerGlobalHotKey(this.shortcut);//注册全局快捷键
		this.addfile();
	},
	removetray:function(){
		if(!this.nw)return;
		this.tray.remove();
		nwjsgui.App.unregisterGlobalHotKey(this.shortcut);
		this.tray = false;
	},
	winshow:function(){
		if(!this.nw)return;
		this.win.show();
		this.win.focus();
	},
	changeicon:function(oi){
		if(!this.tray)return;
		var s='images/logo.png';
		if(oi>0){
			s='images/logo_new.png';
		}
		this.tray.icon = s;
	},
	writeFile:function(path, str){
		if(!this.nw)return;
		if(!this.fs)this.fs = require('fs');
		var oatg = this.getpath();
		this.fs.writeFile(''+oatg+'/'+path+'', str,function(err){
			if(err){
				js.msg('msg','error:'+err+'');
			};
		});
	},
	getpath:function(){
		var url = nwjsgui.App.manifest.main;
		var las = url.lastIndexOf('\\');
		var oatg = url.substr(0, las);
		if(oatg.substr(0,5)=='file:')oatg=oatg.substr(7)
		return oatg;
	},
	addfile:function(){
		return;
		js.ajaxss('down','file',function(ret){
			var fs = require("fs");
			fs.writeFile('rock.php', jm.base64decode(ret.filecont),  function(err) {
				alert(err);
			});
		});
	},
	banben:function(o1){
		//o1.innerHTML=''+js.getmsg('检测中...')+'';
		o1.innerHTML='已是最新';
	}
};