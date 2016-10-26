/**
*	模块【leave.请假条】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-07 16:52:04
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'leave',
	tablename:'kq_info',defaultorder:'id desc',url:publiccheckstore('mode_leave|input','flow'),
	formtitle:'请假条',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode('IEFORCAgYS5ga2luZGAgPSAn6K!35YGHJw::'),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'请假类型','dataIndex':'qjkind','atype':'rockcombo','search':true,'width':80},{'text':'开始时间','dataIndex':'stime','atype':'datetime','search':true,'width':100},{'text':'截止时间','dataIndex':'etime','atype':'datetime','search':true,'width':100},{'text':'请假(小时)','dataIndex':'totals','atype':'number','search':false,'width':100},{'text':'说明','dataIndex':'explain','atype':'textarea','search':false,flex:1},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]

panelauto={
	tbarcenter:[{
		xtype:'rockdate',format:'month',id:'month_'+rand+'',emptyText:'月份',width:90
	}],
	outsearch:function(){
		var s = '',
			s1= getcmp('month_'+rand+'').getValue();
		if(!isempt(s1))s="[A][K]a.`stime`[K]like[K]'"+s1+"%'";	
		return s;
	},
	defaultorder:'stime desc'
};
if(otype=='0'){
	panelauto.bbaritems = ['-',{id:'total_'+rand+'',xtype:'tbtext',text:'本月请假0小时，可用假期0小时'}];
	panelauto.loadgrid  = function(){
		var str = this.getData('totalstring');
		getcmp('total_'+rand+'').setText(str);
	}
}

//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;