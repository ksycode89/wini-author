package egovframework.wini.service.eqmnC;

import java.util.List;

public class ListVO {
	private List<EqmnCVO> cvo;
	private List<EqmnCDVO> cdvo;
	private String end;
	private String bre;
	private String tire;
	//안되서 나중에 다시 시도
	
	public ListVO() {
		super();
	}
	
	

	



	public List<EqmnCVO> getCvo() {
		return cvo;
	}


	public void setCvo(List<EqmnCVO> cvo) {
		this.cvo = cvo;
	}


	public ListVO(List<EqmnCVO> cvo, List<EqmnCDVO> cdvo, String end, String bre, String tire) {
		super();
		this.cvo = cvo;
		this.cdvo = cdvo;
		this.end = end;
		this.bre = bre;
		this.tire = tire;
	}


	public List<EqmnCDVO> getCdvo() {
		return cdvo;
	}


	public void setCdvo(List<EqmnCDVO> cdvo) {
		this.cdvo = cdvo;
	}



	public String getEnd() {
		return end;
	}



	public void setEnd(String end) {
		this.end = end;
	}



	public String getBre() {
		return bre;
	}



	public void setBre(String bre) {
		this.bre = bre;
	}



	public String getTire() {
		return tire;
	}



	public void setTire(String tire) {
		this.tire = tire;
	}



	@Override
	public String toString() {
		return "ListVO [cvo=" + cvo + ", cdvo=" + cdvo + ", end=" + end + ", bre=" + bre + ", tire=" + tire + "]";
	}
	
	
}
