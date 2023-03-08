package egovframework.wini.service.eqmn;

import java.sql.Date;

public class EqmnVO {
	private String eqpmnId ="";
	private String eqpmnNm ="";
	private String upperEqpmnId ="";
	private Date frstRegistDt;
	private String frstRegisterSn ="";
	private Date updtDt;
	private String updusrSn ="";
	
	//기본생성자
	public EqmnVO() {
		super();
	}
	//풀 생성자

	public EqmnVO(String eqpmnId, String eqpmnNm, String upperEqpmnId, Date frstRegistDt, String frstRegisterSn,
			Date updtDt, String updusrSn) {
		super();
		this.eqpmnId = eqpmnId;
		this.eqpmnNm = eqpmnNm;
		this.upperEqpmnId = upperEqpmnId;
		this.frstRegistDt = frstRegistDt;
		this.frstRegisterSn = frstRegisterSn;
		this.updtDt = updtDt;
		this.updusrSn = updusrSn;
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

	public String getFrstRegisterSn() {
		return frstRegisterSn;
	}

	public void setFrstRegisterSn(String frstRegisterSn) {
		this.frstRegisterSn = frstRegisterSn;
	}

	public Date getUpdtDt() {
		return updtDt;
	}

	public void setUpdtDt(Date updtDt) {
		this.updtDt = updtDt;
	}

	public String getUpdusrSn() {
		return updusrSn;
	}

	public void setUpdusrSn(String updusrSn) {
		this.updusrSn = updusrSn;
	}
	//tostring
	@Override
	public String toString() {
		return "EqmnVO [eqpmnId=" + eqpmnId + ", eqpmnNm=" + eqpmnNm + ", upperEqpmnId=" + upperEqpmnId
				+ ", frstRegistDt=" + frstRegistDt + ", frstRegisterSn=" + frstRegisterSn + ", updtDt=" + updtDt
				+ ", updusrSn=" + updusrSn + "]";
	}
	
	
}
