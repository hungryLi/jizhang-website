package cn.kang.biu.service;

import java.util.Map;

public interface ConsumeService {

	String addConsume(Map<String, Object> map) throws Exception;

	String queryAccountGroups(Map<String, Object> map) throws Exception;

	String queryGroupMembers(Map<String, Object> map) throws Exception;

	String queryConsumeType(Map<String, Object> map) throws Exception;

	String queryIndexActivity(Map<String, Object> map) throws Exception;

	String cancelLike(Map<String, Object> map) throws Exception;
}
