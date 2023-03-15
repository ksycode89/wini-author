package egovframework.wini.service.menuMgmt;

import java.io.Serializable;

public class MenuMgmtVO implements Serializable  {
	
    private static final long serialVersionUID = 1L;
    
    /** 메뉴ID */
    private String menuId = "";

    /** 메뉴명 */
    private String menuNm = "";

    /** 상위메뉴ID */
    private String upperMenuId = "";

    /** 메뉴URL */
    private String menuUrl = "";

    /** 정렬순서 */
    private String sortOrdr = "";

    /** 용도선택 */
    private String menuAt = "";

    /** 사용여부 */
    private String useAt = "";

    /** 메뉴설명 */
    private String menuDc = "";

    /** 수정일시 */
    private String updtDt = "";

    /** 수정자일련번호 */
    private String updusrSn = "";

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getMenuNm() {
        return menuNm;
    }

    public void setMenuNm(String menuNm) {
        this.menuNm = menuNm;
    }

    public String getUpperMenuId() {
        return upperMenuId;
    }

    public void setupperMenuId(String upperMenuId) {
        this.upperMenuId = upperMenuId;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public String getSortOrdr() {
        return sortOrdr;
    }

    public void setSortOrdr(String sortOrdr) {
        this.sortOrdr = sortOrdr;
    }

    public String getMenuAt() {
        return menuAt;
    }

    public void setMenuAt(String menuAt) {
        this.menuAt = menuAt;
    }

    public String getUseAt() {
        return useAt;
    }

    public void setUseAt(String useAt) {
        this.useAt = useAt;
    }

    public String getMenuDc() {
        return menuDc;
    }

    public void setMenuDc(String menuDc) {
        this.menuDc = menuDc;
    }

    public String getUpdtDt() {
        return updtDt;
    }

    public void setUpdtDt(String updtDt) {
        this.updtDt = updtDt;
    }

    public String getUpdusrSn() {
        return updusrSn;
    }

    public void setUpdusrSn(String updusrSn) {
        this.updusrSn = updusrSn;
    }

}
