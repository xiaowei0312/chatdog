package com.sxsram.ssm.entity;

import java.util.Date;

public class QAEntity {
	private String id;
	private String question;
	private String answer;
	private String url;
	private String picUrl;
	private String flagId;
	private Date lastModifyTime;
	private String extra;
	private String typeId;
	private Integer status;
	private QAType qaType;
	private QAFlag qaFlag;

	private String urlContent;

	public String getUrlContent() {
		return urlContent;
	}

	public void setUrlContent(String urlContent) {
		this.urlContent = urlContent;
	}

	public QAFlag getQaFlag() {
		return qaFlag;
	}

	public void setQaFlag(QAFlag qaFlag) {
		this.qaFlag = qaFlag;
	}

	public String getId() {
		return id;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getLastModifyTime() {
		return lastModifyTime;
	}

	public void setLastModifyTime(Date lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}

	public String getExtra() {
		return extra;
	}

	public void setExtra(String extra) {
		this.extra = extra;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public QAType getQaType() {
		return qaType;
	}

	public void setQaType(QAType qaType) {
		this.qaType = qaType;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getFlagId() {
		return flagId;
	}

	public void setFlagId(String flagId) {
		this.flagId = flagId;
	}
}
