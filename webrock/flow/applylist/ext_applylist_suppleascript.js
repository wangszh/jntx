/**
*	模块【supplea.物品领用】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-07 17:03:34
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'supplea',
	tablename:'supplea',defaultorder:'id desc',url:publiccheckstore('mode_supplea|input','flow'),
	formtitle:'物品领用',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode(''),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'物品名称','dataIndex':'aname','atype':'hidden','search':true},{'text':'申请时间','dataIndex':'optdt','atype':'datetime','search':true,'width':160},{'text':'说明','dataIndex':'explain','atype':'textarea','search':false,flex:1},{'text':'领用数量','dataIndex':'total','atype':'number','search':false},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]



//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;