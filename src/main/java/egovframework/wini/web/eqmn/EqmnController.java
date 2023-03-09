package egovframework.wini.web.eqmn;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

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
	
	@RequestMapping("/goEqment.do")
	public String goEqment(Model mo ) {
		System.out.println(123);
		EqmnVO vo = new EqmnVO(); //기본생성자로 인한 객쳇애성
		List<EqmnVO> list = eqService.eqmnList(vo); //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
		System.out.println("eqmn가는 페이지 : "+list);
		mo.addAttribute("eqmnList",list);                //모델에 담아서 전송
		return "eqmn/eqmn";
	}

	//한글 반환시 produces = "application/text; charset=utf8"로 인코딩 방식을 정해줘서 반환시켜줌
	@RequestMapping(value="/ajaxEqmnList.do",method=RequestMethod.POST,produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajaxEqmnList(EqmnVO vo) {
		//매개변수로 넣을 Rvo를 만들어줌
		//CompVO Rvo = new CompVO(); //기본생성자로 인한 객체 생성
	
		//조건이 있으면 vo에 값이 담길것이고 where 절에 조건문이 돌아감.
		List<EqmnVO> list = eqService.CallEqmnTree();  //list의 결과값 (빈값을 넘겨줄시 where절에서 알아서 처리)
		Gson jList = new Gson();
		
		return jList.toJson(list) ;
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

