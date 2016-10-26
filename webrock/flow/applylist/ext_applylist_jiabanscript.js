/**
*	模块【jiaban.加班单】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-07 16:52:06
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'jiaban',
	tablename:'kq_info',defaultorder:'id desc',url:publiccheckstore('mode_jiaban|input','flow'),
	formtitle:'加班单',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode('IEFORCAgYS5ga2luZGAgPSAn5Yqg54!tJw::'),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'开始时间','dataIndex':'stime','atype':'datetime','search':true,'width':100},{'text':'截止时间','dataIndex':'etime','atype':'datetime','search':true,'width':100},{'text':'加班(小时)','dataIndex':'totals','atype':'number','search':true,'width':100},{'text':'说明','dataIndex':'explain','atype':'textarea','search':false,flex:1},{'text':'状态','dataIndex':'status'}]
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

//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;