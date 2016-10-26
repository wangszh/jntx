var hid=params.hid;
if(!hid)hid=0;
var frompanel={
	submitfields:'title,content,receid,recename,hid',labelWidth:100,
	params:{int_filestype:'hid',otherfields:'optdt={now},senddt={now},sendname={admin},sendid={adminid}'},
	url:publicsave('email','person'),
	buttonsitems:[{
		boxLabel:'保存后就发送',xtype:'checkboxfield',checked:true,labelSeparator:'',allowBlank: true,id:'isturn_'+rand+''
	}],
	editjudgewhere:'',
	items:[{
			fieldLabel:'id号',value:'0',name:'idPost',hidden:true	
		},{
			fieldLabel:'回复id',value:''+hid+'',name:'hidPost',hidden:true	
		},{
			fieldLabel:'是否发送',value:'1',name:'isturn_postabc',id:'isturn1_'+rand+'',hidden:true	
		},{
			name:'receidPost',id:'receid_'+rand+'',xtype:'textfield',hidden:true
		},{
			fieldLabel:'收件人',nameidfields:'receid_'+rand+'',name:'recenamePost',xtype:'changedeptuser',changetitle:'选择收件人',changetype:'deptusercheck',allowBlank: false
		},{
			fieldLabel:'主题',name:'titlePost',allowBlank: false
		},{
			fieldLabel:'内容',name:'contentPost',xtype:'kindeditor',height:280,id:'content_'+rand+''
		},
		uploadwindows.fields({fieldLabel:'相关附件',addText:'新增附件',heightsss:60}
	)],
	submitcheck:function(o){
		var ist = 0;
		if(getcmp('isturn_'+rand+'').checked)ist=1;
		getcmp('isturn1_'+rand+'').setValue(ist+'');
		getcmp('content_'+rand+'').submitValue();
		return '';
	},
	success:function(a,b,lx){
		try{if(params.gridid)getcmp(params.gridid).isreadload = true;}catch(e){}
		js.msg('success','保存成功');
		closetabsnow();
	}
};

var panelss = {
	xtype:'rockflowform',
	formparams:frompanel,
	formwidth:800,
	opttype:params.opttype,
	tablename:params.tablename,
	flownum:params.flownum,
	mid:params.mid,
	gridid:params.gridid,
	showdata:function(fo, da, o){
		
	}
}

return {
	panel:panelss
};