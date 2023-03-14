package egovframework.wini.service.eqmnC;

import java.sql.Date;

public class EqmnCVO {
	
	private int chckSn=0;
	private int eqpmnSn=0;
	private String chckDay="";
	private Date frstRegistDt;
	private int frstRegisterSn=0;
	private Date updtDt;
	private int updusrSn=0;
	
	private String eqpmnNm="";
	//기본생성자
	public EqmnCVO() {
		super();
	}
	//풀생성자
	public EqmnCVO(int chckSn, int eqpmnSn, String chckDay, Date frstRegistDt, int frstRegisterSn, Date updtDt,
			int updusrSn, String eqpmnNm) {
		super();
		this.chckSn = chckSn;
		this.eqpmnSn = eqpmnSn;
		this.chckDay = chckDay;
		this.frstRegistDt = frstRegistDt;
		this.frstRegisterSn = frstRegisterSn;
		this.updtDt = updtDt;
		this.updusrSn = updusrSn;
		this.eqpmnNm = eqpmnNm;
	}

	//getter setter
	public int getChckSn() {
		return chckSn;
	}

	public void setChckSn(int chckSn) {
		this.chckSn = chckSn;
	}
	
	public String getEqpmnNm() {
		return eqpmnNm;
	}
	public void setEqpmnNm(String eqpmnNm) {
		this.eqpmnNm = eqpmnNm;
	}
	public int getEqpmnSn() {
		return eqpmnSn;
	}

	public void setEqpmnSn(int eqpmnSn) {
		this.eqpmnSn = eqpmnSn;
	}

	public String getChckDay() {
		return chckDay;
	}

	public void setChckDay(String chckDay) {
		this.chckDay = chckDay;
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
	//to string
	@Override
	public String toString() {
		return "EqmnCVO [chckSn=" + chckSn + ", eqpmnSn=" + eqpmnSn + ", chckDay=" + chckDay + ", frstRegistDt="
				+ frstRegistDt + ", frstRegisterSn=" + frstRegisterSn + ", updtDt=" + updtDt + ", updusrSn=" + updusrSn
				+ ", eqpmnNm=" + eqpmnNm + "]";
	}
	 
	
	

		
}
