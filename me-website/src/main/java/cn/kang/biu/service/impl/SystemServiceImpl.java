package cn.kang.biu.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import cn.kang.biu.service.SpringPropertiesUtil;
import cn.kang.biu.service.SystemService;
import platform.common.utils.HttpUtil;
import platform.common.utils.MiscUtil;
import platform.common.utils.StringUtil;

@Service("systemService")
public class SystemServiceImpl implements SystemService {
	
	private static final String JZ_URL = SpringPropertiesUtil.getProperty("platform-jizhang-biu-api");

	@Override
	public String roleList(Map<String, Object> map) throws Exception {
		if(StringUtil.isEmpty(JZ_URL)) {
			throw new RuntimeException("jz_url exception");
		}
		String result = HttpUtil.doPost(JZ_URL+"/auth/role_list", MiscUtil.createRequestParm(map));
		return result;
	}

	@Override
	public String updateRole(Map<String, Object> map) throws Exception {
		if(StringUtil.isEmpty(JZ_URL)) {
			throw new RuntimeException("jz_url exception");
		}
		String result = HttpUtil.doPost(JZ_URL+"/auth/role_update", MiscUtil.createRequestParm(map));
		return result;
	}

	@Override
	public String permisionList(Map<String, Object> map) throws Exception {
		if(StringUtil.isEmpty(JZ_URL)) {
			throw new RuntimeException("jz_url exception");
		}
		String result = HttpUtil.doPost(JZ_URL+"/auth/permision_list", MiscUtil.createRequestParm(map));
		return result;
	}
	
	
	
	
}
