/**
*	模块【finccbx.出差报销】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-08 09:34:57
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'finccbx',
	tablename:'fininfom',defaultorder:'id desc',url:publiccheckstore('mode_finccbx|input','flow'),
	formtitle:'出差报销',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode('IEFORCAgYS5gdHlwZWAgPSAnMSc:'),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'申请日期','dataIndex':'applydt','atype':'text','search':true},{'text':'收款人全称','dataIndex':'fullname','atype':'text','search':true},{'text':'付款方式','dataIndex':'paytype','atype':'rockcombo','search':true},{'text':'报销金额','dataIndex':'money','atype':'text','search':true},{'text':'出差目的','dataIndex':'purpose','atype':'text','search':false,flex:0.5},{'text':'出差成果','dataIndex':'purresult','atype':'text','search':true,flex:0.5},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]



//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;