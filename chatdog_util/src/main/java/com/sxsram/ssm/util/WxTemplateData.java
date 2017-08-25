package com.sxsram.ssm.util;

public class WxTemplateData {
	public WxTemplateDataEntry first;
	public WxTemplateDataEntry keyword1;
	public WxTemplateDataEntry keyword2;
	public WxTemplateDataEntry keyword3;
	public WxTemplateDataEntry keyword4;
	public WxTemplateDataEntry keyword5;
	public WxTemplateDataEntry remark;

	public WxTemplateData() {
	}

	public WxTemplateData(WxTemplateDataEntry first, WxTemplateDataEntry keyword1, WxTemplateDataEntry keyword2,
			WxTemplateDataEntry keyword3, WxTemplateDataEntry keyword4, WxTemplateDataEntry keyword5) {
		super();
		this.first = first;
		this.keyword1 = keyword1;
		this.keyword2 = keyword2;
		this.keyword3 = keyword3;
		this.keyword4 = keyword4;
		this.keyword5 = keyword5;
	}
}
