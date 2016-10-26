/**
*	模块【reward.奖惩处罚】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-07 17:05:38
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'reward',
	tablename:'reward',defaultorder:'id desc',url:publiccheckstore('mode_reward|input','flow'),
	formtitle:'奖惩处罚',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode(''),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'奖惩对象','dataIndex':'object','atype':'changeuser','search':true},{'text':'奖惩类型','dataIndex':'atype','atype':'rockcombo','search':true},{'text':'奖惩结果','dataIndex':'result','atype':'rockcombo','search':true},{'text':'奖惩金额','dataIndex':'money','atype':'rockcombo','search':true},{'text':'说明','dataIndex':'explain','atype':'textarea','search':false,flex:1},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]



//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;