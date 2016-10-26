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
	xtype: 'chart',
	style: 'background:#fff',
    animate: true,        //动画
    shadow: true,         //阴影
	store: Ext.create('Ext.data.Store', {
		fields: ['name', 'total', 'passed', 'deleted'],
	    data: [
	        {
                'name': '张三',
                'total': 10,
                'passed': 6,
                'deleted': 4
            }, {
                'name': '李四',
                'total': 10,
                'passed': 5,
                'deleted': 5
            }, {
                'name': '王五',
                'total': 7,
                'passed': 4,
                'deleted': 3
            }, {
                'name': '赵六',
                'total': 50,
                'passed': 40,
                'deleted': 10
            }, {
                'name': '赵七',
                'total': 50,
                'passed': 20,
                'deleted': 15
            }
	    ]
	}),
	//legend: {
	//	position: 'right'
	//},
	//theme: 'Base:gradients',
	axes: [
		{
            type: 'Numeric',  //显示图形类型- line：则线图；column：柱形图；radar：
            position: 'left',        //
            fields: ['total', 'passed', 'deleted'],
            //xField: 'name',
            //yField: ['total', 'passed', 'deleted'],
            minimum: 0,  //如果小于这个数，图标向下（相当于设置了一个起始点）
            label: {
                renderer: Ext.util.Format.numberRenderer('0,0')
            },
            grid: true,
            title: '文章数'
        }, {
            type: 'Category',
            position: 'bottom',
            fields: ['name']
            , title: '员工列表'//员工绩效统计图
        }
    ],
	series: [
		{
            type: 'column',
            axis: 'left',
            tips: {
	          trackMouse: true,
	          width: 140,
	          height: 68,
	          renderer: function(storeItem, item) {
	          	title=storeItem.get('name') + '<br>';
	          	title+='属性1：' + storeItem.get('total') + '<br>';
	          	title+='属性2：' + storeItem.get('passed') + '<br>';
	          	title+='属性3：' + storeItem.get('deleted');	         
	            this.setTitle(title);
	          }
	        },
	        label: {
	          display: 'insideEnd',
	            field: ['total', 'passed', 'deleted'],
	            renderer: Ext.util.Format.numberRenderer('0'),
	            orientation: 'horizontal',
	            color: '#333',
	            'text-anchor': 'middle'
	        },
            xField: 'name',
            yField: ['total', 'passed', 'deleted']
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