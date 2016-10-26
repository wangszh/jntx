var list,grid,yid,chartwhere

var budgetlist={
	xtype:'rockgrid',region:'west',width:160,keywhere:'',split:true,bbarbool:false,defaultorder:'ndyear',
	tablename:'budget',storefields:'id,name,ndyear,iscurrent',storeafteraction:'deallistbudget',formtitle:'预算年度',title:'预算年度',collapsible:true,searchtools:false,
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
	xtype:'rockgrid',tablename:'budget_bydeptview',searchtools:true,defaultorder:'dname',keywhere:'',
	exceltitle:'预算执行查询',
	columns:[{
		xtype: 'rownumberer',
		width: 40
	},{
		text:'预算ID',dataIndex:'budgetid',hidden:true
	},{
		text:'单位ID',dataIndex:'deptid',hidden:true
	},{
		text:'预算年度',dataIndex:'bname',width:100,search:true
	},{
		text:'预算部门',dataIndex:'dname',width:'10%',align:'left',search:true
	},{
		text:'预算数值',dataIndex:'yearvalue',width:'10%',align:'left',search:true
	},{
		text:'执行数值',dataIndex:'dealvalue',width:'10%',align:'left',search:true
	},{
		text:'执行情况',dataIndex:'yearvalue',width:200,search:true,renderer:function(d,c,r){
			var s = '';			
			if(!isempt(d)){
				num=r.data['dealvalue']/d;				
				num=num*150;
				if(num>150)num=150;
				if(d!=0){
					s='<div style="border:1px solid green;height: 15px;width: 150px;text-align:left;"><img width="'+num+'px" height="15px" src="/images/bg.gif"></div>';
				}
			}
			//if(!isempt(v))s='<input type="range" id="trackBar" min="1" max="100" step="1" value="500" readonly=true />';
			return s;
		}
	}],
	tbarcenter:[{
		xtype:'checkbox',boxLabel:'只看超预算的',id:'zz_'+rand+'',checked:false
	}],
	outsearch:function(){
		var s = '';
		if(getcmp('zz_'+rand+'').checked){
			s = ' and yearvalue<dealvalue';
		}
		return s;
	}
	,tbar:['-','双击打开预算按月执行情况报表','->',{text:'统计图',icon:gicons('chart_bar'),handler:function(){Statisticalchart()}},'']
}
  
budgetlist.click=function(a,v){
	yid = v.get('id');
	//grid.keywhere="and budgetid=1";
	//alert(grid.keywhere)
	grid.keywhere="and budgetid="+yid;
	grid.searchgoto("and budgetid="+yid);
}

budgetpanel.dblclick=function(a,v){
	//var url = js.getajaxurl('@monthlist','execution','budget',{budgetid:v.get('budgetid'),deptid:v.get('deptid'),subjectid:v.get('subjectid')});
	//openiframe('['+v.get('sname')+']按月预算执行情况', url);
	//addtabs('['+a.name+']进程管理','flow,course,setid='+a.id+',table='+a.table+',index='+index+'','flowset'+a.id+'')
	addtabs('['+v.get('dname')+']按月预算执行情况','budget,execution,dept_month,budgetid='+v.get('budgetid')+',deptid='+v.get('deptid'), 'budgetmothlist_'+v.get('id')+'');
}

function Statisticalchart(){	
	chartwhere=grid.sqlwhere;
	chartwhere=jm.encrypt(chartwhere);
	//chartwhere=jm.base64encode(chartwhere);
	//alert(chartwhere)
	addtabs('预算执行统计图','budget,execution,dept_chart,where='+chartwhere, 'budgetyearSchart_dept_chart'+yid+'');
}

var panel=[];
panel = [budgetlist,budgetpanel];

return {
	panel:panel,
	init:function(){
		list = rock[index][0];
		grid = rock[index][1];
		/*
		//alert("1111111")
		if(isempt(grid.keywher)) {
			sqlstr="and bname like '" + (new Date()).getFullYear() + "%'";
			grid.sqlwhere=sqlstr;
			//alert(grid.sqlwhere)
			//alert("222222")
			grid.keywhere=sqlstr;
		}
		//alert("333333")
		*/
	}
};