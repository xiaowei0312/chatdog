package com.sxsram.ssm.mapper;

import java.util.List;

import com.sxsram.ssm.entity.JournalBookExpand;

public interface SubmitOrderMapper {

	List<JournalBookExpand> queryAllJournalBooks() throws Exception;
	List<JournalBookExpand> queryAllJournalBooksByProxyId(Integer id) throws Exception;

	void updateJournalBookFlag(JournalBookExpand journalBookExpand) throws Exception;

	List<JournalBookExpand> queryAllUnVerifyJournalBookRecords() throws Exception;
	List<JournalBookExpand> queryAllUnVerifyJournalBookRecordsByProxyId(Integer id) throws Exception;
}
