var panel={
	xtype:'panel',border:false,padding:50,items:{
		width:600,
		url:js.getajaxurl('setsave',mode,dir),
		labelWidth:100,autoScroll:false,
		xtype:'rockform',border:false,items:[{
			xtype: 'fieldcontainer',defaultType: 'textfield',layout:'hbox',items:[{
				fieldLabel:'REIM标题',name:'reimtitlePost',width:'50%'
			},{
				name:'reimtitlePost1',xtype:'displayfield',value:'&nbsp;显示在主页上标题'
			}]
		},{
			xtype: 'fieldcontainer',defaultType: 'textfield',layout:'hbox',items:[{
				name:'reimpushurlPost',fieldLabel:'服务端推送地址',width:'50%',readOnly:false
			},{
				name:'reimpushurlPost1',xtype:'displayfield',value:'&nbsp;用于推送到REIM客户端,http://开头'
			}]
		},{
			xtype:'displayfield',value:'---↓以下是客户端相关设置---',fieldLabel:'&nbsp;',labelSeparator:''
		},{
			xtype: 'fieldcontainer',defaultType: 'textfield',layout:'hbox',items:[{
				name:'reimhostPost',fieldLabel:'reim通信地址',width:'50%',readOnly:false
			},{
				name:'reimhostPost1',xtype:'displayfield',value:'&nbsp;客户端连接的通信地址,ws://开头'
			}]
		},{
			xtype: 'fieldcontainer',defaultType: 'textfield',layout:'hbox',items:[{
				name:'reimrecidPost',fieldLabel:'BTrecID号',width:'50%',allowBlank: false
			},{
				name:'reimrecidPost1',xtype:'displayfield',value:'&nbsp;必填<a href="http://www.rockoa.com/view_reimset.html" target="_blank" class="a">[查看帮助]</a>'
			}]
		},{
			fieldLabel:'没有REIM服务端?使用官网REIM密钥',xtype:'textarea',height:70,name:'reimmiyuePost'
		}],
		buttonsitems:[{text:'测试发送',handler:function(){testsend()}}]
	}	
}
function ainit(){
	var url = js.getajaxurl('getset',mode,dir);
	var form= objpanel.down('rockform');
	form.setmsg('读取中...', '#ff6600');
	$.get(url, function(da){
		form.setmsg('');
		var a = js.decode(da);
		form.setVal('reimtitle', a.reimtitle);
		form.setVal('reimhost', a.reimhost);
		form.setVal('reimrecid', a.reimrecid);
		form.setVal('reimpushurl', a.reimpushurl);
		form.setVal('reimmiyue', a.reimmiyue);
	});
};
function testsend(){
	js.msg('wait','发送中...');
	var url = js.getajaxurl('testsend',mode,dir);
	$.get(url,function(da){
		js.msg('success',da);
	});
}
return {
	panel:panel,
	init:function(){
		ainit();
	}
};