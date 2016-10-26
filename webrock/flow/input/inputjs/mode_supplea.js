function initbodys(){
	$(form('aid')).change(function(){
		var val = this.value,txt='';
		if(val!=''){
			txt = this.options[this.selectedIndex].text;
		}
		form('aname').value=txt;
	});
}
function changesubmit(d){
	var v = parseFloat(d.total);
	if(v<=0)return '领用数量必须大于0';
}