/**
*	模块【hrtransfer.人事调动】的列表展示页面，自定义区域内可写您想要的代码
*	最后修改：2016-05-08 09:22:57
*	创建人：管理员
*/
var otype = params.opentype;
var panelauto={},returnarr={},panel= {
	xtype:'rockflowgrid',opentype:otype,flownum:'hrtransfer',
	tablename:'hrtransfer',defaultorder:'id desc',url:publiccheckstore('mode_hrtransfer|input','flow'),
	formtitle:'人事调动',storeafteraction:'datalistafter',storebeforeaction:'datalistbefore',keywhere:jm.base64decode(''),
	columns:[{'xtype':'rownumberer','width':40},{'text':'申请人','dataIndex':'name','width':90,search:true},{'text':'所属部门','dataIndex':'deptname','autowidth':true,search:true},{'text':'要调动人','dataIndex':'tranname','atype':'changeuser','search':true},{'text':'调动类型','dataIndex':'trantype','atype':'rockcombo','search':true},{'text':'原来部门','dataIndex':'olddeptname','atype':'text','search':true},{'text':'调动后部门','dataIndex':'newdeptname','atype':'changedept','search':true},{'text':'原来职位','dataIndex':'oldranking','atype':'text','search':true},{'text':'调动后职位','dataIndex':'newranking','atype':'text','search':true},{'text':'生效日期','dataIndex':'effectivedt','atype':'date','search':true},{'text':'说明','dataIndex':'explain','atype':'textarea','search':false,flex:1},{'text':'状态','dataIndex':'status'}]
};
//[自定义区域start]
panel.columns[1].text='申请人';
panel.columns.splice(2,1);


//[自定义区域end]
panel=js.apply(panel, panelauto);
returnarr.panel=panel;
return returnarr;