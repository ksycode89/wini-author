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
	public List<Map<String,Object>> getEqmentList(@RequestParam Map<String, Object> commandMap) {
		List<Map<String,Object>> result = eqmnStatService.getEqmnList(commandMap);
		return result;
	}
//	// 리스트 조회
//	@RequestMapping("getEqmentList2.do")
//	@ResponseBody
//	public List<Map<String,Object>> getEqmentList2(@RequestParam Map<String, Object> commandMap) {
//		List<Map<String,Object>> result = eqmnStatService.getEqmnList(2);
//		return result;
//	}
	
	// 통계 조회
	@RequestMapping("getStat.do")
	@ResponseBody
	public Map<String, Object> getStat(@RequestParam Map<String, Object> commandMap) {
		Map<String, Object> result = eqmnStatService.getStat(commandMap);
		return result;
	}
}
