package egovframework.wini.web.epqmnC;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.google.gson.Gson;

import egovframework.wini.service.eqmn.EqmnService;
import egovframework.wini.service.eqmn.EqmnVO;
import egovframework.wini.service.eqmnC.EqmnCDVO;
import egovframework.wini.service.eqmnC.EqmnCService;
import egovframework.wini.service.eqmnC.EqmnCVO;
import egovframework.wini.service.eqmnC.ListVO;
import egovframework.wini.service.eqmnM.EqmnMService;
import egovframework.wini.service.eqmnM.EqmnMVO;

@Controller
@EnableWebMvc
public class EqpmnCheckController {
	//점검용
	@Resource(name="EqmnCService")
	EqmnCService eqCService;
	//코드용
	@Resource(name="EqmnService")
	EqmnService eqService;
	//장비용
	@Resource(name="EqmnMService")
	EqmnMService eqMService;
	//장비관리 이동
		@GetMapping("/goEqmentC.do")
		public String goEqmentC(Model mo) {
			//상위 메뉴만들기
			mo.addAttribute("getListNm", eqCService.saerchForJoin());
			return "eqmn/eqmnC";
		}
	
		
		//ajax로 단일조회 호출
		@RequestMapping(value="/mkSearchAjax.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
		@ResponseBody
		public String mkSearchAjax(EqmnVO vo ) {
			//찾을 칼럼의 key 단일조회
			List<EqmnVO> list = eqService.eqmnList(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
			
			Gson jList = new Gson();
			
			return jList.toJson(list) ;
		}
		
		//ajax로 장비목록 가져오기
		@RequestMapping(value="/doSearchAjaxC.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
		@ResponseBody
		public String doSearchAjaxC(EqmnMVO vo ) {
			//찾을 칼럼의 key 단일조회
			List<EqmnMVO> list = eqMService.doSearchAjaxC(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
			
			Gson jList = new Gson();
			
			return jList.toJson(list) ;
		}
		//ajax로 점검 마스터 테이블 불러오기
		@RequestMapping(value="/CheckMasterAJax.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
		@ResponseBody
		public String CheckMasterAJax(EqmnCVO vo ) {
			//찾을 칼럼의 key 단일조회
			List<EqmnCVO> list = eqCService.CheckMasterAJax(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
			
			Gson jList = new Gson();
			
			return jList.toJson(list) ;
		}
		//ajax로 점검 마스터 디테일 테이블 불러오기
		@RequestMapping(value="/CheckMasterDAJax.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
		@ResponseBody
		public String CheckMasterDAJax(EqmnCDVO vo ) {
			//찾을 칼럼의 key 단일조회
			List<EqmnCDVO> list = eqCService.CheckMasterDAJax(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
			
			Gson jList = new Gson();
			
			return jList.toJson(list) ;
		}
		//ajax로 점검 마스터 디테일 등록
		@RequestMapping(value="/addEqpmnDo.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
		@ResponseBody
		public String addEqpmnDo(@RequestParam Map<String, Object> commandMap,HttpServletRequest request) {
			//세션기능가진  인터페이스
			HttpSession session = request.getSession();
			//세션 map으로 캐스팅
			@SuppressWarnings("unchecked")
			Map<String, Object> session2 = (Map<String, Object>) session.getAttribute("userInfo");
			//세션에서 가져온 유저일렬번호 오브젝트를 string 
			String id = String.valueOf(session2.get("userSn"));
			//string -> int 로 
			int userSn= Integer.parseInt(id);
			//결과가 4면 성공 그리고 tEqpmnSn를 반환
			int result = eqCService.addEqpmnDo(commandMap,userSn);
			
			return String.valueOf(result) ;
			//return "1";
		}
		
		//ajax로 점검 마스터 //디테일 삭제
		@RequestMapping(value="/eqpmnCDDelAjax.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
		@ResponseBody
		public String eqpmnCDDelAjax(int chckSn ) {
			//결과가 4면 성공 그리고 tEqpmnSn를 반환
			int result = eqCService.eqpmnCDDelAjax(chckSn);
			
			return String.valueOf(result) ;
		}
		
}
