package com.mmmooonnn.test;

import org.mindrot.jbcrypt.BCrypt;

public class dinew {
	public static void main(String[] args) {

		
		String password = "123456";
		
		String newPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		System.out.println(newPassword);
		

	}
}
