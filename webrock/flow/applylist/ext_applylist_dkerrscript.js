/**
*	模块【dkerr.打卡异常】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-07 16:59:21
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'dkerr',
	tablename:'kq_dkerr',defaultorder:'id desc',url:publiccheckstore('mode_dkerr|input','flow'),
	formtitle:'打卡异常',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode(''),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'异常类型','dataIndex':'errtype','atype':'rockcombo','search':true},{'text':'申请日期','dataIndex':'dt','atype':'date','search':true,'width':'12%'},{'text':'应打卡时间','dataIndex':'ytime','atype':'time','search':true,'width':'12%'},{'text':'说明','dataIndex':'explain','atype':'textarea','search':false,flex:1},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]



//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;