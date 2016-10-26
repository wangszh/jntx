var changetype = '';
function initbody(){
	changetype = js.request('changetype');
	if(changetype=='')changetype='changeusercheck';
	resetw();
	$(window).resize(function(){
		resetw();
	});
	im.init();
	$('#AltClose').click(function(){
		connectclose();
	});
}

function resetw(){
	var h = winHb()-66;
	if(h<50)return;
	$('#deptlist').css({height:''+h+'px'});
	$('#changeuserlist').css({height:''+h+'px'});
}

var userarr = {},deptarr={},subjectarr={};
var im = {
	init:function(){
		//获取科目树		
		var url = js.getajaxurl('loadsubject','subject','budget');		
		js.ajax(url,{'aid':adminid,'changetype':changetype}, function(da){
			//alert(da);
			//debugger;
			var a = js.decode(da);
			//alert(JSON.stringify(a))
			//alert(JSON.stringify(a.darr))
			im.showdept(a.darr);
			$('#AltC').click(function(){				
				im.okque();
			});
		});
	},
	
	showdept:function(a, lxs){
		var o = $('#deptlist');		
		var s = this.showdept1(a,0);
		o.html(s);
	},
	showdept1:function(a, oi){
		//alert(JSON.stringify(a))
		var i,s='',s1='',st,j=0,facea;
		if(!a)return s;
		for(i=0; i<a.length; i++){			
			s1 = this.showdept1(a[i].children, oi+1);
			st = '';
			if(a[i].imonline !=1 && a[i].type=='u'){
				st='class="offline"';
			}	
			if(a[i].type=='u'){
				st+=' userid="'+a[i].uid+'"';
				userarr[a[i].uid] = a[i];
			}else if(a[i].type=='s'){
				//st+=' userid="'+a[i].uid+'"';
				subjectarr[a[i].sid] = a[i];
			}else{
				deptarr[a[i].did] = a[i];
			}
			facea = a[i].face;
			if(isempt(facea)){
				facea='images/im/filess.png';
				if(s1=='')facea='images/im/file.png';
			}	
			s+='<div id="dept_'+a[i].id+'" ondblclick="im.opendept(\''+a[i].id+'\')">';
			for(j=0;j<oi;j++)s+='<img src="images/white.gif" align="absmiddle">';
			if(a[i].type=='u'){
				s+='<img src="'+facea+'" align="absmiddle">';
			}else{
				s+='<img src="'+facea+'" onclick="im.openadept(\''+a[i].id+'\')" align="absmiddle">';
			}
			s+=''+a[i].name+'</div>';
			if(s1!=''){
				s+='<span style="display:none" id="downdept_'+a[i].id+'">'+s1+'</span>';
			}
		}
		return s;
	},
	opendept:function(sid){		
		var t = sid.substr(0, 1),
		   id1= sid.substr(1);
		if(t=='u'){
			var d = userarr[id1];
			if(changetype.indexOf('user')>0)this.additems(d);
		}else if(t=='s'){
			var d = subjectarr[id1];
			if(changetype.indexOf('subject')>0)this.additemsss(d);
		}else{
			var d = deptarr[id1];
			if(changetype.indexOf('dept')>0)this.additemss(d);
		}
	},
	openadept:function(sid){
		$('#downdept_'+sid+'').toggle();
	},
	additems:function(a){
		if(changetype=='changeuser')this.clearla();
		var s = '',
		ids = 'yitian_'+a.id+'';
		if(get(ids))return; 
		s='<div ondblclick="$(this).remove()" id="'+ids+'" userid="'+a.uid+'" atype="u" userna="'+a.name+'"><img src="'+a.face+'" align="absmiddle">'+a.name+'</div>';
		$('#changeuserlist').append(s);
	},
	clearla:function(){
		$('#changeuserlist').html('');
	},
	additemss:function(a){
		if(changetype=='changedept')this.clearla();
		var s = '',
		ids = 'yitian_'+a.id+'';
		if(get(ids))return; 
		s='<div ondblclick="$(this).remove()" id="'+ids+'" userid="'+a.did+'" atype="d" userna="'+a.name+'"><img src="images/im/filess.png" align="absmiddle">'+a.name+'</div>';
		$('#changeuserlist').append(s);
	},
	additemsss:function(a){
		if(changetype=='changesubject')this.clearla();
		var s = '',
		ids = 'yitian_'+a.id+'';
		if(get(ids))return; 
		s='<div ondblclick="$(this).remove()" id="'+ids+'" userid="'+a.sid+'" atype="s" userna="'+a.name+'"><img src="images/im/filess.png" align="absmiddle">'+a.name+'</div>';
		$('#changeuserlist').append(s);
	},
	okque:function(){
		//debugger;
		var o = $('#changeuserlist').find('div'),sid,s='',s1='',ate,oat;
		for(var i=0;i<o.length;i++){
			oat = $(o[i]);
			sid = oat.attr('userid');
			ate = oat.attr('atype');
			if(changetype=='changedeptusercheck')sid=''+ate+''+sid+'';
			s+=','+sid+'';
			s1+=','+oat.attr('userna')+'';
		}
		
		if(s!=''){
			s=s.substr(1);
			s1=s1.substr(1);
		}
		try{opener[js.request('callback')](s1,s);}catch(e){}
		try{parent[js.request('callback')](s1,s);parent.closechangeuser()}catch(e){}
		connectclose();
	}
}


function connectclose(){
	window.close();
}