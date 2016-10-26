/**
*	模块【careserve.车辆预定】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-07 17:09:28
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'careserve',
	tablename:'careserve',defaultorder:'id desc',url:publiccheckstore('mode_careserve|input','flow'),
	formtitle:'车辆预定',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode(''),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'使用者','dataIndex':'usename','atype':'changedeptusercheck','search':false},{'text':'使用人数','dataIndex':'useren','atype':'number','search':false},{'text':'开始时间','dataIndex':'startdt','atype':'datetime','search':false,'width':100},{'text':'截止时间','dataIndex':'enddt','atype':'datetime','search':false,'width':100},{'text':'目的地','dataIndex':'address','atype':'text','search':false,flex:1},{'text':'车牌号','dataIndex':'carnum','atype':'hidden','search':false},{'text':'驾驶员','dataIndex':'jianame','atype':'changeusercheck','search':false},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]



//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;