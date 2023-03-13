package egovframework.wini.service.eqmnM;

import java.sql.Date;

public class EqmnMVO {
	private int eqpmnSn=0;
	private String eqpmnSeCode="";
	private String eqpmnNm="";
	private String orgnztId="";
	private String buyDay;
	private int eqpmnUnitPrice=0;
	private String eqpmnModelName="";
	private String eqpmnMakr="";
	private String eqpmnPin="";
	private String eqpmnCn="";
	private Date frstRegistDt;
	private int frstRegisterSn=0;
	private String updtDt="";
	private int updusrSn=0;
	private String atchFileSn="";
	
	//기본생성자
	public EqmnMVO() {
		super();
	}
	//풀스택 생성자
	public EqmnMVO(int eqpmnSn, String eqpmnSeCode, String eqpmnNm, String orgnztId, String buyDay,
			int eqpmnUnitPrice, String eqpmnModelName, String eqpmnMakr, String eqpmnPin, String eqpmnCn,
			Date frstRegistDt, int frstRegisterSn, String updtDt, int updusrSn, String atchFileSn) {
		super();
		this.eqpmnSn = eqpmnSn;
		this.eqpmnSeCode = eqpmnSeCode;
		this.eqpmnNm = eqpmnNm;
		this.orgnztId = orgnztId;
		this.buyDay = buyDay;
		this.eqpmnUnitPrice = eqpmnUnitPrice;
		this.eqpmnModelName = eqpmnModelName;
		this.eqpmnMakr = eqpmnMakr;
		this.eqpmnPin = eqpmnPin;
		this.eqpmnCn = eqpmnCn;
		this.frstRegistDt = frstRegistDt;
		this.frstRegisterSn = frstRegisterSn;
		this.updtDt = updtDt;
		this.updusrSn = updusrSn;
		this.atchFileSn = atchFileSn;
	}
	
	//getter setter
	public int getEqpmnSn() {
		return eqpmnSn;
	}
	public void setEqpmnSn(int eqpmnSn) {
		this.eqpmnSn = eqpmnSn;
	}
	public String getEqpmnSeCode() {
		return eqpmnSeCode;
	}
	public void setEqpmnSeCode(String eqpmnSeCode) {
		this.eqpmnSeCode = eqpmnSeCode;
	}
	public String getEqpmnNm() {
		return eqpmnNm;
	}
	public void setEqpmnNm(String eqpmnNm) {
		this.eqpmnNm = eqpmnNm;
	}
	public String getOrgnztId() {
		return orgnztId;
	}
	public void setOrgnztId(String orgnztId) {
		this.orgnztId = orgnztId;
	}
	public String getBuyDay() {
		return buyDay;
	}
	public void setBuyDay(String buyDay) {
		this.buyDay = buyDay;
	}
	public int getEqpmnUnitPrice() {
		return eqpmnUnitPrice;
	}
	public void setEqpmnUnitPrice(int eqpmnUnitPrice) {
		this.eqpmnUnitPrice = eqpmnUnitPrice;
	}
	public String getEqpmnModelName() {
		return eqpmnModelName;
	}
	public void setEqpmnModelName(String eqpmnModelName) {
		this.eqpmnModelName = eqpmnModelName;
	}
	public String getEqpmnMakr() {
		return eqpmnMakr;
	}
	public void setEqpmnMakr(String eqpmnMakr) {
		this.eqpmnMakr = eqpmnMakr;
	}
	public String getEqpmnPin() {
		return eqpmnPin;
	}
	public void setEqpmnPin(String eqpmnPin) {
		this.eqpmnPin = eqpmnPin;
	}
	public String getEqpmnCn() {
		return eqpmnCn;
	}
	public void setEqpmnCn(String eqpmnCn) {
		this.eqpmnCn = eqpmnCn;
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
	public String getUpdtDt() {
		return updtDt;
	}
	public void setUpdtDt(String updtDt) {
		this.updtDt = updtDt;
	}
	public int getUpdusrSn() {
		return updusrSn;
	}
	public void setUpdusrSn(int updusrSn) {
		this.updusrSn = updusrSn;
	}
	public String getAtchFileSn() {
		return atchFileSn;
	}
	public void setAtchFileSn(String atchFileSn) {
		this.atchFileSn = atchFileSn;
	}
	
	//tostring
	@Override
	public String toString() {
		return "EqmnMVO [eqpmnSn=" + eqpmnSn + ", eqpmnSeCode=" + eqpmnSeCode + ", eqpmnNm=" + eqpmnNm + ", orgnztId="
				+ orgnztId + ", buyDay=" + buyDay + ", eqpmnUnitPrice=" + eqpmnUnitPrice + ", eqpmnModelName="
				+ eqpmnModelName + ", eqpmnMakr=" + eqpmnMakr + ", eqpmnPin=" + eqpmnPin + ", eqpmnCn=" + eqpmnCn
				+ ", frstRegistDt=" + frstRegistDt + ", frstRegisterSn=" + frstRegisterSn + ", updtDt=" + updtDt
				+ ", updusrSn=" + updusrSn + ", atchFileSn=" + atchFileSn + "]";
	}
	
	
	
	

}
