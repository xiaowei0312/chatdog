package com.sxsram.ssm.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sxsram.ssm.entity.JournalBookExpand;
import com.sxsram.ssm.entity.Role;
import com.sxsram.ssm.entity.UserExpand;
import com.sxsram.ssm.service.MemberService;
import com.sxsram.ssm.service.SubmitOrderService;
import com.sxsram.ssm.service.UserService;
import com.sxsram.ssm.util.ConfigUtil;
import com.sxsram.ssm.util.JsonResult;

@Controller()
@RequestMapping(value = "/user", method = { RequestMethod.GET, RequestMethod.POST })
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SubmitOrderService submitOrderService;

	@RequestMapping(value = "/main", method = { RequestMethod.GET, RequestMethod.POST })
	public String userCenter(HttpSession session, Model model, String code, String state) throws Exception {
		return "user/main";
	}

	@RequestMapping(value = "/loginPage", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginPage() throws Exception {
		return "user/login";
	}

	@RequestMapping(value = "/logOut", method = { RequestMethod.GET, RequestMethod.POST })
	public String logOut(HttpSession session) throws Exception {
		session.removeAttribute("user");
		return "user/login";
	}

	// 创建颜色
	Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	@RequestMapping(value = "/imgVerifyCodeAjax")
	public void getImageVerifyCode(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		int width = 63;
		int height = 37;
		Random random = new Random();
		// 设置response头信息
		// 禁止缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		// 生成缓冲区image类
		BufferedImage image = new BufferedImage(width, height, 1);
		// 产生image类的Graphics用于绘制操作
		Graphics g = image.getGraphics();
		// Graphics类的样式
		g.setColor(this.getRandColor(200, 250));
		g.setFont(new Font("Times New Roman", 0, 28));
		g.fillRect(0, 0, width, height);
		// 绘制干扰线
		for (int i = 0; i < 40; i++) {
			g.setColor(this.getRandColor(130, 200));
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int x1 = random.nextInt(12);
			int y1 = random.nextInt(12);
			g.drawLine(x, y, x + x1, y + y1);
		}

		// 绘制字符
		String strCode = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			strCode = strCode + rand;
			g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
			g.drawString(rand, 13 * i + 6, 28);
		}
		// 将字符保存到session中用于前端的验证
		session.setAttribute("imageVerifyCode", strCode);
		g.dispose();

		ImageIO.write(image, "JPEG", response.getOutputStream());
		response.getOutputStream().flush();
	}

	@RequestMapping(value = "/changePwd", method = { RequestMethod.GET, RequestMethod.POST })
	public String changePwd(HttpSession session, HttpServletRequest request, Model model, String oldPwd, String newPwd,
			String imgVerifyCode) {
		return "user/changePwd";
	}
	
	@RequestMapping(value = "/changePwdValidate1", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String changePwdValidate1(HttpSession session, Model model, String oldPwd) {
		JsonResult jsonResult = new JsonResult("0", "0");
		Gson gson = new Gson();
		UserExpand userExpand = (UserExpand) session.getAttribute("user");
		userExpand.setPassword(oldPwd);
		UserExpand user = null;
		try {
			user = memberService.findUserWhenLogin(userExpand);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (user == null) {
			jsonResult.logicCode = "1";
			jsonResult.resultMsg = "原始密码不正确";
		}
		return gson.toJson(jsonResult);
	}

	@RequestMapping(value = "/changePwdValidate2", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String changePwdValidate2(HttpSession session, HttpServletRequest request, Model model, String oldPwd,
			String newPwd, String imgVerifyCode) {
		JsonResult jsonResult = new JsonResult("0", "0");
		Gson gson = new Gson();

		// 1.判断验证码是否正确
		String savedImgCode = (String) session.getAttribute("imageVerifyCode");
		if (savedImgCode == null || !savedImgCode.equals(imgVerifyCode)) {
			jsonResult.logicCode = "-1";
			jsonResult.resultMsg = "验证码不正确";
			return gson.toJson(jsonResult);
		}

		// 2.判断原始密码是否正确
		UserExpand userExpand = (UserExpand) session.getAttribute("user");
		userExpand.setPassword(oldPwd);
		UserExpand user = null;
		try {
			user = memberService.findUserWhenLogin(userExpand);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (user == null) {
			jsonResult.logicCode = "1";
			jsonResult.resultMsg = "原始密码不正确";
			return gson.toJson(jsonResult);
		}

		// 3.修改密码
		UserExpand newUser = new UserExpand();
		newUser.setId(userExpand.getId());
		newUser.setPassword(newPwd);
		try {
			memberService.updateUser(newUser);
			session.removeAttribute("user");
		} catch (Exception e) {
			e.printStackTrace();
		}
		jsonResult.url = request.getContextPath() + "/user/loginPage.action";
		return gson.toJson(jsonResult);
	}

	@RequestMapping(value = "/loginSubmitAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String loginSubmit(HttpServletRequest request, HttpSession session, Model model, UserExpand inputUser,
			String verifyCode) throws Exception {
		Gson gson = new Gson();

		// // 1.检查验证码是否正确
		// String currentVerifyCode = (String)
		// session.getAttribute("imageVerifyCode");
		// if (verifyCode == null || currentVerifyCode == null ||
		// !verifyCode.equals(currentVerifyCode))
		// return gson.toJson(new JsonResult("0", "1", "验证码不正确"));

		// 2.检查用户名(电话) 密码是否正确
		UserExpand user = userService.findUserWhenLogin(inputUser);
		if (user == null) {
			return gson.toJson(new JsonResult("0", "1", "用户名或密码错误"));
		}

		// 3.检查用户是否有登录权限
		if (user.getRole().getPermissionExpandList() == null || user.getRole().getPermissionExpandList().size() == 0) {
			return gson.toJson(new JsonResult("0", "1", "您无权访问本系统"));
		}

		session.setAttribute("user", user);
		// 获取被拦截器拦截的请求页面
		String url = (String) session.getAttribute("loginInterceptedReqUrl");
		if (url == null)
			url = request.getContextPath() + "/user/main.action";
		session.removeAttribute("loginInterceptedReqUrl");
		return gson.toJson(new JsonResult("0", "0", null, null, url));
	}

	@RequestMapping(value = "/systemOverview", method = { RequestMethod.GET, RequestMethod.POST })
	public String xtgk() throws Exception {
		return "user/systemOverview";
	}

	@RequestMapping(value = "/settingCenter", method = { RequestMethod.GET, RequestMethod.POST })
	public String pzzx() throws Exception {
		return "user/settingCenter";
	}

	@RequestMapping(value = "/roleManagement", method = { RequestMethod.GET, RequestMethod.POST })
	public String roleManagement() throws Exception {
		return "user/roleManagement";
	}

	@RequestMapping(value = "/permManagement", method = { RequestMethod.GET, RequestMethod.POST })
	public String permManagement() throws Exception {
		return "user/permManagement";
	}

	@RequestMapping(value = "/userGrantPermission", method = { RequestMethod.GET, RequestMethod.POST })
	public String userGrantPermission() throws Exception {
		return "user/userGrantPermission";
	}

	@RequestMapping(value = "/smsAccount", method = { RequestMethod.GET, RequestMethod.POST })
	public String smsAccount() throws Exception {
		return "user/smsAccount";
	}

	@RequestMapping(value = "/smsStatics", method = { RequestMethod.GET, RequestMethod.POST })
	public String smsStatics() throws Exception {
		return "user/smsStatics";
	}

	@RequestMapping(value = "/userOverview", method = { RequestMethod.GET, RequestMethod.POST })
	public String userOverview(Model model) throws Exception {
		List<UserExpand> userExpands = userService.findAllUsers();
		model.addAttribute("userList", userExpands);
		return "user/userOverview";
	}

	@RequestMapping(value = "/proxyManagement", method = { RequestMethod.GET, RequestMethod.POST })
	public String proxyManagement(Model model) throws Exception {
		List<UserExpand> userExpands = userService.findAllProxyUsers();
		model.addAttribute("userList", userExpands);
		return "user/proxyManagement";
	}

	@RequestMapping(value = "/sellerManagement", method = { RequestMethod.GET, RequestMethod.POST })
	public String sellerManagement(Model model, HttpSession session) throws Exception {
		UserExpand sessionUser = (UserExpand) session.getAttribute("user");

		List<UserExpand> userExpands = null;
		if (sessionUser.getRole().getRoleName().equals("管理员")) {
			userExpands = userService.findAllSeller();
		} else {
			userExpands = userService.findAllSellersByProxyId(sessionUser.getId());
		}
		model.addAttribute("userList", userExpands);
		return "user/sellerManagement";
	}

	@RequestMapping(value = "/managerManagement", method = { RequestMethod.GET, RequestMethod.POST })
	public String managerManagement(Model model) throws Exception {
		List<UserExpand> userExpands = userService.findAllManagers();
		model.addAttribute("userList", userExpands);
		return "user/managerManagement";
	}

	@RequestMapping(value = "/addNewUserAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String addNewUser(UserExpand userExpand) throws Exception {
		Gson gson = new Gson();
		if (userExpand == null) {
			return gson.toJson(new JsonResult("0", "-1", "没有找到任何要添加的数据"));
		}
		// 1.检查用户名
		String username = userExpand.getUsername();
		if (username == null || username.equals("") || !username.matches("^[a-zA-z]{1}[A-Za-z0-9_]{5,15}$")) {
			return gson.toJson(new JsonResult("0", "-1", "服务器消息: 用户名必须以字母开头并且长度在6-16位之间"));
		}
		// 判断用户名是否存在
		if (userService.usernameExist(username)) {
			return gson.toJson(new JsonResult("0", "-1", "用户名已经被注册"));
		}

		// 2.检查手机是否存在
		String phone = userExpand.getPhone();
		if (phone == null || phone.equals("") || !phone.matches("^0?(13|15|18|14|17)[0-9]{9}$")) {
			return gson.toJson(new JsonResult("0", "-1", "服务器消息: 请输入正确的手机号码"));
		}
		// 判断电话号码是否存在
		if (userService.phoneExist(phone)) {
			return gson.toJson(new JsonResult("0", "-1", "手机号已被注册"));
		}

		// 3.检查代理用户是否存在
		if (userExpand.getProxyUser() != null) {
			String keywords = userExpand.getProxyUser().getKeywords();
			if (keywords != null && keywords.length() > 0) {
				UserExpand proxyUser = userService.findUserByKeyWords(keywords);
				if (proxyUser == null) {
					return gson.toJson(new JsonResult("0", "-1", "代理商不存在"));
				}
				userExpand.setProxyUser(proxyUser);
			} else {
				userExpand.setProxyUser(null);
			}
		}

		// 4.密码判断
		if (userExpand.getPassword() == null || userExpand.getPassword().length() == 0)
			userExpand.setPassword(ConfigUtil.RESETPWD);

		// 5.插入数据库
		boolean b = userService.registUser(userExpand);
		if (b) {
			return gson.toJson(new JsonResult("0", "0", null, null, null));
		}
		return gson.toJson(new JsonResult("0", "-1", "添加用户失败：Unknown Reason", null, null));
	}

	@RequestMapping(value = "/getAllRoles", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String getAllRoles(UserExpand userExpand) throws Exception {
		Gson gson = new Gson();
		List<Role> roles = userService.findAllRoles();
		return gson.toJson(roles);
	}

	@RequestMapping(value = "/updateUserAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String updateUser(UserExpand userExpand, String proxy) throws Exception {
		Gson gson = new Gson();
		if (userExpand == null) {
			return gson.toJson(new JsonResult("0", "-1", "找不到任何更新数据."));
		}

		// 1.检查用户名
		String username = userExpand.getUsername();
		// if (username == null || username.equals("") ||
		// !username.matches("^[a-zA-z]{1}[A-Za-z0-9_]{5,15}$")) {
		// return gson.toJson(new JsonResult("0", "-1",
		// "服务器消息:用户名必须以字母开头并且长度在6-16位之间"));
		// }
		// 判断用户名是否存在
		if (username != null) {
			if (!userService.usernameExist(username)) {
				return gson.toJson(new JsonResult("0", "-1", "用户名不存在，请勿恶意访问."));
			}
		}

		// 2.检查手机是否存在
		String phone = userExpand.getPhone();
		// if (phone == null || phone.equals("") ||
		// !phone.matches("^0?(13|15|18|14|17)[0-9]{9}$")) {
		// return gson.toJson(new JsonResult("0", "-1", "服务器消息: 请输入正确的手机号码"));
		// }
		// 判断电话号码是否存在

		if (phone != null) {
			if (!userService.phoneExist(phone)) {
				return gson.toJson(new JsonResult("0", "-1", "手机号不存在，请勿恶意访问."));
			}
		}

		Integer id = userExpand.getId();
		if (id == null && username == null && phone == null) {
			return gson.toJson(new JsonResult("0", "-1", "至少提供id、usernmae、phone其中一种作为更新依据"));
		}

		if (userExpand.getProxyUser() != null) {
			String keywords = userExpand.getProxyUser().getKeywords();
			if (keywords != null && keywords.length() > 0) {
				UserExpand proxyUser = userService.findUserByKeyWords(keywords);
				if (proxyUser == null) {
					return gson.toJson(new JsonResult("0", "-1", "代理商不存在"));
				}
				userExpand.setProxyUser(proxyUser);
			} else {
				userExpand.setProxyUser(null);
			}
		}

		// 3.-1检查
		String province, city, area;
		province = userExpand.getProvince();
		city = userExpand.getCity();
		area = userExpand.getArea();
		if (userExpand.getRole() != null) {
			Integer roleId = userExpand.getRole().getId();
			if (roleId != null && roleId == -1)
				userExpand.getRole().setId(null);
		}
		if (province != null && province.equals("-1"))
			userExpand.setProvince(null);
		if (city != null && city.equals("-1"))
			userExpand.setCity(null);
		if (area != null && area.equals("-1"))
			userExpand.setArea(null);

		// 3.插入数据库
		boolean b = userService.updateUser(userExpand);
		if (b) {
			return gson.toJson(new JsonResult("0", "0", null, null, null));
		}
		return gson.toJson(new JsonResult("0", "-1", "更新用户失败：Unknown Reason", null, null));
	}

	@RequestMapping(value = "/deleteUserAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String deleteUser(UserExpand userExpand) throws Exception {
		Gson gson = new Gson();
		// 3.插入数据库
		boolean b = userService.deleteUser(userExpand);
		if (b) {
			return gson.toJson(new JsonResult("0", "0", null, null, null));
		}
		return gson.toJson(new JsonResult("0", "-1", "删除用户失败：Unknown Reason", null, null));
	}

	@RequestMapping(value = "/resetUserPwdAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String resetUserPwd(UserExpand userExpand) throws Exception {
		Gson gson = new Gson();
		userExpand.setPassword(ConfigUtil.RESETPWD);
		// 3.插入数据库
		boolean b = userService.resetUserPwd(userExpand);
		if (b) {
			return gson.toJson(new JsonResult("0", "0", null, null, null));
		}
		return gson.toJson(new JsonResult("0", "-1", "重置密码失败：Unknown Reason", null, null));
	}

	@RequestMapping(value = "/userStatics", method = { RequestMethod.GET, RequestMethod.POST })
	public String userStatics() throws Exception {
		return "user/userStatics";
	}

	private List<JournalBookExpand> getJournalBookExpandListByUser(UserExpand sessionUser) {
		List<JournalBookExpand> journalBookExpands = null;
		if (sessionUser.getRole().getRoleName().equals("管理员")) {
			journalBookExpands = submitOrderService.findAllJournalBooks();
		} else if (sessionUser.getRole().getRoleName().equals("代理商")) {
			journalBookExpands = submitOrderService.findAllJournalBooksByProxyId(sessionUser.getId());
		}
		return journalBookExpands;
	}

	@RequestMapping(value = "/submitOrderOverview", method = { RequestMethod.GET, RequestMethod.POST })
	public String submitOrderOverview(Model model, HttpSession session) throws Exception {
		UserExpand sessionUser = (UserExpand) session.getAttribute("user");
		List<JournalBookExpand> journalBookExpands = getJournalBookExpandListByUser(sessionUser);
		model.addAttribute("journalBookList", journalBookExpands);
		return "user/submitOrderOverview";
	}

	@RequestMapping(value = "/submitOrderExportExcel", method = { RequestMethod.GET, RequestMethod.POST })
	public void submitOrderExportExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("state", null);
		// 生成提示信息，
		response.setContentType("application/vnd.ms-excel");
		String codedFileName = null;
		OutputStream fOut = null;
		try {
			// 进行转码，使其支持中文文件名
			DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			codedFileName = java.net.URLEncoder.encode("报单记录_" + dateFormat.format(new Date()), "UTF-8");
			response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");
			// response.addHeader("Content-Disposition", "attachment;
			// filename=" + codedFileName + ".xls");
			// 产生工作簿对象
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 产生工作表对象
			HSSFSheet sheet = workbook.createSheet();

			// 生成数据
			UserExpand sessionUser = (UserExpand) session.getAttribute("user");
			List<JournalBookExpand> journalBookExpands = getJournalBookExpandListByUser(sessionUser);
			for (int i = 0; i < journalBookExpands.size(); i++) {
				HSSFRow row = sheet.createRow((int) i);// 创建一行
				HSSFCell cell1 = row.createCell((short) 0);// 创建一列
				HSSFCell cell2 = row.createCell((short) 1);// 创建一列
				HSSFCell cell3 = row.createCell((short) 2);// 创建一列
				HSSFCell cell4 = row.createCell((short) 3);// 创建一列
				HSSFCell cell5 = row.createCell((short) 4);// 创建一列
				HSSFCell cell6 = row.createCell((short) 5);// 创建一列
				HSSFCell cell7 = row.createCell((short) 6);// 创建一列
				HSSFCell cell8 = row.createCell((short) 7);// 创建一列
				HSSFCell cell9 = row.createCell((short) 8);// 创建一列
				cell1.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell2.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell4.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell5.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell6.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell7.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell8.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell9.setCellType(HSSFCell.CELL_TYPE_STRING);

				if (i == 0) {// 表头
					cell1.setCellValue("商家信息");
					cell2.setCellValue("买家信息");
					cell3.setCellValue("商品名称");
					cell4.setCellValue("金额");
					cell5.setCellValue("优惠率");
					cell6.setCellValue("客户积分");
					cell7.setCellValue("商户积分");
					cell8.setCellValue("报单时间");
					cell9.setCellValue("状态");
				} else {
					JournalBookExpand journalBookExpand = journalBookExpands.get(i);
					cell1.setCellValue(journalBookExpand.getBusiness().getUsername());
					cell2.setCellValue(journalBookExpand.getClient().getUsername());
					cell3.setCellValue(journalBookExpand.getCommodityName());
					cell4.setCellValue(journalBookExpand.getAmount());
					cell5.setCellValue(journalBookExpand.getPremiumRates());
					cell6.setCellValue(journalBookExpand.getGiftJf());
					cell7.setCellValue(journalBookExpand.getRewardJf());
					dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
					cell8.setCellValue(dateFormat.format(journalBookExpand.getJournalTime()));
					switch (journalBookExpand.getFlag()) {
					case 0:
						cell9.setCellValue("待审核");
						break;
					case 1:
						cell9.setCellValue("已同意");
						break;
					case 2:
						cell9.setCellValue("已奖励");
						break;
					case 3:
						cell9.setCellValue("已拒绝");
						break;
					}
				}
			}
			fOut = response.getOutputStream();
			workbook.write(fOut);
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fOut.flush();
				fOut.close();
			} catch (IOException e) {
			}
			session.setAttribute("state", "open");
		}
		System.out.println("文件生成...");
	}

	@RequestMapping(value = "/submitOrderVerifySubmitAjax", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String submitOrderVerifySubmit(Model model, JournalBookExpand journalBookExpand) throws Exception {
		Gson gson = new Gson();
		boolean b = submitOrderService.updateJournalBookFlag(journalBookExpand);
		if (b) {
			return gson.toJson(new JsonResult("0", "0", null, null, null));
		}
		return gson.toJson(new JsonResult("0", "-1", "审核失败：unknown reason", null, null));
	}

	@RequestMapping(value = "/submitOrderVerify", method = { RequestMethod.GET, RequestMethod.POST })
	public String submitOrderVerify(Model model, HttpSession session) throws Exception {
		UserExpand sessionUser = (UserExpand) session.getAttribute("user");

		List<JournalBookExpand> journalBookExpands = null;
		if (sessionUser.getRole().getRoleName().equals("管理员")) {
			journalBookExpands = submitOrderService.findAllUnVerifyJournalBooks();
		} else if (sessionUser.getRole().getRoleName().equals("代理商")) {
			journalBookExpands = submitOrderService.findAllUnVerifyJournalBooksByProxyId(sessionUser.getId());
		}
		model.addAttribute("journalBookList", journalBookExpands);
		return "user/submitOrderVerify";
	}

	@RequestMapping(value = "/submitOrderStatics", method = { RequestMethod.GET, RequestMethod.POST })
	public String submitOrderStatics() throws Exception {
		return "user/submitOrderStatics";
	}
}
