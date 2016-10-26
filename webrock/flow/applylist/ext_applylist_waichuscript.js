/**
*	模块【waichu.外出出差】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-07 16:56:46
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'waichu',
	tablename:'kq_out',defaultorder:'id desc',url:publiccheckstore('mode_waichu|input','flow'),
	formtitle:'外出出差',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode(''),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'外出类型','dataIndex':'atype','atype':'select','search':true},{'text':'外出时间','dataIndex':'outtime','atype':'datetime','search':true,'width':155},{'text':'预计回岗','dataIndex':'intime','atype':'datetime','search':true,'width':155},{'text':'外出地址','dataIndex':'address','atype':'text','search':false,flex:0.4},{'text':'外出事由','dataIndex':'reason','atype':'textarea','search':true,flex:0.6},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]

panelauto={
	tbarcenter:[{
		xtype:'rockdate',format:'month',id:'month_'+rand+'',emptyText:'月份',width:90
	}],
	outsearch:function(){
		var s = '',
			s1= getcmp('month_'+rand+'').getValue();
		if(!isempt(s1))s="[A][K]a.`outtime`[K]like[K]'"+s1+"%'";	
		return s;
	},
	defaultorder:'outtime desc'
};

//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;