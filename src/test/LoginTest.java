package test;

import com.example.pgms.daoImpl.UserDAOImpl;

public class LoginTest {
    public static void main(String[] args) {
        // 创建 UserDAOImpl 实例
        UserDAOImpl userDAO = new UserDAOImpl();
        // 模拟用户输入的用户名和密码
        String userid = "2";
        String password = "123456aA.";

        // 调用 available 方法进行登录验证
        boolean isAvailable = userDAO.available(userid, password);

        if (isAvailable) {
            System.out.println("用户 " + userid + " 登录成功");
        } else {
            System.out.println("用户 " + userid + " 登录失败，未找到匹配记录");
        }
    }
}