/**
*	模块【hrpositive.转正申请】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-08 09:18:16
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'hrpositive',
	tablename:'hrpositive',defaultorder:'id desc',url:publiccheckstore('mode_hrpositive|input','flow'),
	formtitle:'转正申请',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode(''),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'职位','dataIndex':'ranking','atype':'text','search':true},{'text':'入职日期','dataIndex':'entrydt','atype':'text','search':true},{'text':'试用到期日','dataIndex':'syenddt','atype':'date','search':true},{'text':'转正日期','dataIndex':'positivedt','atype':'date','search':true},{'text':'说明','dataIndex':'explain','atype':'textarea','search':false,flex:1},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]
panel.columns[1].text='姓名';
panel.columns[2].text='部门';


//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;