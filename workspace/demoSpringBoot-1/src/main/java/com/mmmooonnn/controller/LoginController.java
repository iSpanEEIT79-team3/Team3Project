package com.mmmooonnn.controller;

import java.io.OutputStream;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import cn.hutool.captcha.generator.RandomGenerator;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
public class LoginController {

	
	@RequestMapping("/captcha")
	public void Captcha(HttpServletResponse response , HttpSession session) {
//		//定義圖形驗證碼的長和寬
//		LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(200, 100);
//		//圖形驗證碼寫出，可以寫出到文件，也可以寫出到流
//		lineCaptcha.write("c:/temp/line.png");
//		//輸出code
//		Console.log(lineCaptcha.getCode());
//		//驗證圖形驗證碼的有效性，返回boolean值
//		lineCaptcha.verify("1234");
//		//重新生成驗證碼
//		lineCaptcha.createCode();
//		lineCaptcha.write("c:/temp/line.png");
//		//新的驗證碼
//		Console.log(lineCaptcha.getCode());
//		//驗證圖形驗證碼的有效性，返回boolean值
//		lineCaptcha.verify("1234");
		
		RandomGenerator randomGenerator = new RandomGenerator("0123456789",4);
		LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(200, 100);
		lineCaptcha.setGenerator(randomGenerator);
		
		lineCaptcha.createCode();
		String code = lineCaptcha.getCode();
		
		
		session.setAttribute("captchaCode", code);
		
		
        response.setContentType("image/png"); 
		
		try (OutputStream outputStream = response.getOutputStream()){
			//輸出內容
			lineCaptcha.write(outputStream);
			outputStream.flush();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	@PostMapping("/verifyCaptcha")
	public boolean verifyCaptcha(HttpSession session,@RequestParam("captcha") String captcha) {
		
		String captchaCode = (String) session.getAttribute("captchaCode");
		return captchaCode !=null && captchaCode.equalsIgnoreCase(captcha);
		
	}
}
