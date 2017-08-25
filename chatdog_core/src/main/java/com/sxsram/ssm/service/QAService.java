package com.sxsram.ssm.service;

import java.util.List;

import com.sxsram.ssm.entity.QAEntity;
import com.sxsram.ssm.entity.QAEntityQueryVo;
import com.sxsram.ssm.entity.QAFlag;
import com.sxsram.ssm.entity.QAFlagQueryVo;
import com.sxsram.ssm.entity.QAType;
import com.sxsram.ssm.entity.QATypeQueryVo;

public interface QAService {
	Integer getQAEntityTotalNum(QAEntityQueryVo qaEntityQueryVo) throws Exception;

	List<QAEntity> getQAEntities(QAEntityQueryVo qaEntityQueryVo) throws Exception;

	QAEntity getQAEntity(QAEntityQueryVo qaEntityQueryVo) throws Exception;

	List<QAType> getQATypes(QATypeQueryVo qaTypeQueryVo) throws Exception;

	Integer getQATypesTotalNum(QATypeQueryVo qaTypeQueryVo) throws Exception;
	
	List<QAFlag> getQAFlags(QAFlagQueryVo qaFlagQueryVo) throws Exception;
	
	QAFlag getQAFlag(QAFlagQueryVo qaFlagQueryVo) throws Exception;

	Integer getQAFlagsTotalNum(QAFlagQueryVo qaFlagQueryVo) throws Exception;

	void updateQAType(QAType type) throws Exception;

	void deleteQATypeCascadeQAEntity(QAType type) throws Exception;

	void deleteQAType(QAType type) throws Exception;

	void addQAType(QAType type) throws Exception;

	void updateQAEntity(QAEntity qaEntity) throws Exception;

	void addNewQAEntity(QAEntity qaEntity) throws Exception;
}