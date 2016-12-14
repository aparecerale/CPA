package myPackage;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by Autman on 12/9/16.
 */
public class recommendation {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/info";
    //static final String DB_URL = "jdbc:mysql://27.54.227.50/movie";
    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "root";
    //static final String USER = "movie";
    static final String PASS = "zcpqweqwe123";
    //static final String PASS = "caishangqiu123";

    public static ArrayList<String> findResult(int user_id) {
        ArrayList<String> recommendedMovies = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        try{
            // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");

            // 打开链接
            //System.out.println("连接数据库...");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

            // 执行查询
            //System.out.println(" 实例化Statement对...");
            stmt = conn.createStatement();
            String sql;
            System.out.println(user_id);
            sql = " SELECT user_id, movie_title FROM result ORDER BY rating DESC";
            ResultSet rs = stmt.executeQuery(sql);

            // 展开结果集数据库
            while(rs.next()){
                // 通过字段检索
                int id = rs.getInt("user_id");
                //System.out.println(id);
                String movie_title = rs.getString("movie_title");

                if (id == user_id){
                    recommendedMovies.add(movie_title);
                }
                //recommendedMovies.add(movie_title);

//                // 输出数据
//                System.out.print("ID: " + id);
//                System.out.print(", User_Name: " + name);
//                System.out.print(", Password: " + password);
//                System.out.print("\n");
            }
            // 完成后关闭
            rs.close();
            stmt.close();
            conn.close();
            return recommendedMovies;
        }catch(SQLException se){
            // 处理 JDBC 错误
            se.printStackTrace();
        }catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
        }finally{
            // 关闭资源
            try{
                if(stmt!=null) stmt.close();
            }catch(SQLException se2){
            }// 什么都不做
            try{
                if(conn!=null) conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
        }
        //System.out.println("Goodbye!");
        return recommendedMovies;
    }

    public static void main(String[] args){
        ArrayList<String> result = findResult(1);
    }
}
