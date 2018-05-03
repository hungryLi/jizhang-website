package cn.kang.biu.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.app.server.cache.ApiRedisKeyConstant;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;

import cn.kang.biu.service.SpringPropertiesUtil;
import cn.kang.biu.service.UserAuthService;
import cn.kang.biu.shiro.service.UserToken;
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
	public List<Map<String, Object>> getMenuLists() throws Exception {
		Map<String, Object> parMap = new HashMap<String, Object>();
		parMap.put("user_id", UserToken.getToken().getId());
		String result = HttpUtil.doPost(JZ_URL+"/auth/get_permisions",MiscUtil.createRequestParm(parMap));
		JSONObject navJson = new JSONObject(result);
		if(navJson != null && navJson.optInt("code") == 0) {
			return JSON.parseObject(navJson.getString("res_data"), new TypeReference<List<Map<String, Object>>>(){});
		}
		throw new RuntimeException("获取菜单信息异常 ");
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

	
	
	
	
}
