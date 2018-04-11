package cn.kang.biu.shiro.credentials;

import org.apache.shiro.authc.UsernamePasswordToken;

public class AuthenticationUserInfo extends UsernamePasswordToken {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7197116415336669814L;
	
	public String operatorId;
	
	public String agentId;
	
	public String supplierId;
	
	public String userAgent;
	
	public String isDownLine;
	
	public int userType;

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public String getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}

	public String getAgentId() {
		return agentId;
	}

	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public String getIsDownLine() {
		return isDownLine;
	}

	public void setIsDownLine(String isDownLine) {
		this.isDownLine = isDownLine;
	}
}
