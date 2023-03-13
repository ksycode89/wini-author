package egovframework.wini.service.impl.eqmnC;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.wini.service.eqmnC.EqmnCService;

@Service("EqmnCService")
public class EqmnCServiceImpl implements EqmnCService {
	
	@Resource(name="eqmnCMapper")
	EqmnCMapper eqCMap;
	
}
