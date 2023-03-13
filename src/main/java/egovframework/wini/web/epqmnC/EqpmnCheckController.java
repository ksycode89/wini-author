package egovframework.wini.web.epqmnC;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import egovframework.wini.service.eqmnC.EqmnCService;

@Controller
@EnableWebMvc
public class EqpmnCheckController {
	
	@Resource(name="EqmnCService")
	EqmnCService eqCService;
	
	//장비관리 이동
		@GetMapping("/goEqmentC.do")
		public String goEqmentC() {
			
			return "eqmn/eqmnC";
		}
}
