/**
*	模块【finfybx.费用报销】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-07-02 10:33:16
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'finfybx',
	tablename:'fininfom',defaultorder:'id desc',url:publiccheckstore('mode_finfybx|input','flow'),
	formtitle:'费用报销',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode('IEFORCAgYS5gdHlwZWAgPSAnMCc:'),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'所属科目','dataIndex':'subjectname','atype':'changesubject','search':true},{'text':'申请日期','dataIndex':'applydt','atype':'text','search':true},{'text':'附单据(张)','dataIndex':'bills','atype':'number','search':true},{'text':'报销金额','dataIndex':'money','atype':'text','search':false},{'text':'说明','dataIndex':'explain','atype':'textarea','search':false,flex:1},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]



//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;