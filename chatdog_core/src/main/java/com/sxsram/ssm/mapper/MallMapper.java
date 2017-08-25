package com.sxsram.ssm.mapper;

import java.util.List;

import com.sxsram.ssm.entity.ShoppingMallExpand;

public interface MallMapper {

	List<ShoppingMallExpand> queryAllMallsByProxyId(int id) throws Exception;

	List<ShoppingMallExpand> queryAllMalls()throws Exception;

	boolean updateMall(ShoppingMallExpand mallExpand)throws Exception;
	
	boolean addNewMall(ShoppingMallExpand mallExpand) throws Exception;
}
