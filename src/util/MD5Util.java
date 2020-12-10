package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5Util {
	
	public static String md5(String src){
		try {
			MessageDigest md=MessageDigest.getInstance("MD5");
			
			byte[] b=md.digest(src.getBytes());
			
			BASE64Encoder encoder=new BASE64Encoder();
			return encoder.encode(b);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}
}
