var type = params.type,changeid=0;
var zobj,sobj,bool=true;
var checkbox = {
	align:'center',width: '6%',menuDisabled:true,dataIndex:'checkboxss',text:'<input type="checkbox" id="selall_'+rand+'">',sortable:false,
	renderer:function(v,d,r){
		return '<input type="checkbox" value="'+r.data.id+'" name="checkbox_'+rand+'">';
	}
};
var savebtn = {
	text:'保存',icon:gicons('disk'),handler:function(){save()}
};

function selall(o1){
	var o =$("input[name='checkbox_"+rand+"']");
	for(var i=0;i<o.length;i++){
		o[i].checked=o1.checked;
	}
}

function save()
{
	if(type=='view' || bool || changeid==0)return false;
	var data={type:type,mid:changeid};
	var cha = ['0'];
	var o =$("input[name='checkbox_"+rand+"']");
	for(var i=0;i<o.length;i++)if(o[i].checked)cha.push(o[i].value);
	data.checkaid	= cha.join(',');
	var url	= js.getajaxurl('save','zwtosubject','budget');
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

var deptzw = {
	xtype:'rocktree',
	url:publictreestore({order:'sort',expandall:'true'}),where:'',
	tablename:'dept',
	title:'部门职位',id:'deptzwlist_'+rand+'',collapsible: true,
	columns:[{
		xtype: 'treecolumn',
		text:'名称',align:'left',dataIndex:'name',flex:1,sortable:false
	},{
		text:'编号',dataIndex:'num',width:'25%',sortable:false,align:'left'
	},{
		text:'ID',dataIndex:'id',width:'10%',sortable:false,align:'center'
	}
	,{
		text:'iszw',dataIndex:'iszw',width:'10%',hidden:true
	}],
	bbar:[{
		text:'全部展开',handler:function(){zobj.expandAll()}
	},'-',{
		text:'全部收起',handler:function(){zobj.collapseAll()}
	},'->']
}

var subject = {
	xtype:'rocktree',
	url:publictreestore({order:'num',expandall:'true'}),where:'',
	tablename:'subject',
	title:'科目列表',id:'subjectlist_'+rand+'',collapsible: true,
	columns:[{
		xtype: 'treecolumn',
		text:'名称',align:'left',dataIndex:'name',flex:1,sortable:false
	},{
		text:'编号',dataIndex:'num',width:'25%',sortable:false,align:'left'
	},{
		text:'ID',dataIndex:'id',width:'10%',sortable:false,align:'center'
	}],
	bbar:[{
		text:'全部展开',handler:function(){sobj.expandAll()}
	},'-',{
		text:'全部收起',handler:function(){sobj.collapseAll()}
	},'->']
}

function backquanxian(){	
	var url		= js.getajaxurl('getextent','zwtosubject','budget');
	var data={type:type,mid:changeid};
	$.post(url,data,function(da){
		bool	= false;
		var o = $("input[name='checkbox_"+rand+"']");
		for(var i=0;i<o.length;i++){
			o[i].checked=false;
			if(da.indexOf('['+o[i].value+']')>=0)o[i].checked=true;
		}
	});
}

var panel=[];

if(type == 'zs'){
	deptzw.region='west';
	deptzw.split=true;
	deptzw.width='48%';
	subject.region='center';
	subject.columns.unshift(checkbox);//unshift在数组头部增加一个元素	 push在数组尾部增加一个元素
	deptzw.click=function(a,r){		
		if(bool)return;		
		if(r.data.iszw=="1"){
			changeid = r.data.id;
			sobj.setTitle('职位['+r.data.name+']的权限');
			backquanxian();
		}
	}
	
	deptzw.bbar.push(savebtn);//unshift在数组头部增加一个元素	 push在数组尾部增加一个元素
	
	panel = [deptzw,subject];
}


return {
	panel:panel,
	init:function(){		
		zobj = getcmp('deptzwlist_'+rand+'');
		sobj = getcmp('subjectlist_'+rand+'');
		//if(type =='view')get('selall_'+rand+'').disabled=true;
		$('#selall_'+rand+'').click(function(){
			selall(this);
		});
		bool=false;
	}
};