package cn.kang.biu.service;

import java.util.Map;

public interface ConsumeService {

	String addConsume(Map<String, Object> map) throws Exception;

	String queryAccountGroups(Map<String, Object> map) throws Exception;

	String queryGroupMembers(Map<String, Object> map) throws Exception;
}
