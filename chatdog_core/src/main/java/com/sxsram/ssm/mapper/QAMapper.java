package com.sxsram.ssm.mapper;

import java.util.List;

import com.sxsram.ssm.entity.QAEntity;
import com.sxsram.ssm.entity.QAEntityQueryVo;
import com.sxsram.ssm.entity.QAFlag;
import com.sxsram.ssm.entity.QAFlagQueryVo;
import com.sxsram.ssm.entity.QAType;
import com.sxsram.ssm.entity.QATypeQueryVo;

public interface QAMapper {

	Integer queryQAEntityTotalNum(QAEntityQueryVo qaEntityQueryVo) throws Exception;

	QAEntity querySingleQAEntity(QAEntityQueryVo qaEntityQueryVo) throws Exception;

	List<QAEntity> queryMultiQAEntities(QAEntityQueryVo qaEntityQueryVo) throws Exception;

	/**
	 * Commodity Types Operation
	 * 
	 * @param onLineCommodityTypeQueryVo
	 * @return
	 * @throws Exception
	 */
	List<QAType> queryMultiQATypes(QATypeQueryVo qaTypeQueryVo) throws Exception;

	QAType querySingleQATypes(QATypeQueryVo qaTypeQueryVo) throws Exception;

	Integer queryQATypesTotalNum(QATypeQueryVo qaTypeQueryVo) throws Exception;

	void updateQAType(QAType type) throws Exception;

	void deleteQAType(QAType type) throws Exception;

	void insertNewQAType(QAType type) throws Exception;

	void updateQAEntity(QAEntity qaEntity) throws Exception;

	void insertNewQAEntity(QAEntity qaEntity) throws Exception;

	/**
	 * QAFlag Operation
	 */
	List<QAFlag> queryMultiQAFlags(QAFlagQueryVo qaFlagQueryVo) throws Exception;

	QAFlag querySingleQAFlags(QAFlagQueryVo qaFlagQueryVo) throws Exception;

	Integer queryQAFlagsTotalNum(QAFlagQueryVo qaFlagQueryVo) throws Exception;
}
