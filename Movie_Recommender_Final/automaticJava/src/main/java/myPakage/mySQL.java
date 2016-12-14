package myPakage;

import java.io.PrintWriter;
import java.sql.*;

public class mySQL{
    public static void genOriginData(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/info","root","zcpqweqwe123");
            //here sonoo is database name, root is username and password
            Statement stmt = conn.createStatement();
            ResultSet rs=stmt.executeQuery("select * from userRating");
            PrintWriter writer = new PrintWriter("input/userRating.txt", "UTF-8");
            //writer.close();
            while(rs.next()){
                writer.println(rs.getInt(2)+","+rs.getString(3)+","+rs.getString(4));
                //System.out.println(rs.getInt(2)+"  "+rs.getString(3)+"  "+rs.getString(4));
            }
            writer.close();
                //System.out.println(rs.getInt(2)+"  "+rs.getString(3)+"  "+rs.getString(4));
            conn.close();
        }catch(Exception e){
            System.out.println(e);
        }
    }

    public static void genResult(int user_id, String movie_title, double rating){
        try
        {
            // create a mysql database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/info","root","zcpqweqwe123");

//            // create a sql date object so we can use it in our INSERT statement
//            Calendar calendar = Calendar.getInstance();
//            java.sql.Date startDate = new java.sql.Date(calendar.getTime().getTime());

            // the mysql insert statement
            Statement st = conn.createStatement();

            // note that i'm leaving "date_created" out of this insert statement
            st.executeUpdate("INSERT INTO `result`(user_id, movie_title, rating) VALUE ("+user_id+",'"+movie_title+"',"+rating+")");

            conn.close();
        }
        catch (Exception e)
        {
            System.err.println("Got an exception!");
            System.err.println(e.getMessage());
        }
    }

    public static void deleteResult() {
        try
        {
            // create the mysql database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/info","root","zcpqweqwe123");

            // create the mysql delete statement.
            // i'm deleting the row where the id is "3", which corresponds to my
            // "Barney Rubble" record.
            String query = "delete from result";
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            //preparedStmt.setInt(1, 3);

            // execute the preparedstatement
            preparedStmt.execute();

            conn.close();
        }
        catch (Exception e)
        {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
        }

    }

//    public static void main(String[] args){
//        deleteResult();
//        genResult(1, "a", 1.2);
//        genResult(2, "b", 2.3);
//
//    }
}  