package com.hyschool.security;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class PasswordManager {

	private PasswordEncoder encoder;

	/**
	 * Generates a random password with default length
	 * 
	 */
	public String genPassword() {
		return genPassword(8);
	}

	/**
	 * Generates a random password by length
	 * 
	 * @param howmany
	 */
	public String genPassword(int howmany) {

		String ret = "";
		String core = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random rand = new Random();

		for (int i = 0; i < howmany; i++) {
			int thisOne = rand.nextInt(core.length());
			char thisOne2 = core.charAt(thisOne);
			ret += thisOne2;
		}

		return ret;
	}

	/**
	 * 加密密码
	 * @param password
	 * @return
	 */
	public String encryptPassword(String password) {
		return encoder.encode(password);
	}


    /**
     *
     * @param encPass   数据库提取的密码
     * @param rawPass   需要验证的密码
     * @return
     */
	public boolean isPasswordValid(String encPass, String rawPass) {
		return encoder.matches(rawPass, encPass);
	}

	public PasswordEncoder getEncoder() {
		return encoder;
	}

	public void setEncoder(PasswordEncoder encoder) {
		this.encoder = encoder;
	}

}
