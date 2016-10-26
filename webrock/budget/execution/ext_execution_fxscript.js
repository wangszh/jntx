var where = params.where;
//where=jm.uncrypt(where);
//where=jm.base64decode(where);

var total = 0;
var fenxiuserino = function(){	
	var startdt=getcmp('startdt_'+rand).getValue();
	var enddt=getcmp('enddt_'+rand).getValue();		
	if(startdt.length>0)
	{		
		if(!js.IsDate('开始日期',startdt)){
			//alert("开始日期格式不正确!");
			return;
		}
	}
	
	if(enddt.length>0)
	{	
		if(!js.IsDate('结束日期',enddt)){
			//alert("结束日期格式不正确!");
			return;
		}
	}	
	if(startdt.length>0){		
		if (startdt>enddt){
			alert("开始日期不得大于结束日期");
			return;
		}
	}		
	var cans = {
		type:getcmp('type_'+rand).getValue(),
		startdt:startdt,
		enddt:enddt,
		where:where
	};
	objpanel.getEl().mask('分析中...');
	$.post(js.getajaxurl('fx',mode,dir),cans,function(da){
		objpanel.getEl().unmask();
		
		var a = js.decode(da);
		objpanel.down('chart').getStore().loadData(a.rows);
		
		var b = a.rows;
		var bili=evalue/pvalue*100;
	    bili=bili.toFixed(2);
		b.push({name:'合计',pvalue:a.totalp,evalue:a.totale,bili:bili});
		objpanel.down('grid').getStore().loadData(b);
	});
}

var chart = {
	xtype: 'chart',
	style: 'background:#fff',
    animate: true,        //动画
    shadow: true,         //阴影
	store: Ext.create('Ext.data.Store', {
		fields: ['name', 'pvalue', 'evalue'],
	    data: []
	}),
	legend: {
		position: 'top'
	},
	theme: 'Base:gradients',
	axes: [
		{
            type: 'Numeric',  
            position: 'left',        //
            fields: ['pvalue', 'evalue'],
            //xField: 'name',
            //yField: ['pvalue', 'pvalue'],
            minimum: 0,  //如果小于这个数，图标向下（相当于设置了一个起始点）
            label: {
                renderer: Ext.util.Format.numberRenderer('0,0')
            },
            grid: true,
            title: '金额(元)'
        }, {
            type: 'Category',
            position: 'bottom',
            fields: ['name']
            , title: '预算执行统计图'//员工绩效统计图
        }
    ],
	series: [
		{
            type: 'column',//显示图形类型- line：折线图；column：柱形图；radar：雷达图； bar:条形图;
            axis: 'left',
            tips: {
	          trackMouse: true,
	          width: 140,
	          height: 68,
	          renderer: function(storeItem, item) {
	          	pvalue=storeItem.get('pvalue');
	          	evalue=storeItem.get('evalue');
	          	//bili=storeItem.get('bili');
	          	
	          	bili=0;
	          	if(pvalue>0){
	          		bili=evalue/pvalue*100;
	          		bili=bili.toFixed(2);
	          	}
	          	
	          	title=storeItem.get('name') + '<br>';
	          	title+='预测值：' + pvalue + '<br>';
	          	title+='执行值：' + evalue + '<br>';
	          	title+='执行比例：' + bili + '%';	         
	            this.setTitle(title);
	          }
	        },
	        label: {
	          display: 'insideEnd',
	            field: ['pvalue', 'evalue'],
	            renderer: Ext.util.Format.numberRenderer('0'),
	            orientation: 'horizontal',
	            color: '#333',
	            'text-anchor': 'middle'
	        },
            xField: 'name',
            yField: ['pvalue', 'evalue'],
            title : ['预算值', '执行值']
        }
	]
};


var panel = [{
	width:300,region:'east',split:true,
	xtype:'grid',
	store: Ext.create('Ext.data.Store', {
		fields:['name','pvalue','evalue','bili'],
		data:[]
	}),
	columns:[{xtype: 'rownumberer',width:'10%'},{
		dataIndex:'name',
		align:'center',width:'40%',
		text:'名称',menuDisabled:true
	},{
		dataIndex:'pvalue',
		align:'center',width:'24%',
		text:'预测值',menuDisabled:true
	},{
		dataIndex:'evalue',
		align:'center',width:'24%',
		text:'执行值',menuDisabled:true
	},{
		dataIndex:'bili',
		align:'center',width:'24%',
		text:'比例(%)',menuDisabled:true
	}]
},{
	tbar:['按照',{
		xtype:'combo',value:'deptname',store:js.arraystr('deptname|部门,subject|科目,yeard|年度,monthd|月度'),width:100,editable:false,id:'type_'+rand+''
	},{
		xtype:'rockdate',width:130,clearbool:true,editable:false,id:'startdt_'+rand,emptyText:'开始日期'
	},{
		xtype:'rockdate',width:130,clearbool:true,editable:false,id:'enddt_'+rand,emptyText:'结束日期'
	},{
		text:'分析',icon:gicons('chart_pie'),handler:fenxiuserino
	},'-','开始结束日期精确到月'],
	layout: 'fit',region:'center',
	items:chart
}];

return {
	panel:panel,
	init:function(){
		fenxiuserino();
	}
};