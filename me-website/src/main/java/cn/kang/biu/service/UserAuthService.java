package cn.kang.biu.service;

import java.util.Map;

public interface UserAuthService {

	public String userAuth(Map<String, Object> loginMap) throws Exception;

	public void logout(Integer userId);

	public String valiCode(String vali_code, String userAgent, String area_code, String phone) throws Exception ;

	public String sendMessage(String area_code, String phone, String msg_token) throws Exception ;
	
}

