package cn.kang.biu.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.app.server.cache.ApiRedisKeyConstant;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;

import cn.kang.biu.service.SpringPropertiesUtil;
import cn.kang.biu.service.UserAuthService;
import cn.kang.biu.shiro.service.UserToken;
import cn.kang.biu.vo.PermisionVo;
import platform.common.utils.HttpUtil;
import platform.common.utils.MiscUtil;

@Service("userAuthServie")
public class UserAuthServieImpl implements UserAuthService {
	
	private static final String JZ_URL = SpringPropertiesUtil.getProperty("platform-jizhang-biu-api");
	
	@Override
	public String userAuth(Map<String, Object> loginMap) throws Exception {
		if (StringUtils.isBlank(JZ_URL)) {
			throw new Exception("user url error : " +JZ_URL);
		}
		String result = HttpUtil.doPost(JZ_URL+"/auth/login",MiscUtil.createRequestParm(loginMap));
		return result;
	}

	@Override
	public List<PermisionVo> getMenuLists() throws Exception {
		Map<String, Object> parMap = new HashMap<String, Object>();
		parMap.put("user_id", UserToken.getToken().getId());
		parMap.put("role_id", UserToken.getToken().getRoleId());
		String result = HttpUtil.doPost(JZ_URL+"/auth/get_menu_permisions",MiscUtil.createRequestParm(parMap));
		JSONObject navJson = new JSONObject(result);
		if(navJson != null && navJson.optInt("code") == 0) {
			 List<Map<String, Object>> oneMenuList = JSON.parseObject(navJson.getString("one_menu"), new TypeReference<List<Map<String, Object>>>(){});
			 List<Map<String, Object>> twoMenuList = JSON.parseObject(navJson.getString("two_menu"), new TypeReference<List<Map<String, Object>>>(){});
			 // 菜单对象集合
			 List<PermisionVo> menuList = new ArrayList<PermisionVo>();
			 for(Map<String, Object> menuMap : oneMenuList) {
				 PermisionVo oneLevel = convertMenu(menuMap);
				 menuList.add(oneLevel);
			 }
			 for(PermisionVo oneMenu : menuList) {
				 List<PermisionVo> children = new ArrayList<PermisionVo>();
				 for(Map<String, Object> menuMap : twoMenuList) {
					 if(oneMenu.getId().toString().equals(menuMap.get("parent_menu").toString())) {
						 children.add(convertMenu(menuMap));
					 }
				 }
				 oneMenu.setChildren(children);
			 }
			 return menuList;
		}
		throw new RuntimeException("获取菜单信息异常 ");
	}
	
	private PermisionVo convertMenu(Map<String, Object> menuMap) {
		PermisionVo menu = new PermisionVo();
		menu.setId(Integer.valueOf(menuMap.get("id").toString()));
		menu.setMenuName(menuMap.get("menu_name").toString());
		menu.setIconType(Integer.valueOf(menuMap.get("icon_type").toString()));
		if(!MiscUtil.isEmpty(menuMap.get("icon_address"))) {
			menu.setIconAddress(menuMap.get("icon_address").toString());
		}
		menu.setMenuHref(menuMap.get("menu_href").toString());
		if(!MiscUtil.isEmpty(menuMap.get("parent_menu"))) {
			menu.setParentMenu(Integer.valueOf(menuMap.get("parent_menu").toString()));
		}
		return menu;
	}

	@Override
	public void logout(Integer userId) {
		Map<String, Object> parMap = new HashMap<String, Object>();
		parMap.put("token", UserToken.getLoginToken());
		parMap.put("user_id", userId);
		try {
			HttpUtil.doPost(JZ_URL+"/api/logout", ApiRedisKeyConstant.API_SECRET_ACCESS_KEY_ID, MiscUtil.createRequestParm(parMap));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public String valiCode(String vali_code, String userAgent, String area_code, String phone) throws Exception {
		Map<String, Object> parMap = new HashMap<String, Object>();
		parMap.put("vali_code", vali_code);
		parMap.put("area_code", area_code);
		parMap.put("user_id", UserToken.getUserId());
		parMap.put("phone", phone);
		String result = HttpUtil.doPost(JZ_URL+"/api/vali_code", userAgent,
				ApiRedisKeyConstant.API_SECRET_ACCESS_KEY_ID ,MiscUtil.createRequestParm(parMap));
		return result;
	}

	@Override
	public String sendMessage(String area_code, String phone, String msg_token) throws Exception {
		Map<String, Object> parMap = new HashMap<String, Object>();
		parMap.put("area_code", area_code);
		parMap.put("phone", phone);
		parMap.put("user_id", UserToken.getUserId());
		parMap.put("msg_token", msg_token);
		String result = HttpUtil.doPost(JZ_URL+"/api/send_message",
				ApiRedisKeyConstant.API_SECRET_ACCESS_KEY_ID ,MiscUtil.createRequestParm(parMap));
		return result;
	}

	@Override
	public List<Map<String, Object>> queryPrincipalRoles(Integer userId) {
		try {
			Map<String, Object> parMap = new HashMap<String, Object>();
			parMap.put("user_id", userId);
			String result = HttpUtil.doPost(JZ_URL+"/auth/login_roles",MiscUtil.createRequestParm(parMap));
			JSONObject json = new JSONObject(result);
			if(json != null && json.optInt("code") == 0) {
				return JSON.parseObject(json.getString("res_data"), new TypeReference<List<Map<String, Object>>>(){});
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Map<String, Object>> queryPrincipalPermisions(Integer userId) {
		try {
			Map<String, Object> parMap = new HashMap<String, Object>();
			parMap.put("user_id", userId);
			String result = HttpUtil.doPost(JZ_URL+"/auth/login_permisions",MiscUtil.createRequestParm(parMap));
			JSONObject json = new JSONObject(result);
			if(json != null && json.optInt("code") == 0) {
				return JSON.parseObject(json.getString("res_data"), new TypeReference<List<Map<String, Object>>>(){});
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
	
	
}
