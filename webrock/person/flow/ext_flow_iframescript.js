var url=params.url;
var panel = {
	html:'<iframe src="" id="iframe_'+rand+'" width="100%" height="100%" frameborder="0"></iframe>'
};
return {
	panel:panel,
	init:function(){
		var surl = jm.uncrypt(url),i,slia;
		var surla= surl.split(',');
		if(surla[1]){
			surl='?a='+surla[2]+'&m='+surla[1]+'&d='+surla[0]+'';
			for(i=3;i<surla.length;i++){
				slia=surla[i].split('=');
				surl+='&'+slia[0]+'='+slia[1]+'';
			}
		}
		get('iframe_'+rand+'').src=surl;
	}
};