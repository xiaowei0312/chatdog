package com.sxsram.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sxsram.ssm.entity.QAEntity;
import com.sxsram.ssm.entity.QAEntityQueryVo;
import com.sxsram.ssm.entity.QAFlag;
import com.sxsram.ssm.entity.QAFlagQueryVo;
import com.sxsram.ssm.entity.QAType;
import com.sxsram.ssm.entity.QATypeQueryVo;
import com.sxsram.ssm.mapper.QAMapper;
import com.sxsram.ssm.service.QAService;

@Service("qaService")
public class QAServiceImpl implements QAService {
	@Autowired
	private QAMapper qaMapper;

	@Override
	public Integer getQAEntityTotalNum(QAEntityQueryVo qaEntityQueryVo) throws Exception {
		return qaMapper.queryQAEntityTotalNum(qaEntityQueryVo);
	}

	@Override
	public List<QAEntity> getQAEntities(QAEntityQueryVo qaEntityQueryVo) throws Exception {
		return qaMapper.queryMultiQAEntities(qaEntityQueryVo);
	}

	@Override
	public List<QAType> getQATypes(QATypeQueryVo qaTypeQueryVo) throws Exception {
		return qaMapper.queryMultiQATypes(qaTypeQueryVo);
	}

	@Override
	public Integer getQATypesTotalNum(QATypeQueryVo qaTypeQueryVo) throws Exception {
		return qaMapper.queryQATypesTotalNum(qaTypeQueryVo);
	}

	@Override
	public void updateQAType(QAType type) throws Exception {
		qaMapper.updateQAType(type);
	}

	@Override
	public void deleteQATypeCascadeQAEntity(QAType type) throws Exception {

	}

	@Override
	public void deleteQAType(QAType type) throws Exception {
		qaMapper.deleteQAType(type);
	}

	@Override
	public void addQAType(QAType type) throws Exception {
		qaMapper.insertNewQAType(type);
	}

	@Override
	public void updateQAEntity(QAEntity qaEntity) throws Exception {
		qaMapper.updateQAEntity(qaEntity);
	}

	@Override
	public void addNewQAEntity(QAEntity qaEntity) throws Exception {
		qaMapper.insertNewQAEntity(qaEntity);
	}

	@Override
	public QAEntity getQAEntity(QAEntityQueryVo qaEntityQueryVo) throws Exception {
		return qaMapper.querySingleQAEntity(qaEntityQueryVo);
	}

	@Override
	public List<QAFlag> getQAFlags(QAFlagQueryVo qaFlagQueryVo) throws Exception {
		return qaMapper.queryMultiQAFlags(qaFlagQueryVo);
	}

	@Override
	public QAFlag getQAFlag(QAFlagQueryVo qaFlagQueryVo) throws Exception {
		return qaMapper.querySingleQAFlags(qaFlagQueryVo);
	}

	@Override
	public Integer getQAFlagsTotalNum(QAFlagQueryVo qaFlagQueryVo) throws Exception {
		return qaMapper.queryQAFlagsTotalNum(qaFlagQueryVo);
	}
}
