function initbodys(){
	$(form('money')).blur(function(){
		var mon 	= js.float(this.value);
		var moncn 	= AmountInWords(mon);
		if(mon<=0){
			mon='';
			moncn='';
		}
		form('money').value=mon;
		form('moneycn').value=moncn;
	});
}
function initbodys(){
	if(mid=='0'){
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