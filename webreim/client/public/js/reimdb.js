var reimdb={
	init:function(){
		if(!nwjsgui)return;
		this.db = new websql.Db('rockreim','1.0','dbs', 10 * 1024 * 1024);
	},
	initcreate:function(){
		if(!this.db)return;
		this.createtable('option','name varchar(50),num varchar(50),pnum varchar(50),value varchar(500),sort INTEGER DEFAULT 0');
		var str = 'uid INTEGER DEFAULT 0,atype varchar(50),`name` varchar(50),content varchar(4000),optdt datetime,sort INTEGER DEFAULT 0';
		for(var i=0;i<=10;i++)str+=',field'+i+' varchar(100)';
		this.createtable('mtable', str);
	},
	createtable:function(name, cont){
		var  sql = "CREATE TABLE IF NOT EXISTS `"+name+"`(id INTEGER PRIMARY KEY AUTOINCREMENT,"+cont+")";
		this.db.exec(sql);
	}
}