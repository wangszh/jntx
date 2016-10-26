var where = params.where;
//where=jm.uncrypt(where);
//where=jm.base64decode(where);

var total = 0;
var fenxiuserino = function(){
	var cans = {
		where:where
	};
	objpanel.getEl().mask('分析中...');
	$.post(js.getajaxurl('deptfx',mode,dir),cans,function(da){
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
            , title: '按单位预算执行统计图'//员工绩效统计图
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
	          	title+='执行比例：' + bili+ "%";	         
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
	
	layout: 'fit',region:'center',
	items:chart
}];

return {
	panel:panel,
	init:function(){
		fenxiuserino();
	}
};