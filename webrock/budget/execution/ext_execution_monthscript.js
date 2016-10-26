var budgetid = params.budgetid,
	deptid = params.deptid,
	subjectid = params.subjectid;
	
var list,grid

var budgetpanel= {
	xtype:'rockgrid',tablename:'budgetmonthview',searchtools:true,defaultorder:'monnum',
	keywhere:' and budgetid='+budgetid + ' and deptid=' + deptid + ' and subjectid=' + subjectid,
	exceltitle:'预算执行查询',
	columns:[{
		xtype: 'rownumberer',
		width: 40
	},{
		text:'预算年度',dataIndex:'bname',width:100,search:true
	},{
		text:'预算部门',dataIndex:'dname',width:'10%',align:'left',search:false
	},{
		text:'科目编号',dataIndex:'num',width:'10%',align:'left',search:false
	},{
		text:'预算科目',dataIndex:'sname',width:'10%',align:'left',search:false
	},{
		text:'月份',dataIndex:'monnum',width:'10%',align:'left',search:true
	},{
		text:'预算数值',dataIndex:'monthvalue',width:'10%',align:'left',search:true
	},{
		text:'执行数值',dataIndex:'dealvalue',width:'10%',align:'left',search:true
	},{
		text:'执行情况',dataIndex:'dealstatus',width:200,search:true,renderer:function(v){
			var s = '';			
			if(!isempt(v)){	
				num=v*150;
				if(num>150)num=150;
				s='<div style="border:1px solid green;height: 15px;width: 150px;text-align:left;"><img width="'+num+'px" height="15px" src="/images/bg.gif"></div>';
			}
			return s;
		}
	}]
	//,tbar:['->',{text:'统计图',icon:gicons('chart_bar'),handler:function(){Statisticalchart()}},'']
}

function Statisticalchart(){
	//chartwhere=this.search(false,false);
	alert(grid.sqlwhere)
	addtabs('['+v.get('sname')+']预算执行统计图','budget,execution,yearSchart,where='+chartwhere, 'budgetyearSchart_'+yid+'');

}

var panel=[];
panel = [budgetpanel];

return {
	panel:panel,
	init:function(){
		grid = rock[index];
	}
};