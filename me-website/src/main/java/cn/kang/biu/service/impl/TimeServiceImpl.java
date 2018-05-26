package cn.kang.biu.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

import cn.kang.biu.service.SpringPropertiesUtil;
import cn.kang.biu.service.TimeService;
import platform.common.utils.HttpUtil;
import platform.common.utils.MiscUtil;
import platform.common.utils.StringUtil;

@Service("timeService")
public class TimeServiceImpl implements TimeService {
	
	private static final String JZ_URL = SpringPropertiesUtil.getProperty("platform-jizhang-biu-api");

	@Override
	public String listTimes(Map<String, Object> map) throws Exception {
		if(StringUtil.isEmpty(JZ_URL)) {
			throw new RuntimeException("jz_url exception");
		}
		String result = HttpUtil.doPost(JZ_URL+"/time/list_times", MiscUtil.createRequestParm(map));
		return result;
	}
	
	
	
	
}
