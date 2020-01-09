package kh.init.configuration;

import java.util.Random;

public class Utils {
		
	public static String generateCertNum() {
		int certNumLength = 6;
		
		Random random = new Random(System.currentTimeMillis());
		
		int range = (int) Math.pow(10, certNumLength);
		int trim = (int) Math.pow(10, certNumLength-1);
		int result = random.nextInt(range)+trim; 
		
		if(result > range) {
			result = result - trim;
		}		
		return String.valueOf(result);
	}
	
	public static String generateCertChar() {
		int certCharLength = 8;
		char[] charTbl = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 
				          'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 
				          'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'};
	
		Random random = new Random(System.currentTimeMillis());
		int tblLength = charTbl.length;
		StringBuffer buf = new StringBuffer();
		
		for(int i = 0; i < certCharLength; i++) {
			buf.append(charTbl[random.nextInt(tblLength)]);
		}
		return buf.toString();
	}
}
