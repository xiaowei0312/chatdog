package com.sxsram.ssm.util;

public class WxTemplateEntity {
	public String touser;
	public String template_id;
	public String url;
	public WxTemplateData data;

	public WxTemplateEntity(String touser, String template_id, String url, WxTemplateData data) {
		super();
		this.touser = touser;
		this.template_id = template_id;
		this.url = url;
		this.data = data;
	}

	public WxTemplateEntity() {
		super();
	}
}