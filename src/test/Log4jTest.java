package test;

import org.apache.log4j.Logger;

public class Log4jTest {
    // 获取日志记录器
    private static final Logger logger = Logger.getLogger(Log4jTest.class);

    public static void main(String[] args) {
        // 测试不同级别的日志
        logger.debug("This is a DEBUG message.");
        logger.info("This is an INFO message.");
        logger.warn("This is a WARN message.");
        logger.error("This is an ERROR message.");
        logger.fatal("This is a FATAL message.");

        // 模拟一个异常
        try {
            int result = 10 / 0;
        } catch (Exception e) {
            logger.error("An exception occurred", e);
        }
    }
}