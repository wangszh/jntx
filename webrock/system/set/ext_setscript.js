var panel={
	xtype:'panel',border:false,padding:50,items:{
		width:400,
		url:js.getajaxurl('setsave',mode,dir),
		labelWidth:100,autoScroll:false,
		xtype:'rockform',border:false,items:[{
			name:'titlePost',allowBlank: false,fieldLabel:'系统标题'
		},{
			xtype: 'fieldcontainer',defaultType: 'textfield',layout:'hbox',items:[{
				fieldLabel:'系统logo图标',xtype:'displayfield',value:'<div style="padding-top:0px" align="center"><img id="view_logo_'+rand+'-inputEl" style="border:1px #cccccc solid" src="images/icons40.png" height="40" width="40"><br><a onclick="return js.cropimg(\'logo_'+rand+'-inputEl\',\''+jm.base64encode('系统logo图标')+'\',40,40)" href="javascript:" class="a">编辑</a></div>'
			},{
				name:'logoPost',id:'logo_'+rand+'',hidden:true
			}]
		},{
			xtype: 'fieldcontainer',defaultType: 'textfield',layout:'hbox',items:[{
				fieldLabel:'&nbsp;',xtype:'displayfield',value:'系统数据初始化(限使用一次)&nbsp;',labelSeparator:''
			},{
				xtype:'button',text:'初始化',id:'btunls_'+rand+'',disabled:true,handler:function(){
					sysinitla();
				}
			}]
		},{
			name:'mysqlpathPost',fieldLabel:'数据库路径'
		},{
			name:'mysqlpathbfPost',fieldLabel:'备份到'
		}]
	}
}
function ainit(){
	var url = js.getajaxurl('getset',mode,dir);
	var form= objpanel.down('rockform');
	form.setmsg('读取中...', '#ff6600');
	$.get(url, function(da){
		form.setmsg('');
		var a = js.decode(da);
		form.setVal('title', a.title);
		form.setVal('mysqlpath', a.mysqlpath);
		form.setVal('mysqlpathbf', a.mysqlpathbf);
		form.setVal('logo', a.logo);
		get('view_logo_'+rand+'-inputEl').src = a.logo;
		if(a.isinits==0){
			getcmp('btunls_'+rand+'').setDisabled(false);
		}else{
			getcmp('btunls_'+rand+'').setText('已初始化过');
		}			
	});
}
function sysinitla(){
	Ext.MessageBox.confirm('系统提示', '确定要清空系统数据记录吗？慎用！！', function(a){
		if(a=='yes'){
			sysinitlas();
		}
	});
}
function sysinitlas(){
	js.msg('wait','处理中...');
	getcmp('btunls_'+rand+'').setDisabled(true);
	$.get(js.getajaxurl('sysinit',mode, dir), function(da){
		js.msg('success',da);
	});
}
return {
	panel:panel,
	init:function(){
		ainit();
	}
};