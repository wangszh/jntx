var stable=params.table;
var panel={
	xtype:'rockgridform',url:js.getajaxurl('getfields',mode,dir),paramsbase:{table:stable},
	tbar:[{
		text:'刷新',handler:function(){grid.storereload()}
	},'-','<font color=red>谨慎操作修改</font>，更多高级管理请使用数据库管理工具phpMyAdmin,Navicat等。'],
	bbarbool:false,searchtools:false,
	delbool:false,
	formtitle:'表结构',
	columns:[{
		xtype: 'rownumberer',
		width: 40
	},{
		dataIndex:'name',text:'字段名称',width:'15%'
	},{
		dataIndex:'type',text:'字段类型',width:'15%'
	},{
		dataIndex:'types',text:'字段类型S',width:'15%'
	},{
		dataIndex:'dev',text:'默认值',width:'15%'
	},{
		dataIndex:'explain',text:'备注',flex:1,align:'left'
	}],
	formwidth:400,
	formparams:{
		submitfields:'name,explain,type,length,dev',
		url:js.getajaxurl('savefields',mode,dir,{table:stable}),
		items:[{
			fieldLabel:'id号',value:'0',name:'idPost',hidden:true
		},{
			fieldLabel:'字段名称',name:'namePost',allowBlank: false
		},{
			fieldLabel:'字段类型',name:'typePost',allowBlank: false,xtype:'combo',store:[['varchar','字符串(varchar)'],['datetime','日期时间(datetime)'],['date','日期(date)'],['int','长整数数字(int)'],['smallint','中整数数字(smallint)'],['tinyint','短整数数字(tinyint)'],['decimal','浮点数字(decimal)'],['text','text字符串']]
		},{
			fieldLabel:'长度',name:'lengthPost',xtype:'numberfield'
		},{
			fieldLabel:'默认值',name:'devPost'
		},{
			fieldLabel:'字段说明',name:'explainPost'
		}]
	},
	formedit:function(f, d){
		var tys=d.types.split('(');
		var cd='0';
		if(tys[1])cd=tys[1].replace(')','');
		f.setVal('length', cd);
	}
};
return {
	panel:panel,
	init:function(){
		grid = rock[index];
	}
};