(function(){
	
	function menuclass(cans){
		var can = js.apply({
			title:'请选择',
			data:[],click:function(){}
		},cans);
		var me 	 = this;
		var rand = js.getrand(),mdivid='menu_'+rand+'';
		this.show = function(){
			if(get(mdivid)){
				$('#'+mdivid+'').show();
				return;
			}
			var s = '',i;
			s+='<div class="listmenu" id="'+mdivid+'">';
			s+='<div onclick="$(\'#'+mdivid+'\').remove()" class="listmenu_model"></div>';
			s+='<div class="listmenu_list box">';
			s+='	<div class="one">'+can.title+'</div>';
			for(i=0;i<can.data.length;i++){
				s+='	<div oi="'+i+'" class="list">'+can.data[i].text+'</div>';
			}
			s+='	<div lx="cancel" onclick="$(\'#'+mdivid+'\').remove()" class="lists hui">取消</div>';
			s+='</div>';
			s+='</div>';
			$('body').append(s);
			$('#'+mdivid+'').show();
			$('#'+mdivid+'').find('div[oi]').click(function(e){
				me._click(this,e);
			});
		};
		this.init = function(){
		};
		this._click = function(o1,e){
			var o = $(o1);
			var oi= parseFloat(o.attr('oi'));
			can.click(can.data[oi],o,oi,e);
			$('#'+mdivid+'').remove();
		}
	}
	$.rockmenu	= function(can){
		var clsa = new menuclass(can);
		clsa.init();
		return clsa;
	};
})(jQuery);