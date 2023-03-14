package egovframework.wini.web.eqmnSTAT;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import egovframework.wini.service.eqmnSTAT.EqmnSTATService;


@Controller
@EnableWebMvc
public class EqmnSTATController {
	@Resource(name = "eqmnStatService")
	private EqmnSTATService eqmnStatService;
	
	// 통계 페이지 이동
	@RequestMapping("goEqmentStat.do")
	public String eqmnStat() {
		return "eqmn/eqmnSTAT";
	}
	
	// 리스트 조회
	@RequestMapping("getEqmentList.do")
	@ResponseBody
	public List<Map<String,Object>> duplicateCheck() {
		List<Map<String,Object>> result = eqmnStatService.getEqmnList();
		return result;
	}
	
	// 통계 조회
	@RequestMapping("getStat.do")
	@ResponseBody
	public Map<String, Object> getStat(@RequestParam Map<String, Object> commandMap) {
		Map<String, Object> result = eqmnStatService.getStat(commandMap);
		return result;
	}
}
