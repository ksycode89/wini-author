package egovframework.wini.web.eqmnM;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.google.gson.Gson;

import egovframework.wini.service.eqmn.EqmnService;
import egovframework.wini.service.eqmn.EqmnVO;
import egovframework.wini.service.eqmnM.EqmnMService;
import egovframework.wini.service.eqmnM.EqmnMVO;

@Controller
@EnableWebMvc
public class EqmnMController {
	
	@Resource(name="EqmnMService")
	EqmnMService eqMService;
	
	//장비관리 이동
	@GetMapping("/goEqmentM.do")
	public String goEqmentM() {
		
		return "eqmn/eqmnM";
	}
	//장비테이블 불러오기
	@RequestMapping(value="/callEqpmnMain.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String callEqpmnMain() {
		EqmnMVO vo = new EqmnMVO(); //기본생성자로 인한 객체생성
		
		List<EqmnMVO> list = eqMService.callEqpmnMain(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
		
		Gson jList = new Gson();
		
		return jList.toJson(list) ;
	}
	//장비테이블 상세 불러오기
	@RequestMapping(value="/callEqmnMDetailAjax.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String callEqmnMDetailAjax(EqmnMVO vo) {
		System.out.println(vo);
		List<EqmnMVO> list = eqMService.callEqpmnMain(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
		
		Gson jList = new Gson();
		
		return jList.toJson(list) ;
	}
	//장비테이블입력
	@RequestMapping(value="/insertEqpmnMAjax.do",method=RequestMethod.POST)
	@ResponseBody
	public String insertEqpmnMAjax(EqmnMVO vo) {
		System.out.println(vo);
		int result = eqMService.insertEqpmnMAjax(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
		System.out.println("result : "+result);
		if(result ==1) {
			return "succ";
		}
		
		return "fail" ;
	}
	//장비테이블 수정
	@RequestMapping(value="/eqpmnModiDoAjax.do",method=RequestMethod.POST)
	@ResponseBody
	public String eqpmnModiDoAjax(EqmnMVO vo) {
		System.out.println(vo);
		int result = eqMService.eqpmnModiDoAjax(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
		System.out.println("result : "+result);
		if(result >0) {
			return "succ";
		}
		
		return "fail" ;
	}
	//장비테이블 삭제
	@RequestMapping(value="/eqpmnDelAjax.do",method=RequestMethod.POST)
	@ResponseBody
	public String eqpmnDelAjax(EqmnMVO vo) {
		System.out.println(vo);
		int result = eqMService.eqpmnDelAjax(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
		System.out.println("result : "+result);
		if(result >0) {
			return "succ";
		}
		
		return "fail" ;
	}
}
