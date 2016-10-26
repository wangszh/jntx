var historys={
	set:function(k,v){
		return js.setoption(k,v);
	},
	get:function(k,dv){
		return js.getoption(k,dv);
	},
	append:function(k,wy,str){
		var s='',oi;
		if(typeof(str)=='object'){
			for(oi in str)s+=',"'+oi+'":"'+str[oi]+'"';
			s='{'+s.substr(1)+'}';
		}else{
			s=str;
		}
		this.set(''+k+'_'+wy+'', str);
	},
	getarr:function(k){
		
	}
}