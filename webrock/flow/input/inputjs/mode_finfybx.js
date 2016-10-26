function changesubmitbefore(){
	//var mon 	= js.float(c.getsubtotals('moneys','0'));
	//alert(form('money').value)
	//return;
	var mon 	= js.float(form('money').value);
	var moncn 	= AmountInWords(mon);
	if(mon<=0){
		mon='';
		moncn='';
	}
	form('money').value=mon;
	form('moneycn').value=moncn;
}

function initbodys(){
	if(mid=='0'){
		//获取用户的　全称　收款账号　身份证号
		js.ajax(geturlact('getusermr'),{},function(d){
			if(d){
				form('cardid').value=d.cardid ;
				form('fullname').value=d.name;
				form('idnum').value=d.idnum;
			}
		},'get,json');
		
		return;
		
		//先不用了　获取最新的一条提交数据（没用已经取消）
		js.ajax(geturlact('getlast'),{},function(d){
			if(d){
				form('paytype').value=d.paytype;
				form('cardid').value=d.cardid;
				form('openbank').value=d.openbank;
				form('fullname').value=d.fullname;
			}
		},'get,json');
	}
}