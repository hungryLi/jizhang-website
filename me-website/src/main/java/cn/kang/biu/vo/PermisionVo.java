package cn.kang.biu.vo;

import java.util.List;

public class PermisionVo {
	
	private Integer id;

    private String pName;

    private String pCode;

    private String menuName;

    private Integer menuType;

    private Integer parentMenu;

    private Integer iconType;

    private String iconAddress;

    private String menuHref;

    private List<PermisionVo> children;

    
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Integer getMenuType() {
		return menuType;
	}

	public void setMenuType(Integer menuType) {
		this.menuType = menuType;
	}

	public Integer getParentMenu() {
		return parentMenu;
	}

	public void setParentMenu(Integer parentMenu) {
		this.parentMenu = parentMenu;
	}

	public Integer getIconType() {
		return iconType;
	}

	public void setIconType(Integer iconType) {
		this.iconType = iconType;
	}

	public String getIconAddress() {
		return iconAddress;
	}

	public void setIconAddress(String iconAddress) {
		this.iconAddress = iconAddress;
	}

	public String getMenuHref() {
		return menuHref;
	}

	public void setMenuHref(String menuHref) {
		this.menuHref = menuHref;
	}

	public List<PermisionVo> getChildren() {
		return children;
	}

	public void setChildren(List<PermisionVo> children) {
		this.children = children;
	}
    
    
    
    
	
}
