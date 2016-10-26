var budgetid = params.budgetid,
	subjectid = params.subjectid;
	
var list,grid

var budgetpanel= {
	xtype:'rockgrid',tablename:'budget_bysubject_monthview',searchtools:true,defaultorder:'monnum',
	keywhere:' and budgetid='+budgetid + ' and subjectid=' + subjectid,
	exceltitle:'预算执行查询',
	columns:[{
		xtype: 'rownumberer',
		width: 40
	},{
		text:'预算年度',dataIndex:'bname',width:100,search:true
	},{
		text:'科目编号',dataIndex:'num',width:'10%',align:'left',search:true
	},{
		text:'预算科目',dataIndex:'sname',width:'10%',align:'left',search:true
	},{
		text:'月份',dataIndex:'monnum',width:'10%',align:'left',search:true
	},{
		text:'预算数值',dataIndex:'monthvalue',width:'10%',align:'left',search:true
	},{
		text:'执行数值',dataIndex:'dealvalue',width:'10%',align:'left',search:true
	},{
		text:'执行情况',dataIndex:'monthvalue',width:200,search:true,renderer:function(d,c,r){
			var s = '';			
			if(!isempt(d)){
				num=r.data['dealvalue']/d;				
				num=num*150;
				if(num>150)num=150;
				if(d!=0){
					s='<div style="border:1px solid green;height: 15px;width: 150px;text-align:left;"><img width="'+num+'px" height="15px" src="/images/bg.gif"></div>';
				}
			}
			return s;
		}
	}],
	tbar:['->',{text:'统计图',icon:gicons('chart_bar'),handler:function(){Statisticalchart()}},'']
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