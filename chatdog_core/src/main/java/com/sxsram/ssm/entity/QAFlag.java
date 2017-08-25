package com.sxsram.ssm.entity;

public class QAFlag {
	private String id;
	private Integer flagNo;
	private String name;
	private int sequence;
	private String extra;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getFlagNo() {
		return flagNo;
	}

	public void setFlagNo(Integer flagNo) {
		this.flagNo = flagNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	public String getExtra() {
		return extra;
	}

	public void setExtra(String extra) {
		this.extra = extra;
	}

}