$(function() {
	shopDetailComp.init()
});
var shopDetailComp = {
	mapInit : false,
	init : function() {
		this.bindEvent()
	},
	bindEvent : function() {
		$(".near_range").find("a").on("click", shopDetailComp.changeTab)
	},
	changeTab : function() {
		var a = $(this).index();
		$(this).addClass("hover").siblings().removeClass("hover");
		$(".near_range").nextAll("dl").css("display", "none").eq(a).css(
				"display", "block");
		if (a == 2 && !shopDetailComp.mapInit) {
			shopDetailComp.initBDMap()
		}
	},
	initBDMap : function() {
		shopDetailComp.mapInit = true;
		var d = new BMap.Map("mapContent");
		var a = new BMap.Point(s.lng, s.lat);
		d.centerAndZoom(a, 17);
		var c = new BMap.ScaleControl({
			anchor : BMAP_ANCHOR_TOP_LEFT
		});
		var b = new BMap.Marker(a);
		d.addOverlay(b);
		d.addControl(c)
	}
};