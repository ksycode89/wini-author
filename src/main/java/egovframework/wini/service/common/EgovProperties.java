package egovframework.wini.service.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;

public class EgovProperties {

    // 프로퍼티값 로드시 에러발생하면 반환되는 에러문자열
    public static final String ERR_CODE = " EXCEPTION OCCURRED";
    public static final String ERR_CODE_FNFE = " EXCEPTION(FNFE) OCCURRED";
    public static final String ERR_CODE_IOE = " EXCEPTION(IOE) OCCURRED";

    // 파일구분자
    static final char FILE_SEPARATOR = File.separatorChar;

    public static final String RELATIVE_PATH_PREFIX = EgovProperties.class
            .getResource("")
            .getPath()
            .substring(
                    0,
                    EgovProperties.class.getResource("").getPath()
                            .lastIndexOf("com"));

    public static final String GLOBALS_PROPERTIES_FILE = RELATIVE_PATH_PREFIX
            + "egovProps" + System.getProperty("file.separator")
            + "globals.properties";

    /**
     * 인자로 주어진 문자열을 Key값으로 하는 프로퍼티 값을 반환한다(Globals.java 전용)
     * 
     * @param keyName
     *            String
     * @return String
     */
    public static String getProperty(String keyName) {
        String value = ERR_CODE;
        value = "99";
        debug(GLOBALS_PROPERTIES_FILE + " : " + keyName);
        FileInputStream fis = null;
        try {
            Properties props = new Properties();
            fis = new FileInputStream(
                    EgovWebUtil.filePathBlackList(GLOBALS_PROPERTIES_FILE));
            props.load(new java.io.BufferedInputStream(fis));
            if (props.getProperty(keyName) != null) { // 시큐어코딩 NULL_RETURN_STD
                                                      // 적용
                value = props.getProperty(keyName).trim();
            }
        } catch (FileNotFoundException fne) {
            debug(fne);
        } catch (IOException ioe) {
            debug(ioe);
        } catch (Exception e) {
            debug(e);
        } finally {
            try {
                if (fis != null)
                    fis.close();
            } catch (IOException ioe) {
                debug(ioe);
            } catch (Exception ex) {
                // ex.printStackTrace();
                // System.out.println("IGNORE: " + ex); // 2011.10.10 보안점검 후속조치
                Logger.getLogger(EgovProperties.class).debug(
                        "IGNORED: " + ex.getMessage());
            }

        }
        return value;
    }
    
    /**
     * 시스템 로그를 출력한다.
     * 
     * @param obj
     *            Object
     */
    private static void debug(Object obj) {
        if (obj instanceof java.lang.Exception) {
            Logger.getLogger(EgovProperties.class).debug(
                    "IGNORED: " + ((Exception) obj).getMessage());
        }
    }

}
