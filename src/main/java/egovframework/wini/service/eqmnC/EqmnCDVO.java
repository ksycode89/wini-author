package egovframework.wini.service.eqmnC;

import java.sql.Date;

public class EqmnCDVO {
	private int chckDSn;
	private int chckSn;
	private String chckNm;
	private String chckResult;
	private String chckCn;
	private Date frstRegistDt;
	private int frstRegisterSn;
	private Date updtDt;
	private int updusrSn;
	private int rownum;
	
	public EqmnCDVO() {
		super();
	}
	
	
	public EqmnCDVO(int chckDSn, int chckSn, String chckNm, String chckResult, String chckCn, Date frstRegistDt,
			int frstRegisterSn, Date updtDt, int updusrSn, int rownum) {
		super();
		this.chckDSn = chckDSn;
		this.chckSn = chckSn;
		this.chckNm = chckNm;
		this.chckResult = chckResult;
		this.chckCn = chckCn;
		this.frstRegistDt = frstRegistDt;
		this.frstRegisterSn = frstRegisterSn;
		this.updtDt = updtDt;
		this.updusrSn = updusrSn;
		this.rownum = rownum;
	}


	//setter getter
	public int getChckDSn() {
		return chckDSn;
	}

	public void setChckDSn(int chckDSn) {
		this.chckDSn = chckDSn;
	}
	
	public int getRownum() {
		return rownum;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public int getChckSn() {
		return chckSn;
	}

	public void setChckSn(int chckSn) {
		this.chckSn = chckSn;
	}

	public String getChckNm() {
		return chckNm;
	}

	public void setChckNm(String chckNm) {
		this.chckNm = chckNm;
	}

	public String getChckResult() {
		return chckResult;
	}

	public void setChckResult(String chckResult) {
		this.chckResult = chckResult;
	}

	public String getChckCn() {
		return chckCn;
	}

	public void setChckCn(String chckCn) {
		this.chckCn = chckCn;
	}

	public Date getFrstRegistDt() {
		return frstRegistDt;
	}

	public void setFrstRegistDt(Date frstRegistDt) {
		this.frstRegistDt = frstRegistDt;
	}

	public int getFrstRegisterSn() {
		return frstRegisterSn;
	}

	public void setFrstRegisterSn(int frstRegisterSn) {
		this.frstRegisterSn = frstRegisterSn;
	}

	public Date getUpdtDt() {
		return updtDt;
	}

	public void setUpdtDt(Date updtDt) {
		this.updtDt = updtDt;
	}

	public int getUpdusrSn() {
		return updusrSn;
	}

	public void setUpdusrSn(int updusrSn) {
		this.updusrSn = updusrSn;
	}
	//tostring
	@Override
	public String toString() {
		return "EqmnCDVO [chckDSn=" + chckDSn + ", chckSn=" + chckSn + ", chckNm=" + chckNm + ", chckResult="
				+ chckResult + ", chckCn=" + chckCn + ", frstRegistDt=" + frstRegistDt + ", frstRegisterSn="
				+ frstRegisterSn + ", updtDt=" + updtDt + ", updusrSn=" + updusrSn + "]";
	}
	
	
	
	
}
