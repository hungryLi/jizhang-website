package cn.kang.biu.service;

import java.util.Map;

public interface SystemService {

	String roleList(Map<String, Object> map) throws Exception;

	String updateRole(Map<String, Object> map) throws Exception;

	String permisionList(Map<String, Object> map) throws Exception;

	String getParentMenus() throws Exception;

	String addPermission(Map<String, Object> map) throws Exception;

	String deletePermison(Map<String, Object> map) throws Exception;

	String queryPermissionById(Map<String, Object> map) throws Exception;

	String roleHasPermisions(Map<String, Object> map) throws Exception;

	String roleRelaPermisions(Map<String, Object> map) throws Exception;

}
