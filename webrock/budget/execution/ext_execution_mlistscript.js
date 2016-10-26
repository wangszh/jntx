var list,grid

var budgetlist={
	xtype:'rockgrid',region:'west',width:160,keywhere:'',split:true,bbarbool:false,defaultorder:'ndyear',
	tablename:'budget',storefields:'id,name,ndyear,iscurrent',storeafteraction:'deallistbudget',formtitle:'新增预算',title:'预算年度',collapsible:true,searchtools:false,
	columns:[{
		xtype: 'rownumberer',
		width: 40,hidden:true
	},{
		text:'名称',dataIndex:'title',flex:1,align:'left'
	},{
		text:'预算年度',dataIndex:'ndyear',width:70,hidden:true
	}]
}

var budgetpanel= {
	xtype:'rockgrid',tablename:'budgetyearmonthview',searchtools:true,defaultorder:'',keywhere:'',
	exceltitle:'预算执行',
	columns:[{
		xtype: 'rownumberer',
		width: 40
	},{
		text:'预算ID',dataIndex:'budgetid',hidden:true
	},{
		text:'单位ID',dataIndex:'deptid',hidden:true
	},{
		text:'科目ID',dataIndex:'subjectid',hidden:true
	},{
		text:'预算年度',dataIndex:'bname',width:100,search:true
	},{
		text:'预算部门',dataIndex:'dname',width:'10%',align:'left',search:true
	},{
		text:'科目编号',dataIndex:'num',width:'10%',align:'left',search:true
	},{
		text:'预算科目',dataIndex:'sname',width:'10%',align:'left',search:true
	},{
		text:'年度预算',dataIndex:'yearvalue',width:'10%',align:'left',search:true
	},{
		text:'年度执行',dataIndex:'yeardealvalue',width:'10%',align:'left',search:true
	},{
		text:'月度预算',dataIndex:'monthvalue',width:'10%',align:'left',search:true
	},{
		text:'1月执行',dataIndex:'dealvalue1',width:'10%',align:'left',search:true
	},{
		text:'2月执行',dataIndex:'dealvalue2',width:'10%',align:'left',search:true
	},{
		text:'3月执行',dataIndex:'dealvalue3',width:'10%',align:'left',search:true
	},{
		text:'4月执行',dataIndex:'dealvalue4',width:'10%',align:'left',search:true
	},{
		text:'5月执行',dataIndex:'dealvalue5',width:'10%',align:'left',search:true
	},{
		text:'6月执行',dataIndex:'dealvalue6',width:'10%',align:'left',search:true
	},{
		text:'7月执行',dataIndex:'dealvalue7',width:'10%',align:'left',search:true
	},{
		text:'8月执行',dataIndex:'dealvalue8',width:'10%',align:'left',search:true
	},{
		text:'9月执行',dataIndex:'dealvalue9',width:'10%',align:'left',search:true
	},{
		text:'10月执行',dataIndex:'dealvalue10',width:'10%',align:'left',search:true
	},{
		text:'11月执行',dataIndex:'dealvalue11',width:'10%',align:'left',search:true
	},{
		text:'12月执行',dataIndex:'dealvalue12',width:'10%',align:'left',search:true
	}
	],
	tbarcenter:[{
		xtype:'checkbox',boxLabel:'只看超预算的',id:'zz_'+rand+'',checked:false
	}],
	outsearch:function(){
		var s = '';
		if(getcmp('zz_'+rand+'').checked){
			s = ' and yearvalue<yeardealvalue';
		}
		return s;
	},
	tbar:['-','双击打开预算按月执行情况报表']
}

budgetlist.click=function(a,v){
	yid = v.get('id');
	grid.keywhere="and budgetid="+yid;
	grid.searchgoto("and budgetid="+yid);
}

budgetpanel.dblclick=function(a,v){
	yid = v.get('id');	
	//var url = js.getajaxurl('@monthlist','execution','budget',{budgetid:v.get('budgetid'),deptid:v.get('deptid'),subjectid:v.get('subjectid')});
	//openiframe('['+v.get('sname')+']按月预算执行情况', url);
	//addtabs('['+a.name+']进程管理','flow,course,setid='+a.id+',table='+a.table+',index='+index+'','flowset'+a.id+'')
	addtabs('['+v.get('sname')+']按月预算执行情况','budget,execution,month,budgetid='+v.get('budgetid')+',deptid='+v.get('deptid')+',subjectid='+v.get('subjectid'), 'budgetmothlist_'+yid+'');
}


var panel=[];
panel = [budgetlist,budgetpanel];

return {
	panel:panel,
	init:function(){
		list = rock[index][0];
		grid = rock[index][1];
	}
};