package myPackage;

import java.sql.*;

/**
 * Created by Autman on 12/9/16.
 */
public class userRating {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/info";
    //static final String DB_URL = "jdbc:mysql://27.54.227.50/movie";
    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "root";
    //static final String USER = "movie";
    static final String PASS = "zcpqweqwe123";

    public static void main(String[] args){
        build(4, 4, 4);
    }

    public static void build(int user_id, int movie_id, double rating) {
        //movie_title = movie_title.toLowerCase().trim();
        Connection conn = null;
        Statement stmt = null;
        try {
            // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");

            // 打开链接
            //System.out.println("连接数据库...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String query = " insert into userRating (user_id, movie_id, rating)"
                    + " values (?, ?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setInt (1, user_id);
            preparedStmt.setInt (2, movie_id);
            preparedStmt.setDouble   (3, rating);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        } catch (SQLException se) {
            // 处理 JDBC 错误
            se.printStackTrace();
        } catch (Exception e) {
            // 处理 Class.forName 错误
            e.printStackTrace();
        } finally {
            // 关闭资源
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se2) {
            }// 什么都不做
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        //System.out.println("Goodbye!");

    }
}
