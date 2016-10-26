var total = 0;
var fenxiuserino = function(){
	var cans = {
		type:getcmp('type_'+rand).getValue(),
		dt:getcmp('dt_'+rand).getValue()
	};
	objpanel.getEl().mask('分析中...');
	$.post(js.getajaxurl('fx',mode,dir),cans,function(da){
		objpanel.getEl().unmask();
		
		var a = js.decode(da);
		objpanel.down('chart').getStore().loadData(a.rows);
		
		var b = a.rows;
		b.push({name:'合计',value:a.totalCount,bili:''});
		objpanel.down('grid').getStore().loadData(b);
	});
}
var chart = {
	xtype: 'chart',animate: true,shadow: true,
	store: Ext.create('Ext.data.Store', {
		fields: ['name', 'data1', 'data2', 'data3', 'data4', 'data5'],
	    data: [
	        { 'name': 'metric one',   'data1': 1, 'data2': 12, 'data3': 14, 'data4': 8,  'data5': 13 },
	        { 'name': 'metric two',   'data1': 7,  'data2': 8,  'data3': 16, 'data4': 10, 'data5': 3  },
	        { 'name': 'metric three', 'data1': 5,  'data2': 2,  'data3': 14, 'data4': 12, 'data5': 7  },
	        { 'name': 'metric four',  'data1': 2,  'data2': 14, 'data3': 6,  'data4': 1,  'data5': 23 },
	        { 'name': 'metric five',  'data1': 4,  'data2': 4,  'data3': 36, 'data4': 13, 'data5': 33 }
	    ]
	}),
	legend: {
		position: 'right'
	},
	theme: 'Base:gradients',
	axes: [
        {
            type: 'Numeric',
            position: 'left',
            fields: ['data1', 'data2', 'data3', 'data4'],
            label: {
                renderer: Ext.util.Format.numberRenderer('0,0')
            },
            title: 'Sample Values',
            grid: true,
            minimum: 0
        },
        {
            type: 'Category',
            position: 'bottom',
            fields: ['name'],
            title: 'Sample Metrics'
        }
    ],
	series:[
		{
            type: 'line',
            highlight: {
                size: 7,
                radius: 7
            },
            tips: {
				trackMouse: true,
				width: 140,
				renderer: function(d, item) {
					this.setTitle(d.get('name') + ': ' + d.raw.data1 + '');
				}
			},
            axis: 'left',
            xField: 'name',
            yField: 'data1',
            markerConfig: {
                type: 'cross',
                size: 4,
                radius: 4,
                'stroke-width': 0
            }
        },
        {
            type: 'line',
            highlight: {
                size: 7,
                radius: 7
            },
            tips: {
				trackMouse: true,
				width: 140,
				renderer: function(d, item) {
					this.setTitle(d.get('name') + ': ' + d.raw.data2 + '');
				}
			},
            axis: 'left',
            fill: true,
            xField: 'name',
            yField: 'data2',
            markerConfig: {
                type: 'circle',
                size: 4,
                radius: 4,
                'stroke-width': 0
            }
        },
        {
            type: 'line',
            highlight: {
                size: 7,
                radius: 7
            },
            tips: {
				trackMouse: true,
				width: 140,
				renderer: function(d, item) {
					this.setTitle(d.get('name') + ': ' + d.raw.data3 + '');
				}
			},
            axis: 'left',
            fill: true,
            xField: 'name',
            yField: 'data3',
            markerConfig: {
                type: 'circle',
                size: 4,
                radius: 4,
                'stroke-width': 0
            }
        },
        {
            type: 'line',
            highlight: {
                size: 7,
                radius: 7
            },
            tips: {
				trackMouse: true,
				width: 140,
				renderer: function(d, item) {
					this.setTitle(d.get('name') + ': ' + d.raw.data4 + '');
				}
			},
            axis: 'left',
            fill: true,
            xField: 'name',
            yField: 'data4',
            markerConfig: {
                type: 'circle',
                size: 4,
                radius: 4,
                'stroke-width': 0
            }
        }
	]
};

var panel = [{
	width:300,region:'east',split:true,
	xtype:'grid',
	store: Ext.create('Ext.data.Store', {
		fields:['name','value','bili'],
		data:[]
	}),
	columns:[{xtype: 'rownumberer',width:'10%'},{
		dataIndex:'name',
		align:'center',width:'40%',
		text:'名称',menuDisabled:true
	},{
		dataIndex:'value',
		align:'center',width:'24%',
		text:'值',menuDisabled:true
	},{
		dataIndex:'bili',
		align:'center',width:'24%',
		text:'比例',menuDisabled:true
	}]
},{
	tbar:['按照',{
		xtype:'combo',value:'deptname',store:js.arraystr('deptname|部门,gender|性别,xueli|学历,nian|年龄,year|入职年份,nianxian|入职年限,state|人员状态,ranking|职位'),width:100,editable:false,id:'type_'+rand+''
	},{
		xtype:'rockdate',width:130,clearbool:true,editable:false,id:'dt_'+rand,emptyText:'在职日期'
	},{
		text:'分析',icon:gicons('chart_pie'),handler:fenxiuserino
	}],
	layout: 'fit',region:'center',
	items:chart
}];

return {
	panel:panel,
	init:function(){
		//fenxiuserino();
	}
};