var tree,form;
function clickedit(){
	var data = tree.changedata;
	form.adddata(data);
	form.field('idPost').setValue(data.id);
	
	if(data.iszw>0){
		form.field('iszwPost').setValue(1);
		form.setmsg('修改职位','blue');
		form.hideField(form.field('headmanPost'));		
		form.hideField(form.field('companyidPost'));
	}else{
		form.field('iszwPost').setValue(0);
		form.setmsg('修改部门','blue');
		form.showField(form.field('headmanPost'));
		form.showField(form.field('companyidPost'));
	}

	form.field('namePost').focus();
}
function clickadd(){	
	form.reset();	
	form.setmsg('新增部门','blue');	
	form.showField(form.field('headmanPost'));	
	form.showField(form.field('companyidPost'));	
	form.field('namePost').focus();	
}
function clickadddown(){
	form.setmsg('新增下级','blue');
	form.reset();
	form.field('pidPost').setValue(tree.changedata.id);
	form.showField(form.field('headmanPost'));
	form.showField(form.field('companyidPost'));
	form.field('namePost').focus();
}

//在科室下设职位　by yc 2016-5-3
function clickaddzw(){	
	form.reset();
	form.field('pidPost').setValue(tree.changedata.id);
	form.setmsg('新增职位','blue');	
	form.hideField(form.field('headmanPost'));
	form.hideField(form.field('companyidPost'));
	form.field('namePost').focus();
}

function btn(bo){
	try{
		getcmp('edit_'+rand+'').setDisabled(bo);
		getcmp('del_'+rand+'').setDisabled(bo);
		getcmp('adddown_'+rand+'').setDisabled(bo);
		if(tree.changedata.iszw>0){
			getcmp('addzw_'+rand+'').setDisabled(true)
		}else{
			getcmp('addzw_'+rand+'').setDisabled(false)		
		}
	}catch(e){}	
}

var panel=[{
	xtype:'rocktree',
	url:publictreestore({order:'sort',expandall:'true'},mode, dir),
	tablename:'dept',fields:['companyid'],
	tbar:[{
		text:'刷新',handler:function(){tree.storereload()},icon:gicons('arrow_refresh')
	},'-',{
		text:'全部展开',handler:function(){tree.expandAll()}
	},'-',{
		text:'全部收起',handler:function(){tree.collapseAll()}
	},'-',{
		text:'新增下级',icon:gicons('add'),handler:function(){clickadddown()},disabled:true,id:'adddown_'+rand+''
	},'-',{
		text:'新增职位',icon:gicons('add'),handler:function(){clickaddzw()},disabled:true,id:'addzw_'+rand+''	
	},'->',{
		text:'新增',icon:gicons('add'),handler:function(){clickadd()}
	},'-',{
		text:'修改',icon:gicons('page_edit'),disabled:true,id:'edit_'+rand+'',handler:function(){clickedit()}
	},'-',{
		text:'删除',icon:gicons('delete'),disabled:true,id:'del_'+rand+'',handler:function(a){tree.del(a)}
	}],
	columns:[{
		xtype: 'treecolumn',
		text:'名称',align:'left',dataIndex:'name',width:'35%'
	},{
		text:'编号',align:'center',dataIndex:'num',width:'10%'
	},{
		text:'序号',align:'center',dataIndex:'sort',width:'8%'
	},{
		text:'负责人',align:'center',dataIndex:'headman',width:'15%'
	},{
		text:'所属单位',align:'center',dataIndex:'companyname',flex:1
	},{
		text:'ID',align:'center',dataIndex:'id',width:'6%'
	}],
	beforeload:function(){
		btn(true);
	},
	click:function(){
		btn(false);
	},
	dblclick:function(){
		clickedit();
	}
},{
	region:'east',title:'组织结构管理',width:250,split:true,xtype:'rockform',rand:rand,collapsible:true,tablename:'dept',
	url:js.getajaxurl('publicsave','dept','system'),autoScroll:false,labelWidth:70,
	items:[{
		fieldLabel:'id号',value:'0',name:'idPost',hidden:true
	},{
		fieldLabel:'职位',value:'0',name:'iszwPost',hidden:true
	},{
		fieldLabel:''+bitian+'编号',name:'numPost',allowBlank: false
	},{
		fieldLabel:''+bitian+'名称',name:'namePost',allowBlank: false
	},{
		fieldLabel:'上级ID',name:'pidPost',value:'0',minValue:0,xtype:'numberfield'
	},{
		id:'headid_'+rand+'',name:'headidPost',hidden:true
	},{
		fieldLabel:'负责人',nameidfields:'headid_'+rand+'',name:'headmanPost',xtype:'changedeptuser',changetype:'usercheck'
	},{
		fieldLabel:'序号',name:'sortPost',value:'0',minValue:0,xtype:'numberfield'
	},{
		fieldLabel:'所属单位',name:'companyidPost',xtype:'rockcombo',url:'company',valuefields:'id',autoloadlist:true
	}],
	submitfields:'name,num,pid,sort,headman,headid,companyid,iszw',
	params:{int_filestype:'sort,companyid'},
	success:function(bac){
		tree.storereload();
	}
}];

return {
	panel:panel,
	init:function(){
		tree = rock[index][0];
		form = rock[index][1];
	}
};