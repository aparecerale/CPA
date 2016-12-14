package myPackage;

import java.sql.*;

public class MySQL {

    // JDBC 驱动名及数据库 URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/info";
    //static final String DB_URL = "jdbc:mysql://27.54.227.50/movie";
    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "root";
    //static final String USER = "movie";
    static final String PASS = "zcpqweqwe123";
    //static final String PASS = "caishangqiu123";

    public static void main(String[] args) {
        String[] result = movie_info("avatar");
    }

    public static String[] movie_info(String movie_title) {
        movie_title = movie_title.toLowerCase().trim();
        Connection conn = null;
        Statement stmt = null;
        try {
            // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");

            // 打开链接
            //System.out.println("连接数据库...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // 执行查询
            //System.out.println(" 实例化Statement对...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT director_name, genres, actor_1_name, movie_title, movie_imdb_link, language, country, imdb_score FROM movie_metadata";
            ResultSet rs = stmt.executeQuery(sql);
            int row = 1;
            // 展开结果集数据库
            while (rs.next()) {
                // 通过字段检索
                String director_name = rs.getString("director_name"),
                        genres = rs.getString("genres"),
                        actor_1_name = rs.getString("actor_1_name"),
                        movie_imdb_link = rs.getString("movie_imdb_link"),
                        //movie_name = rs.getString("movie_title").toString().trim().toLowerCase(),
                        language = rs.getString("language"),
                        country = rs.getString("country"),
                        imdb_score = rs.getString("imdb_score"),
                        movie_name = rs.getString("movie_title").toString().trim().toLowerCase().replaceAll("\\u00A0","").replaceAll("[:\\\\/*\"?|<>']", "");

                //System.out.println(movie_name);
                if (movie_name.contains(movie_title)) {
                    //System.out.println(director_name);
                    String[] result = new String[8];
                    result[0] = director_name;
                    result[1] = genres;
                    result[2] = actor_1_name;
                    result[3] = movie_imdb_link;
                    result[4] = language;
                    result[5] = country;
                    result[6] = imdb_score;
                    result[7] = row + "";
                    return result;
                }

                row++;
            }
            // 完成后关闭
            rs.close();
            stmt.close();
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
        return null;
    }

    public static String findMovieTitle(int row) {
        //movie_title = movie_title.toLowerCase().trim();
        Connection conn = null;
        Statement stmt = null;
        try {
            // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");

            // 打开链接
            //System.out.println("连接数据库...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // 执行查询
            //System.out.println(" 实例化Statement对...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM movie_metadata";
            ResultSet rs = stmt.executeQuery(sql);

            // 展开结果集数据库
            for (int i = 0; i < row - 1; i++){
                rs.next();
            }
            //rs.next();
                // 通过字段检索
            String movie_name = rs.getString("movie_title").toString();

            // 完成后关闭
            rs.close();
            stmt.close();
            conn.close();

            return movie_name;
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
        return null;
    }
}