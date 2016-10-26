/**
*	模块【demand.业务需求】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-08 10:03:08
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'demand',
	tablename:'demand',defaultorder:'id desc',url:publiccheckstore('mode_demand|input','flow'),
	formtitle:'业务需求',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode(''),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'标题','dataIndex':'title','atype':'text','search':false,'width':'18%'},{'text':'操作时间','dataIndex':'optdt','atype':'datetime','search':true,'width':155},{'text':'说明','dataIndex':'explain','atype':'textarea','search':false,flex:1,align:"left"},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]



//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;