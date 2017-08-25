package com.sxsram.ssm.util;

public class AjaxResult {
	private String success;
	private String error;
	
	public AjaxResult() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AjaxResult(String success, String error) {
		this.success = success;
		this.error = error;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

}
