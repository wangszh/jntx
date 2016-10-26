var grid,yid,chartwhere

var budgetpanel= {
	xtype:'rockgrid',tablename:'fininfom',searchtools:true,defaultorder:'optdt',keywhere:'',defaultwhere:'and isemp=0',
	exceltitle:'费用报销导出',
	columns:[{
		xtype: 'rownumberer',
		width: 40
	},{
		text:'推销ID',dataIndex:'id',hidden:true
	},{
		text:'收款人',dataIndex:'fullname',width:'20%',search:true
	},{
		text:'收款帐号',dataIndex:'cardid',width:'20%',align:'left',search:true
	},{
		text:'身份证',dataIndex:'idnum',width:'20%',align:'left',search:true
	},{
		text:'申请日期',dataIndex:'applydt',width:'10%',align:'left',search:true
	}
	],
	tbarcenter:[{
		xtype:'checkbox',boxLabel:'只看未导出的',id:'zz_'+rand+'',checked:true
	}],
	outsearch:function(){
		var s = '';
		if(getcmp('zz_'+rand+'').checked){
			s = ' and isemp=0';
		}
		return s;
	}
	,tbar:[]
}
  

/*
 * 
 budgetpanel.dblclick=function(a,v){
	addtabs('['+v.get('sname')+']按月预算执行情况','budget,execution,month,budgetid='+v.get('budgetid')+',deptid='+v.get('deptid')+',subjectid='+v.get('subjectid'), 'budgetmothlist_'+v.get('id')+'');
}
*/

var panel=[];
panel = [budgetpanel];

return {
	panel:panel,
	init:function(){		
		grid = rock[index][0];
		
	}
};