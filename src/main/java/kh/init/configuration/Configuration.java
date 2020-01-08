package kh.init.configuration;

import java.math.BigInteger;
import java.security.MessageDigest;

import org.springframework.stereotype.Repository;

@Repository
public class Configuration {
	public static String encrypt(String pw) throws Exception{
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		digest.reset();
		digest.update(pw.getBytes("utf8"));
		String result = String.format("%064x", new BigInteger(1, digest.digest()));
		return result;
	}
}   