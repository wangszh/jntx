var grid,bool=false;
var fieldsdata = {},changeid=0,win;
function clicksetwhere(){
	var a = grid.changedata;
	if(isempt(a.table)){
		js.msg('msg','没有设置表');
		return;
	}
	wherewindows.show('工作流['+a.name+']对应表上记录',jm.encrypt(a.table),'flowset_'+a.num+'', 1);
}
function clicksetfield(){
	var lx=0;
	if(isempt(grid.changedata.table)){
		js.msg('msg','没有设置表');
		return;
	}
	if(!win){
		var cans = winopt({title: '选择字段',width:400,border:false,
			items:getistess([]),
			buttons:[{
				text:'确定',icon:gicons('ok'),handler:quesngsho
			},{
				text:'取消',icon:gicons('cancel'),handler:function(){win.close()}
			}]
		});
		win = Ext.create('Ext.Window',cans);
		lx = 1;
	}
	if(lx==1){
		grid.destroypanel.push(win);
	}
	changeid = grid.changedata.id;
	if(!fieldsdata[changeid])fieldsdata[changeid]=grid.changedata.fields;
	win.show();
	win.setTitle('选择['+grid.changedata.name+']字段');
	getfielshoe();
}
function quesngsho(){
	if(bool)return;
	var a = getcmp('itemsel_'+rand+'');
	var val = a.getValue().join(',');
	fieldsdata[changeid] = val;
	js.msg('wait','保存中...');
	bool = true;
	$.post(js.getajaxurl('savefields',mode,dir),{id:changeid,fields:val},function(){
		js.msg('success','保存成功');
		grid.storereload();
		bool=false;
	});
}
function getistess(a){
	return {
		xtype:'itemselector',
		height:300,
		id:'itemsel_'+rand+'',
		store: a,
		fromTitle: '可选字段',
		toTitle: '已选择'
	};
}

var _olidtabl;
function getfielshoe(){
	var das=grid.changedata;
	var table = das.table;
	if(_olidtabl == table){
		getcmp('itemsel_'+rand+'').setValue(fieldsdata[changeid]);
		return;
	}	
	js.ajax(js.getajaxurl('getfields','public'),{table:table,atype:0,modeid:das.id},function(d){
		win.removeAll();
		win.add(getistess(d));
		var fields = fieldsdata[changeid];
		if(isempt(fields))fields='';
		var a = getcmp('itemsel_'+rand+'');
		a.setValue(fields);
	},'post,json');
	_olidtabl = table;
}

function clickpipei(){
	var sid = grid.getSelectValue('id', true);
	if(sid==''){
		js.msg('msg','没有选择行')
		return;
	}
	getcmp('msg_'+rand+'').setText(js.getmsg('匹配中...', '#ff6600'));
	js.ajax(js.getajaxurl('pipei',mode,dir),{id:sid},function(da){
		js.msg('msg', da,5);
		getcmp('msg_'+rand+'').setText('');
	},'post');
}
function setcoursename(){
	var a = grid.changedata;
	rockoption.setlist('['+a.name+']进程名称', 'flowcoursename_'+a.id);
}

function btns(bo){
	getcmp('setwheres_'+rand+'').setDisabled(bo);
	getcmp('setwhere_'+rand+'').setDisabled(bo);
	getcmp('setcourse_'+rand+'').setDisabled(bo);
	getcmp('course_'+rand+'').setDisabled(bo);
	getcmp('inputla_'+rand+'').setDisabled(bo);
}
function setcoursela(){
	var a 	= grid.changedata;
	if(a.isflow!=1){
		js.msg('msg','不是有流程模块，无需进程管理操作');
		return;
	}
	addtabs('['+a.name+']进程管理','flow,course,setid='+a.id+',table='+a.table+',index='+index+'','flowset'+a.id+'');
}
function setinputla(o1){
	var lx  = o1.astype;
	var a 	= grid.changedata;
	if(lx==2){
		addtabs('['+a.table+']表结构管理','flow,table,table='+a.table+'','flowtable'+a.table+'');
		return;
	}
	if(lx==3){
		var url = js.getajaxurl('$input','table',dir,{setid:a.id});
		js.open(url, 1000,530);
		return;
	}
	if(lx==4){
		var tabs=a.table;
		if(!isempt(a.tables))tabs+='|'+a.tables+'';
		addtabs('['+a.name+']页面元素设置','flow,table,element,mid='+a.id+',table='+tabs+'','flowelement'+a.id+'');
		return;
	}
	if(lx==5){
		js.msg('wait','创建中...');
		js.ajax(js.getajaxurl('createlist',mode,dir),{id:a.id},function(d){
			if(d.success){
				js.msg('success','创建成功');
			}else{
				js.msg('msg',d.msg);
			}
		},'get,json');
		return;
	}
	var url = js.getajaxurl('$pageset',mode,dir,{setid:a.id,atype:lx});
	js.open(url, 1000,530);
}
var panel = {
	xtype:'rockgridform',tablename:'flow_set',formtitle:'流程配置',searchtools:false,
	checkcolumns:true,celleditbool:true,defaultorder:'`sort`',
	bbaritems:['此功能添加需要开发，谨慎添加和删除，<a href="http://www.rockoa.com/view_flowset.html" target="_blank" class="a">查看帮助?</a>'],
	clickgrid:function(){
		btns(false);
	},
	tbar:[{
		text:'字段设置',icon:gicons('table_gear'),id:'setwheres_'+rand+'',handler:clicksetfield,disabled:true
	},'-',{
		text:'设置条件',handler:clicksetwhere,id:'setwhere_'+rand+'',disabled:true
	},'-',{
		text:'设置进程名称',handler:setcoursename,id:'setcourse_'+rand+'',disabled:true
	},'-',{
		text:'<font color=red>进程管理</font>',icon:gicons('sitemap'),id:'course_'+rand+'',handler:setcoursela,disabled:true
	},'-',{
		text:'流程开发显示设置',icon:gicons('application_form'),id:'inputla_'+rand+'',disabled:true,menu:[{
			text:'表结构设置',handler:setinputla,astype:2,icon:gicons('table')
		},{
			text:'页面元素设置',handler:setinputla,astype:4,icon:gicons('application_view_columns')
		},{
			text:'录入页面布局',handler:setinputla,astype:3,icon:gicons('html')
		},{
			text:'电脑PC端展示设置',handler:setinputla,astype:0
		},{
			text:'手机移动端展示设置',handler:setinputla,astype:1
		},{
			text:'生成列表展示页',handler:setinputla,astype:5
		}]
	},'-',{
		text:'重新匹配流程',handler:clickpipei
	},{
		xtype:'tbtext',id:'msg_'+rand+''
	}],
	columns:[{
		xtype: 'rownumberer',
		width: 35
	},{
		text:'名称',dataIndex:'name',flex:1
	},{
		text:'分类',dataIndex:'type',width:'7%'
	},{
		text:'编号',dataIndex:'num',width:'7%'
	},{
		text:'对应表',dataIndex:'table',width:'8%'
	},{
		text:'排序号',dataIndex:'sort',width:'6%',editor:{xtype:'numberfield',minValue:0}
	},{
		text:'站内提醒',dataIndex:'zntx',width:'7%',sortable:true,editor:{xtype:'combo',store:js.arraystr(),editable:false},renderer:renderbox
	},{
		text:'REIM提醒',dataIndex:'imtx',width:'8%',sortable:true,editor:{xtype:'combo',store:js.arraystr(),editable:false},renderer:renderbox
	},{
		text:'邮件提醒',dataIndex:'emtx',width:'7%',sortable:true,editor:{xtype:'combo',store:js.arraystr(),editable:false},renderer:renderbox
	},{
		text:'微信提醒',dataIndex:'wxtx',width:'7%',sortable:true,editor:{xtype:'combo',store:js.arraystr(),editable:false},renderer:renderbox
	},{
		text:'APP提醒',dataIndex:'apptx',width:'7%',sortable:true,editor:{xtype:'combo',store:js.arraystr(),editable:false},renderer:renderbox
	},{
		text:'有流程?',dataIndex:'isflow',width:'7%',sortable:true,editor:{xtype:'combo',store:js.arraystr(),editable:false},renderer:renderbox
	},{
		text:'手机模块',dataIndex:'isapp',width:'7%',sortable:true,editor:{xtype:'combo',store:js.arraystr(),editable:false},renderer:renderbox
	},{
		text:'ID',dataIndex:'id',width:'4%'
	}],
	formwidth:650,
	formparams:{
		submitfields:'name,num,sort,table,summary,type,zntx,imtx,emtx,isflow,sericnum,isapp,wxtx,receid,recename,apptx,tables',
		params:{int_filestype:'sort,zntx,imtx,emtx,isflow,isapp,wxtx,apptx',otherfields:'optdt={now}'},autoScroll:false,
		url:publicsave(mode, dir),
		aftersaveaction:'pandtablela',
		beforesaveaction:'pandtablelabefore',
		items:[{
			fieldLabel:'id号',value:'0',name:'idPost',hidden:true
		},{
			fieldLabel:''+bitian+'编号',name:'numPost',allowBlank: false
		},{
			fieldLabel:''+bitian+'名称',name:'namePost',allowBlank: false
		},{
			fieldLabel:''+bitian+'分类',name:'typePost',allowBlank: false,xtype:'optioncombo',optionmnum:'flowfenlei'
		},{
			fieldLabel:'排序号',name:'sortPost',value:'0',minValue:0,xtype:'numberfield'
		},{
			fieldLabel:'对应的表',name:'tablePost'
		},{
			fieldLabel:'对应子表关联',name:'tablesPost'
		},{
			fieldLabel:''+bitian+'单号规则',name:'sericnumPost',allowBlank: false
		},{
			fieldLabel:'摘要',name:'summaryPost',xtype:'textareafield',height:60
		},{
			xtype: 'fieldcontainer',defaultType: 'textfield',layout:'hbox',items:[{
				fieldLabel:'&nbsp;',name:'isflowPost',xtype:'checkboxfield',boxLabel:'有流程',inputValue:'1',checked:true,labelSeparator:''
			},{
				fieldLabel:'&nbsp;',labelWidth:5,name:'isappPost',xtype:'checkboxfield',boxLabel:'手机模块',inputValue:'1',checked:true,labelSeparator:''
			},{
				fieldLabel:'&nbsp;',labelWidth:10,name:'zntxPost',xtype:'checkboxfield',boxLabel:'站内提醒',inputValue:'1',checked:true,labelSeparator:''
			},{
				fieldLabel:'&nbsp;',labelWidth:5,name:'imtxPost',xtype:'checkboxfield',boxLabel:'REIM提醒',inputValue:'1',checked:false,labelSeparator:''
			},{
				fieldLabel:'&nbsp;',labelWidth:5,name:'emtxPost',xtype:'checkboxfield',boxLabel:'邮件提醒',inputValue:'1',checked:false,labelSeparator:''
			},{
				fieldLabel:'&nbsp;',labelWidth:5,name:'apptxPost',xtype:'checkboxfield',boxLabel:'APP提醒',inputValue:'1',checked:false,labelSeparator:''
			}]
		},{
			xtype: 'fieldcontainer',defaultType: 'textfield',layout:'hbox',items:[{
				fieldLabel:'&nbsp;',name:'wxtxPost',xtype:'checkboxfield',boxLabel:'微信提醒推送(请确保有<a href="http://www.rockoa.com/view_weixin.html" target="_blank" class="a">微信号</a>后才开启否则系统将崩溃)',inputValue:'1',checked:false,labelSeparator:''
			}]
		},{
			name:'receidPost',id:'receid_'+rand+'',xtype:'textfield',hidden:true
		},{
			fieldLabel:'可用人员',nameidfields:'receid_'+rand+'',name:'recenamePost',xtype:'changedeptuser',changetitle:'选择人员',changetype:'deptusercheckall'
		}]
	},
	fields:['summary','receid','recename','sericnum'],
	features: [{
		ftype: 'rowbody',
		getAdditionalData: function(v, index) {
			var cont = v.summary,s	= '',s1='',receid=v.receid;
			var cls = 'x-grid-row-body-hidden';
			s= '可用：<font color=green>全体人员</font>';
			if(!isempt(receid)&&receid!='all')s= '可用：<font color=blue>'+v.recename+'</font>';
			if(!isempt(cont)){
				s+='，摘要：'+cont+'';
			}
			s+='，单号规则：'+v.sericnum+'序号';
			if(s!=''){
				cls = '';
				s1	= '<div style="padding:2px;line-height:20px;padding-left:15%;">'+s+'</div>';
			}
			return {
				rowBody: s1,
				rowBodyCls:cls
			};
		}
	}, {
		ftype: 'rowwrap'
	}]
};


return {
	panel:panel,
	init:function(){
		grid = rock[index];
	}
};