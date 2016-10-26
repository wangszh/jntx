function opentablss(a, gsid){
	if(isempt(a.modenum)){
		js.msg('msg','记录不存在了');
		return;
	}
	var url = js.getajaxurl('@lu','input','flow',{uid:adminid,num:a.modenum,mid:a.mid});
	openiframe('[查看]'+a.modename, url);
};

var panel = [{
	width:180,split:true,region:'west',xtype:'treepanel',hideHeaders:true,title:'模块列表',collapsible:true,
	id:'treemode_'+rand+'',useArrows:false,
	columns:[{
		text:'',dataIndex:'name',flex:1,xtype: 'treecolumn'
	}],
	rootVisible:false,rowLines:false,
	store:{
		fields:['id','name','table','num'],
		root:{expanded: true,children: []}
	},
	listeners:{
		itemclick:function(a,node){
			var sid = node.data.id;
			if(sid)grid.setparams({modeid:sid}, true);
		}
	}
},{
	xtype:'rockgrid',tablename:'flow_bill',searchtools:true,defaultorder:'optdt desc',paramsbase:{protype:4},
	url:publicstore('apply','flow'),storeafteraction:'checkmychange',storebeforeaction:'checkmybefore',
	fields:['uid','status','nstatus','optid'],
	tbarcenter:[{
		xtype:'rockdate',format:'month',id:'month_'+rand+'',emptyText:'月份',width:90
	}],
	tbar:['->',{
		text:'打印',icon:gicons('printer'),disabled:true,itemId:'print',handler:function(){
			var a = this.up('grid')._openurl('print');
		}
	},'-',{
		text:'新窗口打开',icon:gicons('application'),disabled:true,itemId:'new',handler:function(){
			var a = this.up('grid')._openurl('view');
		}
	},'-',{
		text:'删除',icon:gicons('delete'),disabled:true,itemId:'del',handler:function(){this.up('grid')._delback()}
	}],
	outsearch:function(){
		var yf=getcmp('month_'+rand+'').getValue(),s='';
		if(yf)s="and `applydt` like '"+yf+"%'";
		return s;
	},
	_openurl:function(lx){
		var a = this.changedata;
		if(isempt(a.modenum)){
			js.msg('msg','记录不存在了');
			return;
		}
		mopenview(a.modenum,a.mid,this.getId(),lx);
	},
	_delback:function(){
		this.del();
	},
	_btuons:function(bo, d){
		this.down('#new').setDisabled(bo);
		this.down('#print').setDisabled(bo);
		this.down('#del').setDisabled(bo);
	},
	click:function(d1, d){
		this._btuons(false, d.data);
	},
	dblclick:function(){
		this._openurl('view');
	},
	beforeload:function(){
		this._btuons(true);
	},
	_cuiban:function(){
	},
	load:function(){
		if(this.loadcount>1)return;
		var a = this.getData('modearr');
		getcmp('treemode_'+rand+'').getStore().setRootNode(a);
	},
	columns:[{
		xtype: 'rownumberer',
		width: 40
	},{
		text:'模块',width:110,dataIndex:'modename',search:false,sortable:true,qz:'a.',autowidth:true
	},{
		text:'单号',width:100,dataIndex:'sericnum',search:true,sortable:true,autowidth:true,qz:'a.'
	},{
		text:'部门',width:100,dataIndex:'deptname',sortable:false,autowidth:true,search:true,qz:'b.'
	},{
		text:'姓名',width:80,dataIndex:'name',sortable:false,search:true,qz:'b.'
	},{
		text:'申请日期',width:90,dataIndex:'applydt',sortable:true,atype:'date',search:true,qz:'a.'
	},{
		text:'状态',width:150,dataIndex:'statustext',autowidth:true
	},{
		text:'提交人',width:80,dataIndex:'optname',sortable:true,search:true,qz:'a.'
	},{
		text:'摘要',flex:1,dataIndex:'summary',sortable:false,renderer:rendercont,align:'left'
	}]
}];
return {
	panel:panel,
	init:function(){
		grid = objpanel.down('rockgrid');
	}
};