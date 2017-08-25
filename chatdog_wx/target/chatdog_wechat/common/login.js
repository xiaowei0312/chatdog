$(function() {
	loginComp.init()
});
var loginComp = {
	init : function() {
		$("#loginBtn").on("click", function() {
			loginComp.loginSubmit()
		});
		$("#fastRegBtn").on("click", function() {
			window.location.href = "/wechat/user/quickRegist.action";
		});
		$("#validateCodeImg").on("click", function() {
			$(this).attr("src", "/wechat/user/imageVerifyCode.action?t=" + new Date().getTime())
		})
	},
	validateLogin : function(b, e, d, a) {
		if (b == null || $.trim(b).length == 0) {
			layer.alert("请输入会员号!", {
				icon : 5
			});
			return
		}
		if (e == null || $.trim(e).length == 0) {
			layer.alert("请输入登录密码!", {
				icon : 5
			});
			return
		}
		if (d == null || $.trim(d).length != 4) {
			layer.alert("请填写图形验证码!", {
				icon : 5
			});
			return
		}
		a()
	},
	loginSubmit : function() {
		var a = $("#loginname").val();
		var d = $("#loginpass").val();
		var c = $("#verifyCode").val();
		loginComp.validateLogin(a, d, c, function() {
			$.ajax({
				type: "POST",
				url :  "/wechat/user/login.action",
				data : {
					username : a,
					password : d,
					verifyCode : c,
				},
				success : function(e) {
					var f = $.parseJSON(e);
					if (f) {
						if (f.success) {
							window.location.href = f.success;
						} else {
							layer.alert(f.error, {
								icon : 5
							});
							$("#validateCodeImg").click()
						}
					}
				}
			});
		})
	}
};