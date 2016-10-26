/**
*	模块【docdeil.文件传送】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-07 17:19:15
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'docdeil',
	tablename:'docdeil',defaultorder:'id desc',url:publiccheckstore('mode_docdeil|input','flow'),
	formtitle:'文件传送',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode(''),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'标题','dataIndex':'title','atype':'text','search':true,'width':'12%'},{'text':'签收人','dataIndex':'recename','atype':'changeusercheck','search':true,'width':'12%'},{'text':'相关文件','dataIndex':'filestr','atype':'text','search':false,flex:0.5,align:"left"},{'text':'说明','dataIndex':'explain','atype':'textarea','search':false,flex:1},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]



//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;