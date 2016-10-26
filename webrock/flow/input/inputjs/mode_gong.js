function initbodys(){
	$(form('typenum')).change(function(){
		var val = this.value,txt='';
		if(val!=''){
			txt = this.options[this.selectedIndex].text;
		}
		form('typename').value=txt;
	});
}