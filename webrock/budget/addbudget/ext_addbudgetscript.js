var grid0,grid1,grid2,did=0,sid=0,yid=0;
var bool=true;//设置避免重复提交
var curryear=(new Date).getFullYear();

var checkbox = {//readonly="true"
	align:'left',width: '26%',menuDisabled:true,dataIndex:'inputboxss',text:'预算值',sortable:false,
	renderer:function(v,d,r){
		return '<input type="text" value="" id="inputbox_'+r.data.id+'" name="inputbox_'+rand+'">';
	}
};

var savebtn = {
	text:'保存',icon:gicons('disk'),handler:function(){save()}
};
var makemonthbtn = {
	text:'生成月度预算',icon:gicons('disk'),handler:function(){makemonth()}
};

function save()
{	
	if(bool)return false;	
	
	if(yid<=0){
		js.msg('msg',"请选择预算年度!");
		return false;
	}
	if(did<=0){
		js.msg('msg',"请选择预算科室或部门!");
		return false;
	}
	var data={yid:yid,did:did};
	
	var chaid = [];
	var chavalue = [];
	var temp="";
	var o = $("input[name='inputbox_"+rand+"']");
	for(var i=0;i<o.length;i++){
		if(o[i].value){
			temp=o[i].id;
			temp=temp.replace("inputbox_","")
			chaid.push(temp);			
			chavalue.push(o[i].value);
		}
	}
	data.chaid	= chaid.join(',');
	data.chavalue	= chavalue.join(',');
	
	//alert(JSON.stringify(data))
	//return;
	
	var url	= js.getajaxurl('savebudget','addbudget','budget');
	bool	= true;
	js.msg('wait','保存中...');
	$.post(url,data,function(da){
		if(da!='success'){
			js.msg('msg',da);
		}else{
			js.msg('success','保存成功');
		}
		bool	= false;
	});
	
}

function makemonth()
{	
	if(bool)return false;	
	
	if(yid<=0){
		js.msg('msg',"请选择预算年度!");
		return false;
	}	
	var data={yid:yid};	
	
	var url	= js.getajaxurl('makemonthbudget','addbudget','budget');
	bool	= true;
	js.msg('wait','生成月度预算中...');
	$.post(url,data,function(da){
		if(da!='success'){
			js.msg('msg',da);
		}else{
			js.msg('success','生成成功');
		}
		bool	= false;
	});
	
}

var budgetlist={
	xtype:'rockgridform',region:'west',width:160,keywhere:'',split:true,bbarbool:false,defaultorder:'ndyear',
	tablename:'budget',storefields:'id,name,ndyear,iscurrent',storeafteraction:'deallistbudget',formtitle:'新增预算',title:'预算年度',collapsible:true,searchtools:false,
	columns:[{
		xtype: 'rownumberer',
		width: 40,hidden:true
	},{
		text:'名称',dataIndex:'title',flex:1,align:'left'
	},{
		text:'预算年度',dataIndex:'ndyear',width:70,hidden:true
	}],
	clickgrid:function(a, v){
		yid = v.get('id');
		//grid1.formwinhide();
		//grid1.searchgoto("and `type`='"+mid+"'");
	},
	formparams:{
		submitfields:'name,ndyear,iscurrent',autoScroll:false,
		params:{int_filestype:'ndyear',otherfields:'addtime={now}'},beforesaveaction:'beforesaveabudget',aftersaveaction:'aftersaveabudget',
		items:[{
			fieldLabel:'id号',value:'0',name:'idPost',hidden:true
		},{
			fieldLabel:'名称',name:'namePost',value:curryear+"年度预算",allowBlank: false
		},{
			fieldLabel:'预算年度',name:'ndyearPost',value:curryear,minValue:0,xtype:'numberfield'
		},{
			//fieldLabel:'是否是当期',name:'iscurrentPost',allowBlank: false,xtype:'optioncombo',optionmnum:'budgetiscurrent',editable:true
			xtype: 'radiogroup',fieldLabel: '是否是当期',width:'49%',
				items: [{
					boxLabel: '是', name: 'iscurrentPost', inputValue: '1', checked: true
				},{
					boxLabel: '否', name: 'iscurrentPost', inputValue: '0'
			}]
		}]
	}
}

var budgetdept={
	
	xtype:'rocktree',
	url:publictreestore({order:'sort',expandall:'true'}),where:'and iszw=0',
	tablename:'dept',
	region:'center',title:'科室车间',collapsible: true,
	columns:[{
		xtype: 'treecolumn',
		text:'名称',align:'left',dataIndex:'name',flex:1,sortable:false
	},{
		text:'编号',dataIndex:'num',width:'25%',sortable:false,align:'left',hidden:true
	},{
		text:'ID',dataIndex:'id',width:'10%',sortable:false,align:'center',hidden:true
	}
	,{
		text:'iszw',dataIndex:'iszw',width:'10%',hidden:true
	}],
	bbar:[{
		text:'全部展开',handler:function(){grid1.expandAll()}
	},'-',{
		text:'全部收起',handler:function(){grid1.collapseAll()}
	},'->']
	
}

var budgetsubject={	
	
	xtype:'rocktree',
	url:publictreestore({order:'num',expandall:'true'}),where:'',
	tablename:'subject',
	region:'east',width:'68%',
	title:'预算科目',collapsible: true,
	columns:[{
		xtype: 'treecolumn',
		text:'名称',align:'left',dataIndex:'name',flex:1,sortable:false
	},{
		text:'编号',dataIndex:'num',width:'25%',sortable:false,align:'left'
	},{
		text:'ID',dataIndex:'id',width:'10%',sortable:false,align:'center',hidden:true
	}],
	bbar:[{
		text:'全部展开',handler:function(){sobj.expandAll()}
	},'-',{
		text:'全部收起',handler:function(){sobj.collapseAll()}
	},'-',{
		text:'预算导入',icon:gicons('page_excel'),tooltip:'必须按照导入文件格式写',menu:[{
			text:'下载导入文件格式',icon:gicons('arrow_down'),handler:opendown
		},'-',{
			text:'导入Excel文件',handler:importdown
		}]
	},'请下载模板填写后导入','->']
	
	
}

function opendown(){
	//var url = js.getajaxurl('downexcel','where','public',{fields:jm.encrypt('帐号,姓名,性别,职位,部门(必须在组织结构中),手机,邮箱,入职日期(用[]扩起来)'),title:jm.encrypt('用户导入格式'),content:jm.encrypt('admin,管理员,男,OA项目经理,开发部,158***,rockoa@xh829.com,[2015-08-01]')});
	//var url ='upload/base/预算导入格式.xls';
	url=js.getajaxurl('export',mode,dir);
	//alert(url)
	js.open(url);
}

function importdown(){
	if(yid>0){
		url=js.getajaxurl('import',mode,dir);
		url=url.replace("?","?yid="+yid+"&");
		//alert(url)
		uploadwindows.imports({
			title:'导入预算',
			url:url,			
			callback:function(){
				rock[index].storereload();
			}
		});
	}else{
		js.msg('msg',"没有选中预算年度");
	} 	
}


function backquanxian(){
	
	var o = $("input[name='inputbox_"+rand+"']");
	for(var i=0;i<o.length;i++){		
		o[i].value="";
		//o[i].readOnly=false;
	}
	
	var url		= js.getajaxurl('getbudget','addbudget','budget');
	var data={yid:yid,did:did};
	$.post(url,data,function(da){
		bool	= false;
		da=JSON.parse(da);//返回了字符串，需要转为json格式数据		
		var o;
		$.each(da['rows'], function(i, n){
			//o = $("input[id='inputbox_"+n.subjectid+"']");
			o = document.getElementById("inputbox_"+n.subjectid)
			o.value=n.yearvalue;			
		})
		
		/*
		var o = $("input[name='inputbox_"+rand+"']");
		for(var i=0;i<o.length;i++){
			da.subjectid
			o[i].checked=false;
			if(da.indexOf('['+o[i].value+']')>=0)o[i].checked=true;
		}*/
	});
}

var panel=[];

budgetsubject.columns.push(checkbox);//unshift在数组头部增加一个元素	 push在数组尾部增加一个元素
budgetdept.click=function(a,v){
	if(bool)return;
	if(yid>0){		
		if(v.data.iszw=="0"){
			js.msg('wait','读取中...');
			did = v.data.id;			
			grid2.setTitle('['+v.data.name+']预算设置');
			backquanxian();
			js.msg('success','读取成功',1);
		}
	}else{		
		js.msg('msg',"没有选中预算年度");
	}
}
	
budgetsubject.bbar.push(savebtn);//unshift在数组头部增加一个元素	 push在数组尾部增加一个元素
budgetsubject.bbar.push(makemonthbtn);//unshift在数组头部增加一个元素	 push在数组尾部增加一个元素

panel = [budgetlist,budgetdept,budgetsubject];

return {
	panel:panel,
	init:function(){
		grid0 = rock[index][0];
		grid1 = rock[index][1];
		grid2 = rock[index][2];
		bool=false;
	}
};