package egovframework.wini.service.eqmn;

import java.sql.Date;

public class EqmnVO {
	private String eqpmnId ="";
	private String eqpmnNm ="";
	private String upperEqpmnId ="";
	private Date frstRegistDt;
	private int frstRegisterSn =0;
	private Date updtDt;
	private int updusrSn =0;
	private String level ="";
	private String eqpmnObj ="";
	
	//기본생성자
	public EqmnVO() {
		super();
	}
	//풀 생성자

	public EqmnVO(String eqpmnId, String eqpmnNm, String upperEqpmnId, Date frstRegistDt, int frstRegisterSn,
			Date updtDt, int updusrSn, String level,String eqpmnObj) {
		super();
		this.eqpmnId = eqpmnId;
		this.eqpmnNm = eqpmnNm;
		this.upperEqpmnId = upperEqpmnId;
		this.frstRegistDt = frstRegistDt;
		this.frstRegisterSn = frstRegisterSn;
		this.updtDt = updtDt;
		this.updusrSn = updusrSn;
		this.level = level;
		this.eqpmnObj= eqpmnObj;
	}
	//getter setter
	public String getEqpmnId() {
		return eqpmnId;
	}

	public void setEqpmnId(String eqpmnId) {
		this.eqpmnId = eqpmnId;
	}

	public String getEqpmnNm() {
		return eqpmnNm;
	}

	public void setEqpmnNm(String eqpmnNm) {
		this.eqpmnNm = eqpmnNm;
	}

	public String getUpperEqpmnId() {
		return upperEqpmnId;
	}

	public void setUpperEqpmnId(String upperEqpmnId) {
		this.upperEqpmnId = upperEqpmnId;
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
	
	
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	
	public String getEqpmnObj() {
		return eqpmnObj;
	}

	public void setEqpmnObj(String eqpmnObj) {
		this.eqpmnObj = eqpmnObj;
	}

	//tostring
	@Override
	public String toString() {
		return "EqmnVO [eqpmnId=" + eqpmnId + ", eqpmnNm=" + eqpmnNm + ", upperEqpmnId=" + upperEqpmnId
				+ ", frstRegistDt=" + frstRegistDt + ", frstRegisterSn=" + frstRegisterSn + ", updtDt=" + updtDt
				+ ", updusrSn=" + updusrSn + ", level=" + level +", eqpmnObj"+eqpmnObj+"]";
	}
	
	
}
