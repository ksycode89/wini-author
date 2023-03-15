package egovframework.wini.service.impl.eqmnC;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.wini.service.eqmnC.EqmnCDVO;
import egovframework.wini.service.eqmnC.EqmnCService;
import egovframework.wini.service.eqmnC.EqmnCVO;
import egovframework.wini.service.impl.eqmnM.EqmnMMapper;

@Service("EqmnCService")
public class EqmnCServiceImpl implements EqmnCService {
	
	@Resource(name="eqmnCMapper")
	EqmnCMapper eqCMap;
	
	/*
	 * @Override public String saerchForJoin() { Gson jList = new Gson(); String
	 * result=""; try {
	 * 
	 * result = jList.toJson(eqCMap.saerchForJoin()) ;
	 * 
	 * } catch (Exception e) {
	 * 
	 * result= e.toString(); }
	 * 
	 * return result; }
	 */
	//셀렉트 메뉴만들기
	@Override
	public List<Map<String, Object>> saerchForJoin() {
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		
			try {
				result = eqCMap.saerchForJoin();
			} catch (Exception e) {
				e.getStackTrace(); 
			}
			
		return result;
	}

	@Override
	public List<EqmnCVO> CheckMasterAJax(EqmnCVO vo) {
		List<EqmnCVO> result = new ArrayList<EqmnCVO>();
		
		try {
			result = eqCMap.CheckMasterAJax(vo);
		} catch (Exception e) {
			e.getStackTrace(); 
		}
		return result;
	}

	@Override
	public List<EqmnCDVO> CheckMasterDAJax(EqmnCDVO vo) {
		List<EqmnCDVO> result = new ArrayList<EqmnCDVO>();
		try {
			result = eqCMap.CheckMasterDAJax(vo);
		} catch (Exception e) {
			e.getStackTrace(); 
			System.out.println(e);
		}
		return result;
	}

	@Override
	public int addEqpmnDo(Map<String, Object> commandMap,int userSn) {
		//HttpSession session = request.getSession();
		
		//총합이 4여야함.
		int result =0;
		EqmnCVO cvo = new EqmnCVO();
		cvo.setFrstRegisterSn(userSn);
		EqmnCDVO cdvo = new EqmnCDVO();
		cdvo.setFrstRegisterSn(userSn);
		String name[]= {"엔진","타이어","브레이크"};
		
		//마스터 입력값
		int eqpmnSn =Integer.valueOf((String) commandMap.get("eqpmnSn"));
		String chckDay = (String) commandMap.get("chckDay");
		
		cvo.setChckDay(chckDay);
		cvo.setEqpmnSn(eqpmnSn);
		//디테일확인용
		List<String> list = new ArrayList<String>();
		list.add((String) commandMap.get("end"));
		list.add((String) commandMap.get("tire"));
		list.add((String) commandMap.get("bre"));
		
		try {
			int master = eqCMap.insertMaster(cvo);
			//마스터 테이블이 성공했다면
			if(master>0) {
				//디테일확인용
				int masterD=0;
				//디테일 횟수만큼돌기 지금은 3번돔
				for (int i = 0; i < list.size(); i++) {
					System.out.println(list.get(i));
					//디테일 시작
					cdvo= new EqmnCDVO();
					cdvo.setChckSn(cvo.getChckSn());
					cdvo.setChckNm(name[i]);
					//체크박스 결과에 따라 Y나 N을 입력
					if (list.get(i).equals("true")) {
						cdvo.setChckResult("Y");
					}else {
						cdvo.setChckResult("N");
					}
					cdvo.setChckCn( (String) commandMap.get("chckCn"));
					masterD +=  eqCMap.insertMasterD(cdvo);
				}
				result = eqpmnSn;
			}
			
			//오류가나오면 -1
		} catch (Exception e) {
			result = -1;
			System.out.println(e);
		}
		
		return result;
	}

	@Override
	public int eqpmnCDDelAjax(int chckSn) {
		int result= 0 ;
		try {
			result = eqCMap.eqpmnCDDelAjax(chckSn);
			//지금은 3개 추후 where=chcksn으로 열의 갯수를 읽어온후 삭제수량이량 맞는지 체크해야함
			
				 eqCMap.eqpmnMDelAjax(chckSn);
				result = chckSn;
			
				//두개가 지워졌으면 롤백을 시켜야함? 어떻게하지 ?
			
		} catch (Exception e) {
			e.getStackTrace(); 
			System.out.println(e);
		}
		return result;
	}

	
	
}
