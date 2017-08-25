package com.sxsram.ssm.entity;

import com.sxsram.ssm.util.Pagination;

public class UserExpandQueryVo extends UserExpand {
	private Pagination pagination;

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
}
