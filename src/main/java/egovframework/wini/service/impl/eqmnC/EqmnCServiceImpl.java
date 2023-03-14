package egovframework.wini.service.impl.eqmnC;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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

	
	
}
