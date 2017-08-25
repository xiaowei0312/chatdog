package com.sxsram.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sxsram.ssm.entity.OnlineCommodity;
import com.sxsram.ssm.entity.QAEntity;
import com.sxsram.ssm.entity.QAEntityQueryVo;
import com.sxsram.ssm.entity.QAFlag;
import com.sxsram.ssm.entity.QAFlagQueryVo;
import com.sxsram.ssm.entity.QAType;
import com.sxsram.ssm.entity.QATypeQueryVo;
import com.sxsram.ssm.service.QAService;
import com.sxsram.ssm.util.ConfigUtil;
import com.sxsram.ssm.util.FileUtil;
import com.sxsram.ssm.util.JsonResult;
import com.sxsram.ssm.util.MD5Util;
import com.sxsram.ssm.util.Pagination;
import com.sxsram.ssm.util.QueryCondition;
import com.sxsram.ssm.util.QueryConditionAbstractItem;
import com.sxsram.ssm.util.QueryConditionItem;
import com.sxsram.ssm.util.QueryConditionOp;
import com.sxsram.ssm.util.QueryConditionOrItems;
import com.sxsram.ssm.util.StringUtil;

@Controller()
@RequestMapping(value = "/qa", method = { RequestMethod.GET, RequestMethod.POST })
public class QAController {
	@Autowired
	private QAService qaService;

	@RequestMapping(value = "/typeManagement", method = { RequestMethod.GET, RequestMethod.POST })
	public String typeManagement() {
		return "qa/typeManagement";
	}

	@RequestMapping(value = "/qaManagement", method = { RequestMethod.GET, RequestMethod.POST })
	public String commodityManagement() {
		return "qa/qaManagement";
	}

	class PageObj {
		Integer totalCount;
		Object objList;

		public PageObj() {
		}

		public PageObj(Integer totalCount, Object objList) {
			this.totalCount = totalCount;
			this.objList = objList;
		}
	}

	@RequestMapping(value = "/getFlagListAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getFlagListAjax(HttpSession session, Model model, Integer pageNo, Integer pageSize, String searchKey,
			Integer typeSeqOrderBy) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		JsonResult jsonResult = new JsonResult("0", "0");

		List<QAFlag> qaFlags = null;
		Integer totalNum = 0;

		QAFlagQueryVo qaFlagQueryVo = new QAFlagQueryVo();
		List<QueryConditionAbstractItem> whereCondList = new ArrayList<QueryConditionAbstractItem>();
		if (!StringUtils.isEmpty(searchKey)) {
			whereCondList.add(new QueryConditionItem("name", searchKey, QueryConditionOp.LIKE));
		}
		try {
			qaFlagQueryVo.setQueryCondition(new QueryCondition(whereCondList));
			totalNum = qaService.getQAFlagsTotalNum(qaFlagQueryVo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Map<String, String> orderByMap = new HashMap<String, String>();
		if (typeSeqOrderBy != null) {
			if (typeSeqOrderBy == 0) {
				orderByMap.put("sequence", "desc");
			} else {
				orderByMap.put("sequence", "asc");
			}
		}
		try {
			qaFlagQueryVo.setPagination(new Pagination(pageSize, pageNo, 0, orderByMap));
			qaFlags = qaService.getQAFlags(qaFlagQueryVo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (totalNum == null)
			totalNum = 0;
		jsonResult.resultObj = new PageObj(totalNum, qaFlags);
		return gson.toJson(jsonResult);
	}

	@RequestMapping(value = "/getTypeListAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getTypeListAjax(HttpSession session, Model model, Integer pageNo, Integer pageSize, String searchKey,
			Integer typeSeqOrderBy) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		JsonResult jsonResult = new JsonResult("0", "0");

		List<QAType> qaTypes = null;
		Integer totalNum = 0;

		QATypeQueryVo qaTypeQueryVo = new QATypeQueryVo();
		List<QueryConditionAbstractItem> whereCondList = new ArrayList<QueryConditionAbstractItem>();
		if (!StringUtils.isEmpty(searchKey)) {
			whereCondList.add(new QueryConditionItem("name", searchKey, QueryConditionOp.LIKE));
		}
		try {
			qaTypeQueryVo.setQueryCondition(new QueryCondition(whereCondList));
			totalNum = qaService.getQATypesTotalNum(qaTypeQueryVo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Map<String, String> orderByMap = new HashMap<String, String>();
		if (typeSeqOrderBy != null) {
			if (typeSeqOrderBy == 0) {
				orderByMap.put("sequence", "desc");
			} else {
				orderByMap.put("sequence", "asc");
			}
		}
		try {
			qaTypeQueryVo.setPagination(new Pagination(pageSize, pageNo, 0, orderByMap));
			qaTypes = qaService.getQATypes(qaTypeQueryVo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (totalNum == null)
			totalNum = 0;
		jsonResult.resultObj = new PageObj(totalNum, qaTypes);
		return gson.toJson(jsonResult);
	}

	@RequestMapping(value = "/updateTypeAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String updateTypeAjax(HttpSession session, Model model, String id, Integer typeSeq, String typeName) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		JsonResult jsonResult = new JsonResult("0", "0");

		QAType type = new QAType();
		type.setId(id);
		if (!StringUtils.isEmpty(typeSeq))
			type.setSequence(typeSeq);
		if (!StringUtil.isEmpty(typeName))
			type.setName(typeName);

		try {
			qaService.updateQAType(type);
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = e.getMessage();
		}
		return gson.toJson(jsonResult);
	}

	@RequestMapping(value = "/deleteTypeAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String deleteTypeAjax(HttpSession session, Model model, String id, Integer reqType) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		JsonResult jsonResult = new JsonResult("0", "0");

		if (id == null || reqType == null || reqType < 0 || reqType > 2) {
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = "找不到reqtype，非法操作!";
			return gson.toJson(jsonResult);
		}

		QAType type = new QAType();
		type.setId(id);

		Integer totalNum = 0;
		switch (reqType) {
		case 0: // 获取类别下的商品数量
			QAEntityQueryVo qaEntityQueryVo = new QAEntityQueryVo();
			List<QueryConditionAbstractItem> items = new ArrayList<QueryConditionAbstractItem>();
			items.add(new QueryConditionItem("typeId", id + "", QueryConditionOp.EQ));
			try {
				qaEntityQueryVo.setQueryCondition(new QueryCondition(items));
				totalNum = qaService.getQAEntityTotalNum(qaEntityQueryVo);
				jsonResult.resultObj = totalNum;
			} catch (Exception e) {
				e.printStackTrace();
				jsonResult.logicCode = "-1";
				jsonResult.resultMsg = e.getMessage();
			}
			break;
		case 1: // 级联删除
			try {
				qaService.deleteQATypeCascadeQAEntity(type);
			} catch (Exception e) {
				e.printStackTrace();
				jsonResult.logicCode = "-1";
				jsonResult.resultMsg = e.getMessage();
			}
			break;
		case 2: // 级联删除
			try {
				qaService.deleteQAType(type);
			} catch (Exception e) {
				e.printStackTrace();
				jsonResult.logicCode = "-1";
				jsonResult.resultMsg = e.getMessage();
			}
			break;
		}
		return gson.toJson(jsonResult);
	}

	@RequestMapping(value = "/addTypeAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String addTypeAjax(HttpSession session, Model model, Integer typeSeq, String typeName) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		JsonResult jsonResult = new JsonResult("0", "0");

		QAType type = new QAType();
		if (!StringUtils.isEmpty(typeSeq))
			type.setSequence(typeSeq);
		if (!StringUtil.isEmpty(typeName))
			type.setName(typeName);

		try {
			qaService.addQAType(type);
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = e.getMessage();
		}
		return gson.toJson(jsonResult);
	}

	// ============================================ 商品
	// =======================================================

	@RequestMapping(value = "/getQAEntityListAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getQAEntityListAjax(HttpSession session, Model model, Integer pageNo, Integer pageSize,
			String searchKey, String searchStartDate, String searchEndDate, String statusSelect, String typeSelect,
			String flagSelect, Integer timeOrderBy) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		JsonResult jsonResult = new JsonResult("0", "0");

		List<QAEntity> qaEntities = null;
		Integer totalNum = 0;

		QAEntityQueryVo qaEntityQueryVo = new QAEntityQueryVo();
		List<QueryConditionAbstractItem> whereCondList = new ArrayList<QueryConditionAbstractItem>();
		if (!StringUtils.isEmpty(searchKey)) {
			QueryConditionOrItems queryConditionOrItems = new QueryConditionOrItems();
			queryConditionOrItems.getItems().add(new QueryConditionItem("question", searchKey, QueryConditionOp.LIKE));
			queryConditionOrItems.getItems().add(new QueryConditionItem("answer", searchKey, QueryConditionOp.LIKE));
			whereCondList.add(queryConditionOrItems);
		}

		if (!StringUtil.isEmpty(searchStartDate)) {
			String arr[] = searchStartDate.split("/");
			// Date startDate = new Date(Integer.valueOf(arr[2]),
			// Integer.valueOf(arr[0]), Integer.valueOf(arr[1]));
			String startDate = arr[2] + "-" + arr[0] + "-" + arr[1];
			whereCondList.add(new QueryConditionItem("lastModifyTime", startDate.toString(), QueryConditionOp.GE));
		}

		if (!StringUtil.isEmpty(searchEndDate)) {
			String arr[] = searchEndDate.split("/");
			// Date endDate = new Date(Integer.valueOf(arr[2]),
			// Integer.valueOf(arr[0]), Integer.valueOf(arr[1]));
			String endDate = arr[2] + "-" + arr[0] + "-" + arr[1];
			whereCondList.add(new QueryConditionItem("lastModifyTime", endDate.toString(), QueryConditionOp.LE));
		}

		if (!StringUtil.isEmpty(statusSelect) && !statusSelect.equals("-2")) {
			whereCondList.add(new QueryConditionItem("status", statusSelect, QueryConditionOp.EQ));
		}

		if (!StringUtil.isEmpty(typeSelect) && !typeSelect.equals("-2")) {
			whereCondList.add(new QueryConditionItem("typeId", typeSelect, QueryConditionOp.EQ));
		}

		if (!StringUtil.isEmpty(flagSelect) && !flagSelect.equals("-2")) {
			whereCondList.add(new QueryConditionItem("flagId", flagSelect, QueryConditionOp.EQ));
		}

		try {
			qaEntityQueryVo.setQueryCondition(new QueryCondition(whereCondList));
			totalNum = qaService.getQAEntityTotalNum(qaEntityQueryVo);
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = e.getMessage();
			return gson.toJson(jsonResult);
		}

		Map<String, String> orderByMap = new HashMap<String, String>();
		// if (orderAmountOrderBy != null) {
		// if (orderAmountOrderBy == 0) {
		// orderByMap.put("totalAmount", "desc");
		// } else {
		// orderByMap.put("totalAmount", "asc");
		// }
		// }
		//
		if (timeOrderBy != null) {
			if (timeOrderBy == 0) {
				orderByMap.put("lastModifyTime", "desc");
			} else {
				orderByMap.put("lastModifyTime", "asc");
			}
		}
		try {
			qaEntityQueryVo.setPagination(new Pagination(pageSize, pageNo, 0, orderByMap));
			qaEntities = qaService.getQAEntities(qaEntityQueryVo);
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = e.getMessage();
			return gson.toJson(jsonResult);
		}

		if (totalNum == null)
			totalNum = 0;
		jsonResult.resultObj = new PageObj(totalNum, qaEntities);
		return gson.toJson(jsonResult);
	}

	private String uploadImg(MultipartFile img) throws IllegalStateException, IOException {
		String orginalFilename = img.getOriginalFilename();
		String imgPath = ConfigUtil.QASUBJECTPICPATH;
		String filename = UUID.randomUUID() + orginalFilename.substring(orginalFilename.lastIndexOf('.'));
		File newFile = new File(imgPath + filename);
		img.transferTo(newFile);
		return filename;
	}

	@RequestMapping(value = "/updateQAEntityAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String updateQAEntityAjax(HttpSession session, Model model, String id, String question, String answer,
			String url, String picUrl, String flagId, String typeId, String status, String extra, MultipartFile img) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		JsonResult jsonResult = new JsonResult("0", "0");

		if (id == null) {
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = "找不到id，非法操作!";
			return gson.toJson(jsonResult);
		}

		QAEntity onlineCommodity = new QAEntity();
		onlineCommodity.setId(id);
		if (!StringUtils.isEmpty(question))
			onlineCommodity.setQuestion(question);
		if (!StringUtil.isEmpty(answer))
			onlineCommodity.setAnswer(answer);
		if (!StringUtil.isEmpty(url))
			onlineCommodity.setUrl(url);
		if (!StringUtil.isEmpty(picUrl))
			onlineCommodity.setPicUrl(picUrl);
		if (!StringUtil.isEmpty(flagId))
			onlineCommodity.setFlagId(flagId);
		if (!StringUtil.isEmpty(typeId))
			onlineCommodity.setTypeId(typeId);
		if (!StringUtil.isEmpty(status)) {
			onlineCommodity.setStatus(Integer.valueOf(status));
		}
		String newImg = "";
		if (img != null) {
			String originalFilename = img.getOriginalFilename();
			if (originalFilename == null || originalFilename.length() == 0) {
				newImg = null;
			} else {
				if (!originalFilename.endsWith(".jpg") && !originalFilename.endsWith(".jpeg")
						&& !originalFilename.endsWith(".png")) {
					jsonResult.logicCode = "-1";
					jsonResult.resultMsg = "不支持的文件类型，仅支持.jpg(.jpeg)和.png";
					return gson.toJson(jsonResult);
				}
				try {
					newImg = uploadImg(img);
				} catch (Exception e) {
					e.printStackTrace();
					jsonResult.logicCode = "-1";
					jsonResult.resultMsg = e.getMessage();
					return gson.toJson(jsonResult);
				}
			}
		}
		if (newImg != null) {
			onlineCommodity.setPicUrl(newImg);
		}

		try {
			qaService.updateQAEntity(onlineCommodity);
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = e.getMessage();
		}
		return gson.toJson(jsonResult);
	}

	@RequestMapping(value = "/deleteQAEntityAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String deleteQAEntityAjax(HttpSession session, Model model, String id) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		JsonResult jsonResult = new JsonResult("0", "0");

		if (id == null) {
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = "找不到id，非法操作!";
			return gson.toJson(jsonResult);
		}

		QAEntity commodity = new QAEntity();
		commodity.setId(id);
		commodity.setStatus(2);
		try {
			qaService.updateQAEntity(commodity);
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = e.getMessage();
		}
		return gson.toJson(jsonResult);
	}

	@RequestMapping(value = "/addQAEntityAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String addCommodityAjax(HttpSession session, Model model, String question, String answer, String typeId,
			String url, String picUrl, String flagId, String extra, MultipartFile img) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		JsonResult jsonResult = new JsonResult("0", "0");

		QAEntity qaEntity = new QAEntity();
		if (!StringUtils.isEmpty(question))
			qaEntity.setQuestion(question);
		if (!StringUtil.isEmpty(answer))
			qaEntity.setAnswer(answer);
		if (!StringUtil.isEmpty(url))
			qaEntity.setUrl(url);
		if (!StringUtil.isEmpty(picUrl))
			qaEntity.setPicUrl(picUrl);
		if (!StringUtil.isEmpty(flagId))
			qaEntity.setFlagId(flagId);
		if (!StringUtil.isEmpty(typeId))
			qaEntity.setTypeId(typeId);
		qaEntity.setStatus(0);
		qaEntity.setLastModifyTime(new Date());

		String newImg = "";
		if (img != null) {
			String originalFilename = img.getOriginalFilename();
			if (originalFilename == null || originalFilename.length() == 0) {
				newImg = null;
			} else {
				if (!originalFilename.endsWith(".jpg") && !originalFilename.endsWith(".jpeg")
						&& !originalFilename.endsWith(".png")) {
					jsonResult.logicCode = "-1";
					jsonResult.resultMsg = "不支持的文件类型，仅支持.jpg(.jpeg)和.png";
					return gson.toJson(jsonResult);
				}
				try {
					newImg = uploadImg(img);
				} catch (Exception e) {
					e.printStackTrace();
					jsonResult.logicCode = "-1";
					jsonResult.resultMsg = e.getMessage();
					return gson.toJson(jsonResult);
				}
			}
		}
		if (newImg != null) {
			qaEntity.setPicUrl(newImg);
		}
		try {
			qaService.addNewQAEntity(qaEntity);
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = e.getMessage();
		}
		return gson.toJson(jsonResult);
	}

	@RequestMapping(value = "/loadQAEntityUrlContent", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String loadQAEntityUrlContent(String url) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		JsonResult jsonResult = new JsonResult("0", "0");

		try {
			String content = "";
			if (!StringUtil.isEmpty(url.trim()))
				content = FileUtil.readFileContent(ConfigUtil.QALINKCONTENTPATH + url);
			jsonResult.resultMsg = content;
		} catch (Exception e) {
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = e.getMessage();
		}
		return gson.toJson(jsonResult);
	}

	@RequestMapping(value = "/updateQAEntityDetailAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String updateCommodityDetailAjax(String id, String editor1) {
		Gson gson = new Gson();
		JsonResult jsonResult = new JsonResult("0", "0");
		try {
			QAEntity qaEntity = new QAEntity();
			if (StringUtil.isEmpty(id)) {
				jsonResult.logicCode = "-1";
				jsonResult.resultMsg = "Can't find id";
				return gson.toJson(jsonResult);
			}
			String filename = UUID.randomUUID().toString().replaceAll("-", "") + ".html";
			String newFile = ConfigUtil.QALINKCONTENTPATH + filename;
			FileUtil.writeContentToFile(editor1.trim(), newFile);
			qaEntity.setId(id);
			qaEntity.setUrl(filename);
			qaService.updateQAEntity(qaEntity);
		} catch (Exception e) {
			// e.printStackTrace();
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = e.getMessage();
		}
		return gson.toJson(jsonResult);
	}
}