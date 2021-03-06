package com.revature.burndown.aspect;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component("aspect")
public class AspectLogging {

	private Logger log = Logger.getLogger(getClass());

	@Before("execution(* com.revature.burndown.controller.ChartData.authenticateFaceuser*(..))")
    public void log(JoinPoint point) {
        log.info("Validating User Method");
    }
}