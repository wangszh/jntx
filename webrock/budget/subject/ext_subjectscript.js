var tree,form;
function clickedit(){
	var data = tree.changedata;
	form.adddata(data);
	form.field('idPost').setValue(data.id);
	form.setmsg('修改科目','blue');	
	form.field('namePost').focus();
}
function clickadd(){	
	form.reset();
	form.setmsg('新增科目','blue');	
	form.showField(form.field('headmanPost'));	
	form.showField(form.field('companyidPost'));
	form.field('namePost').focus();
}
function clickadddown(){
	form.reset();
	form.setmsg('新增下级','blue');
	form.field('pidPost').setValue(tree.changedata.id);
	form.showField(form.field('headmanPost'));
	form.showField(form.field('companyidPost'));
	form.field('namePost').focus();
}

function btn(bo){
	try{
	getcmp('edit_'+rand+'').setDisabled(bo);
	getcmp('del_'+rand+'').setDisabled(bo);
	getcmp('adddown_'+rand+'').setDisabled(bo);	
	}catch(e){}	
}

var panel=[{
	xtype:'rocktree',
	url:publictreestore({order:'num',expandall:'true'},mode, dir),
	tablename:'subject',
	tbar:[{
		text:'刷新',handler:function(){tree.storereload()},icon:gicons('arrow_refresh')
	},'-',{
		text:'全部展开',handler:function(){tree.expandAll()}
	},'-',{
		text:'全部收起',handler:function(){tree.collapseAll()}
	},'-',{
		text:'新增下级',icon:gicons('add'),handler:function(){clickadddown()},disabled:true,id:'adddown_'+rand+''	
	},'->',{
		text:'新增',icon:gicons('add'),handler:function(){clickadd()}
	},'-',{
		text:'修改',icon:gicons('page_edit'),disabled:true,id:'edit_'+rand+'',handler:function(){clickedit()}
	},'-',{
		text:'删除',icon:gicons('delete'),disabled:true,id:'del_'+rand+'',handler:function(a){tree.del(a)}
	}],
	columns:[{
		xtype: 'treecolumn',
		text:'科目名称',align:'left',dataIndex:'name',width:'35%'
	},{
		text:'编号',align:'left',dataIndex:'num',width:'45%'
	},{
		text:'ID',align:'center',dataIndex:'id',width:'10%'
	},{
		text:'上级ID',align:'center',dataIndex:'pid',width:'10%'
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
	region:'east',title:'科目管理',width:250,split:true,xtype:'rockform',rand:rand,collapsible:true,tablename:'subject',
	url:js.getajaxurl('publicsave','subject','budget'),autoScroll:false,labelWidth:70,
	items:[{
		fieldLabel:'id号',value:'0',name:'idPost',hidden:true
	},
	{
		fieldLabel:''+bitian+'编号',name:'numPost',allowBlank: false
	},{
		fieldLabel:''+bitian+'名称',name:'namePost',allowBlank: false
	},{
		fieldLabel:'上级ID',name:'pidPost',value:'0',minValue:0,xtype:'numberfield'
	}],
	submitfields:'name,num,pid',
	params:{int_filestype:'pid'},
	success:function(bac){
		tree.storereload();
	}
}];
//上面如果有url参数，则在加载模板时（在数据加载渲染前），获取数据　如：url:'company'　则在base.js３５定义的真实ＵＲＬ
//alert(JSON.stringify(panel))
return {
	panel:panel,
	init:function(){		
		tree = rock[index][0];		
		form = rock[index][1];
	}
};