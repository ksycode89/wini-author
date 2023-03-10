package egovframework.wini.web.eqmn;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.google.gson.Gson;

import egovframework.wini.comm.CommandMap;
import egovframework.wini.service.eqmn.EqmnService;
import egovframework.wini.service.eqmn.EqmnVO;

@Controller
@EnableWebMvc
public class EqmnController {
	
	@Resource(name="EqmnService")
	EqmnService eqService;
	
	//모델로 list호출
	@RequestMapping("/goEqment.do")
	public String goEqment(Model mo ) {
		System.out.println(123);
		EqmnVO vo = new EqmnVO(); //기본생성자로 인한 객쳇애성
		List<EqmnVO> list = eqService.eqmnList(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
		System.out.println("eqmn가는 페이지 : "+list);
		mo.addAttribute("eqmnList",list);                //모델에 담아서 전송
		return "eqmn/eqmn";
	}
	
	@RequestMapping(value="/callListEqmentAjax.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String callListEqmentAjax(EqmnVO vo ) {
		//찾을 칼럼의 key 단일조회
		List<EqmnVO> list = eqService.eqmnList(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
		
		Gson jList = new Gson();
		
		return jList.toJson(list) ;
	}
	
	
	//ajax로 단일조회)호출
	@RequestMapping(value="/callOneEqmnAjax.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String callOneEqmnAjax(String eqpmnId ) {
		EqmnVO vo = new EqmnVO(); //기본생성자로 인한 객체생성
		//찾을 칼럼의 key 단일조회
		vo.setEqpmnId(eqpmnId);
		System.out.println(vo);
		List<EqmnVO> list = eqService.eqmnList(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
		System.out.println("eqmn가는 페이지 : "+list);
		
		Gson jList = new Gson();
		
		return jList.toJson(list) ;
	}
	

	//한글 반환시 produces = "application/text; charset=utf8"로 인코딩 방식을 정해줘서 반환시켜줌
	@RequestMapping(value="/ajaxEqmnList.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajaxEqmnList(EqmnVO vo) {
		//매개변수로 넣을 Rvo를 만들어줌
		//CompVO Rvo = new CompVO(); //기본생성자로 인한 객체 생성
		System.out.println(vo);
		//조건이 있으면 vo에 값이 담길것이고 where 절에 조건문이 돌아감.
		List<EqmnVO> list = eqService.CallEqmnTree();  //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
		Gson jList = new Gson();
		
		return jList.toJson(list) ;
	}
	
	//등록
	//한글 반환시 produces = "application/text; charset=utf8"로 인코딩 방식을 정해줘서 반환시켜줌
	@RequestMapping(value="/doAddAjax.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String doAddAjax(EqmnVO vo,HttpServletRequest request) {
		//세션기능가진  인터페이스
				HttpSession session = request.getSession();
				//세션 map으로 캐스팅
				@SuppressWarnings("unchecked")
				Map<String, Object> session2 = (Map<String, Object>) session.getAttribute("userInfo");
				//세션에서 가져온 유저일렬번호 오브젝트를 string 
				String id = String.valueOf(session2.get("userSn"));
				//string -> int 로 
				int userSn= Integer.parseInt(id);
				
				//vo에넣기
				vo.setFrstRegisterSn(userSn);
		//등록
		 int result = eqService.doAddAjax(vo);
		 if(result ==1) {
			 return "succ";
		 }
		
		return "fail" ;
	}
	//최상위 계층 등록 //1정상 -1예외 -2중복
	//한글 반환시 produces = "application/text; charset=utf8"로 인코딩 방식을 정해줘서 반환시켜줌
	@RequestMapping(value="/doAddRAjax.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String doAddRAjax(EqmnVO vo,HttpServletRequest request) {
		//세션기능가진  인터페이스
		HttpSession session = request.getSession();
		//세션 map으로 캐스팅
		@SuppressWarnings("unchecked")
		Map<String, Object> session2 = (Map<String, Object>) session.getAttribute("userInfo");
		//세션에서 가져온 유저일렬번호 오브젝트를 string 
		String id = String.valueOf(session2.get("userSn"));
		//string -> int 로 
		int userSn= Integer.parseInt(id);
		vo.setFrstRegisterSn(userSn);
		//vo에넣기
		//등록
		int result = eqService.doAddRAjax(vo);
		if(result ==1) {
			return "succ";
		}else if (result == -2) {
			return "exist";
		}
		
		return "fail" ;
	}
	
	//수정
	//한글 반환시 produces = "application/text; charset=utf8"로 인코딩 방식을 정해줘서 반환시켜줌
	@RequestMapping(value="/eqpmnModiDo.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String eqpmnModiDo(EqmnVO vo, HttpServletRequest request) {
		//세션기능가진  인터페이스
		HttpSession session = request.getSession();
		//세션 map으로 캐스팅
		@SuppressWarnings("unchecked")
		Map<String, Object> session2 = (Map<String, Object>) session.getAttribute("userInfo");
		//세션에서 가져온 유저일렬번호 오브젝트를 string 
		String id = String.valueOf(session2.get("userSn"));
		//string -> int 로 
		int userSn= Integer.parseInt(id);
		vo.setUpdusrSn(userSn);
		//vo에넣기
		//수정 : 1이상이면 성공 -1이면 에러(rollback) 0이면 업데이트느 되었으나 0건 
		int result = eqService.eqpmnModiDo(vo);
		if(result >0) {
			return "succ";
		}else if (result == -1) {
			return "error";
		}
		
		return "fail" ;
	}
	//삭제
	//한글 반환시 produces = "application/text; charset=utf8"로 인코딩 방식을 정해줘서 반환시켜줌
	@RequestMapping(value="/eqpmnDelAjax1.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String eqpmnDelAjax1(EqmnVO vo) {
		System.out.println(vo);
		//수정 : 1이상이면 성공 -1이면 에러(rollback) 0이면 업데이트느 되었으나 0건 
		int result = eqService.eqpmnDelAjax(vo);
		if(result >0) {
			return "succ";
		}else if (result == -1) {
			return "error";
		}else if (result ==-2) {
			return "child";
		}
		
		return "fail" ;
	}
	
	
	
	
	//commandMap 설정 test
	@RequestMapping("/test2.do")
	public String test(@RequestParam Map<String, Object> commandMap ) {
		System.out.println(commandMap);
		/*
		 * if(commandMap.isEmpty() == false){ Iterator<Entry<String,Object>> iterator =
		 * commandMap.getMap().entrySet().iterator(); Entry<String,Object> entry = null;
		 * while(iterator.hasNext()){ entry = iterator.next();
		 * System.out.println("key : "+entry.getKey()+", value : "+entry.getValue()); }
		 * }
		 */
		
		return "eqmn/eqmn";
	}
}

