package com.jk.controller.zxt;

import com.jk.pojo.LogPojo;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

@Aspect
@Component
@Configuration
@EnableAspectJAutoProxy
public class AopDemo {


    @Autowired
    private MongoTemplate mongoTemplate;


    //returnVals:返回值      method :方法的对象        params: 方法的参数    url：实现类的类路径
    @AfterReturning("execution(* com.jk.service.impl.*.*(..))")
    public void applause(JoinPoint jp) {
        System.out.println("123123-------------------");
        LogPojo logPojo = new LogPojo();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        logPojo.setActtime(df.format(new Date()));
        logPojo.setMethodname("方法名:" + jp.getSignature().getName());
        logPojo.setReturnvals("类名:" + jp.getSignature().getDeclaringTypeName());
        String parameters = "";
        Object[] args = jp.getArgs();
        for (int i = 0; i < args.length; i++) {
            parameters += "参数:[" + i + "]:" + args[i].toString();
        }
        logPojo.setParams(parameters);
        logPojo.setUrlstr("普通请求");
        mongoTemplate.insert(logPojo);
    }


    @AfterThrowing(pointcut = "execution(* com.jk.service.impl.*.*(..))",throwing = "e")
    public void logAfterThrowing(JoinPoint jp,ArithmeticException e){

        String methodName = jp.getSignature().getName();
        System.out.println("The method " + methodName + " occurs excetion:" + e);

    }




}
