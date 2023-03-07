package egovframework.wini.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Controller
@EnableWebMvc
public class FrontController {
	
	@GetMapping("goMain.do")
	public String goMain() {
		
		return "main/main";
	}
}
