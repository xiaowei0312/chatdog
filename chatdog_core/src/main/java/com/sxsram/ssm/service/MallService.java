package com.sxsram.ssm.service;

import java.util.List;

import com.sxsram.ssm.entity.ShoppingMallExpand;

public interface MallService {
	List<ShoppingMallExpand> findAllMallsByProxyId(int id);
	List<ShoppingMallExpand> findAllMalls();
	boolean updateMall(ShoppingMallExpand mallExpand);
	boolean addNewMall(ShoppingMallExpand mallExpand);
	boolean deleteMall(ShoppingMallExpand mallExpand);
}
