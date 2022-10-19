package ntck.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.mozilla.universalchardet.UniversalDetector;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;

public final class EncodeUtils {
	// https://code.google.com/p/juniversalchardet/
	// http://jchardet.sourceforge.net/
	// http://icu-project.org/apiref/icu4j/
	// http://www.java2s.com/Code/Java/I18N/Howtoautodetectafilesencoding.htm
	public static String detectFileEncoding(String filePath) {
		return detectFileEncoding(new File(filePath));
	}

	public static String detectFileEncoding(File file) {
		java.io.FileInputStream fis = null;
		try {
			fis = new java.io.FileInputStream(file);
			return detectFileEncoding(fis);
		} catch (FileNotFoundException ex) {
			Logger.getLogger(EncodeUtils.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				if (fis != null) {
					fis.close();
				}
			} catch (IOException ex) {
				Logger.getLogger(EncodeUtils.class.getName()).log(Level.SEVERE, null, ex);
			}
		}

		return "UTF-8";
	}

	public static String detectFileEncoding(InputStream fis) {

		try {
			byte[] buf = new byte[4096];
			UniversalDetector detector = new UniversalDetector(null);
            
			int nread;
			while ((nread = fis.read(buf)) > 0 && !detector.isDone()) {
				detector.handleData(buf, 0, nread);
			}
			detector.dataEnd();

			String encoding = detector.getDetectedCharset();
			/*
			 * if (encoding != null) { System.out.println("Detected encoding = " +
			 * encoding); } else { System.out.println("No encoding detected."); }
			 */
			detector.reset();
			if (encoding == null)
				return "UTF-8";
			return encoding;
		} catch (IOException ex) {
			Logger.getLogger(EncodeUtils.class.getName()).log(Level.SEVERE, null, ex);
		}

		return "UTF-8";
	}
	
	public static String Salt() {

		String salt = "";
		try {
			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			byte[] bytes = new byte[16];
			random.nextBytes(bytes);
			salt = new String(Base64.getEncoder().encode(bytes));

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return salt;
	}
	
	public static String shaPasswordEncoderWithSalt(String password, String salt) {
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(512);
		String hashed = encoder.encodePassword(password, salt);
		
		return hashed;
	}

	public static String shaPasswordEncoder(String password) {
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String hashed = encoder.encodePassword(password, null);
		
		return hashed;
	}

	

}
