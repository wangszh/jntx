var panel = {
	xtype:'rockgridform',tablename:'im_group',celleditbool:true,defaultorder:'`sort`',keywhere:'[A][K]`type`[D]2',
	columns:[{
		xtype: 'rownumberer',
		width: 40
	},{
		text:'图标',dataIndex:'face',width:'8%',renderer:function(v){
			if(!isempt(v))v='<img width=24 height=24 src='+v+'>';
			return v;
		}
	},{
		text:'编号',dataIndex:'num',search:true,width:'8%'
	},{
		text:'名称',dataIndex:'name',editor:'textfield',search:true,width:'10%'
	},{
		text:'应用地址',dataIndex:'url',flex:1,align:'left'
	},{
		text:'可用人员',dataIndex:'recename',search:true,width:'16%'
	},{
		text:'排序号',dataIndex:'sort',width:'6%',editor:{xtype:'numberfield',minValue:0},sortable:true
	},{
		text:'状态',dataIndex:'valid',width:'10%',editor:{xtype:'combo',store:js.arraystr(),editable:false},renderer:renderbox
	},{
		text:'窗口宽',dataIndex:'width',width:'6%',editor:{xtype:'numberfield',minValue:0},sortable:true
	},{
		text:'窗口高',dataIndex:'height',width:'6%',editor:{xtype:'numberfield',minValue:0},sortable:true
	},{
		text:'ID',dataIndex:'id',width:'6%'
	}],
	formtitle:'应用',
	formparams:{
		submitfields:'name,num,url,face,sort,receid,recename,valid,width,height',
		autoScroll:false,params:{int_filestype:'sort,valid,width,height',otherfields:'type=2'},
		beforesaveaction:'setemailpass',url:publicsave(mode, dir),
		items:[{
			fieldLabel:'id号',value:'0',name:'idPost',hidden:true
		},{
			fieldLabel:''+bitian+'名称',name:'namePost',allowBlank: false
		},{
			fieldLabel:'编号',name:'numPost'
		},{
			fieldLabel:'地址',name:'urlPost'
		},{
			fieldLabel:'图标',name:'facePost'
		},{
			name:'receidPost',id:'receid_'+rand+'',xtype:'textfield',hidden:true
		},{
			fieldLabel:'可用人员',nameidfields:'receid_'+rand+'',name:'recenamePost',xtype:'changedeptuser',changetitle:'选择人员',changetype:'deptusercheckall'
		},{
			fieldLabel:'排序号',name:'sortPost',value:'0',minValue:0,xtype:'numberfield'
		},{
			fieldLabel:'窗口宽',name:'widthPost',value:'0',minValue:0,xtype:'numberfield'
		},{
			fieldLabel:'窗口高',name:'heightPost',value:'0',minValue:0,xtype:'numberfield'
		},{
			fieldLabel:'&nbsp;',name:'validPost',xtype:'checkboxfield',boxLabel:'启用',inputValue:'1',value:'1',checked:true,labelSeparator:''
		}]
	}
};

return {
	panel:panel
};
