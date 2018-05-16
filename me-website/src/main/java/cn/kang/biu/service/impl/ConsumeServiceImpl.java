package cn.kang.biu.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import cn.kang.biu.service.ConsumeService;
import cn.kang.biu.service.SpringPropertiesUtil;
import platform.common.utils.HttpUtil;
import platform.common.utils.MiscUtil;
import platform.common.utils.StringUtil;

@Service("consumeService")
public class ConsumeServiceImpl implements ConsumeService {

	private static final String JZ_URL = SpringPropertiesUtil.getProperty("platform-jizhang-biu-api");

	
	@Override
	public String addConsume(Map<String, Object> map) throws Exception {
		if(StringUtil.isEmpty(JZ_URL)) {
			throw new RuntimeException("jz_url exception");
		}
		String result = HttpUtil.doPost(JZ_URL+"/consume/add_consume", MiscUtil.createRequestParm(map));
		return result;
	}


	@Override
	public String queryAccountGroups(Map<String, Object> map) throws Exception {
		String result = HttpUtil.doPost(JZ_URL+"/consume/select_groups", MiscUtil.createRequestParm(map));
		return result;
	}


	@Override
	public String queryGroupMembers(Map<String, Object> map) throws Exception {
		String result = HttpUtil.doPost(JZ_URL+"/consume/select_group_members", MiscUtil.createRequestParm(map));
		return result;
	}
	
	
	
}
