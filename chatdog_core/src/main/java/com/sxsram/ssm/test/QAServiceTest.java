package com.sxsram.ssm.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.sxsram.ssm.entity.QAEntity;
import com.sxsram.ssm.entity.QAEntityQueryVo;
import com.sxsram.ssm.service.QAService;
import com.sxsram.ssm.util.QueryCondition;
import com.sxsram.ssm.util.QueryConditionAbstractItem;
import com.sxsram.ssm.util.QueryConditionItem;
import com.sxsram.ssm.util.QueryConditionOp;


public class QAServiceTest {
	private ApplicationContext ctx = null;
	{
		ctx = new ClassPathXmlApplicationContext("classpath:spring/springmvc-junit.xml");
	}

	@Test
	public void testQaService() throws Exception {
		QAService qaService = ctx.getBean(QAService.class);
		
		String content = "abcdefg";
		QAEntityQueryVo qaEntityQueryVo = new QAEntityQueryVo();
		List<QueryConditionAbstractItem> items = new ArrayList<QueryConditionAbstractItem>();
		items.add(new QueryConditionItem("question", content, QueryConditionOp.LIKE));
		qaEntityQueryVo.setQueryCondition(new QueryCondition(items));
		qaEntityQueryVo.setPagination(null);
		QAEntity qaEntity = qaService.getQAEntity(qaEntityQueryVo);
		String answer = null;
		if (qaEntity == null) {
			answer = content;
		} else {
			answer = qaEntity.getAnswer();
		}
		System.out.println(answer);
	}
	
	@Test
	public void testQaService_queryMultiQAFlags() throws Exception {
		QAService qaService = ctx.getBean(QAService.class);
		
		String content = "abcdefg";
		QAEntityQueryVo qaEntityQueryVo = new QAEntityQueryVo();
		List<QueryConditionAbstractItem> items = new ArrayList<QueryConditionAbstractItem>();
		items.add(new QueryConditionItem("question", content, QueryConditionOp.LIKE));
		qaEntityQueryVo.setQueryCondition(new QueryCondition(items));
		qaEntityQueryVo.setPagination(null);
		QAEntity qaEntity = qaService.getQAEntity(qaEntityQueryVo);
		String answer = null;
		if (qaEntity == null) {
			answer = content;
		} else {
			answer = qaEntity.getAnswer();
		}
		System.out.println(answer);
	}
}
