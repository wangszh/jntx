var grid,mid=params.mid,table=params.table;
var panel = {
	xtype:'rockgridform',tablename:'flow_element',formtitle:'页面元素',searchtools:false,bbarbool:false,
	url:js.getajaxurl('getelement',mode,dir),paramsbase:{table:params.table,mid:mid},celleditbool:true,
	tbar:[{
		icon:gicons('reload'),handler:function(){grid.storereload()}
	},'页面元素也就对应模块的表单元素等管理，<a href="http://www.rockoa.com/view_element.html" class="a" target="_blank">元素类型说明</a>'],
	columns:[{
		xtype: 'rownumberer',
		width: 40
	},{
		text:'元素对应',dataIndex:'iszb',width:'7%',renderer:function(v){
			var s='';
			if(v=='0'){
				s='<font color=green>主表</font>';
			}else{
				s='<font color=#888888>第'+v+'子表</font>';
			}
			return s;
		}
	},{
		text:'元素名称',dataIndex:'name',search:true,width:'10%'
	},{
		text:'对应字段',dataIndex:'fields',width:'8%',search:true
	},{
		text:'元素类型',dataIndex:'fieldstype',width:'10%',search:true
	},{
		text:'默认值',dataIndex:'dev',width:'7%'
	},{
		text:'排序号',dataIndex:'sort',width:'6%',editor:{xtype:'numberfield',minValue:0}
	},{
		text:'需录入',dataIndex:'islu',width:'6%',editor:{xtype:'combo',store:js.arraystr(),editable:false},renderer:renderbox
	},{
		text:'必填',dataIndex:'isbt',width:'6%',editor:{xtype:'combo',store:js.arraystr(),editable:false},renderer:renderbox
	},{
		text:'展示列',dataIndex:'iszs',width:'6%',editor:{xtype:'combo',store:js.arraystr(),editable:false},renderer:renderbox
	},{
		text:'搜索列',dataIndex:'isss',width:'6%',editor:{xtype:'combo',store:js.arraystr(),editable:false},renderer:renderbox
	},{
		text:'列宽',dataIndex:'width',width:'6%',editor:'textfield'
	},{
		text:'数据源',dataIndex:'data',flex:1
	},{
		text:'ID',dataIndex:'id',width:'4%'
	}],
	formwidth:470,
	formparams:{
		submitfields:'name,fields,sort,fieldstype,isbt,dev,data,islu,iszs,attr,iszb,isss,lattr,width',
		params:{int_filestype:'isbt,sort,islu,iszs,iszb,isss',otherfields:'mid='+mid+''},
		items:[{
			fieldLabel:'id号',value:'0',name:'idPost',hidden:true
		},{
			fieldLabel:'BT元素名称',name:'namePost',allowBlank: false
		},{
			fieldLabel:'BT对应表上字段',name:'fieldsPost',allowBlank: false,xtype:'combo',store:[['','']],editable:true
		},{
			fieldLabel:'BT元素类型',name:'fieldstypePost',allowBlank: false,xtype:'optioncombo',optionmnum:'flowinputtype',autoloadlist:true,valuefields:'value',value:'text'
		},{
			fieldLabel:'默认值',name:'devPost'
		},{
			xtype: 'fieldcontainer',defaultType: 'textfield',layout:'hbox',items:[{
				fieldLabel:'&nbsp;',name:'isluPost',xtype:'checkboxfield',boxLabel:'录入元素',inputValue:'1',value:'1',checked:true,labelSeparator:''
			},{
				fieldLabel:'&nbsp;',labelWidth:5,name:'isbtPost',xtype:'checkboxfield',boxLabel:'录入必填',inputValue:'1',value:'1',checked:true,labelSeparator:''
			}]
		},{
			xtype: 'fieldcontainer',defaultType: 'textfield',layout:'hbox',items:[{
				fieldLabel:'展示列宽',width:'49%',name:'widthPost'
			},{
				fieldLabel:'&nbsp;',labelWidth:20,name:'iszsPost',xtype:'checkboxfield',boxLabel:'展示列',inputValue:'1',value:'1',checked:true,labelSeparator:''
			},{
				fieldLabel:'&nbsp;',labelWidth:5,name:'isssPost',xtype:'checkboxfield',boxLabel:'搜索列',inputValue:'1',value:'1',checked:true,labelSeparator:''
			}]
		},{
			xtype: 'fieldcontainer',defaultType: 'textfield',layout:'hbox',items:[{
				fieldLabel:'元素对应',name:'iszbPost',value:'0',allowBlank: false,xtype:'combo',store:[['0','主表'],['1','第1个1对多行子表'],['2','第2个1对多行子表'],['3','第3个1对多行子表'],['10','第1个扩展子表'],['11','第2个扩展子表']],editable:false,width:'49%'
			},{
				fieldLabel:'排序号',name:'sortPost',value:'0',minValue:0,xtype:'numberfield',width:'50%'
			}]
		},{
			fieldLabel:'数据源',name:'dataPost',xtype:'textarea',height:40
		},{
			fieldLabel:'属性',name:'attrPost',xtype:'textarea',height:40
		},{
			fieldLabel:'展示列属性',name:'lattrPost',xtype:'textarea',height:40
		}]
	},
	loadgrid:function(){
		var d=this.getData('fieldsarr');
		this.formparams.items[2].store=d;
	}
};

return {
	panel:panel,
	init:function(){
		grid = rock[index];
	}
};
