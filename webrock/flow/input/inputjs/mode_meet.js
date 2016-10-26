function changesubmit(d){
	if(d.enddt<=d.startdt)return '结束时间必须大于开始时间';
	if(d.enddt.substr(0,10)!=d.startdt.substr(0,10)){
		return '不允许跨日申请';
	}
}
