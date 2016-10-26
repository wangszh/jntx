/**
*	模块【meet.会议预定】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-07 17:12:32
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'meet',
	tablename:'meet',defaultorder:'id desc',url:publiccheckstore('mode_meet|input','flow'),
	formtitle:'会议预定',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode('IEFORCAgYS5gdHlwZWAgPSAnMCc:'),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'会议室','dataIndex':'hyname','atype':'rockcombo','search':true},{'text':'主题','dataIndex':'title','atype':'text','search':true},{'text':'开始时间','dataIndex':'startdt','atype':'datetime','search':true,'width':155},{'text':'结束时间','dataIndex':'enddt','atype':'datetime','search':true,'width':155},{'text':'参会人员','dataIndex':'joinname','atype':'changedeptusercheck','search':false,flex:1},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]



//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;