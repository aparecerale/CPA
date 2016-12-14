<%@ page c%> 
<%@ page import="java.util.*"%> 
<%@ page import="java.sql.*"%> 
 
<%Class.forName("com.mysql.jdbc.Driver").newInstance();  
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/test","root","");  
Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);  
String sql = "select * from test";  
ResultSet rs = stmt.executeQuery(sql);  
 
while(rs.next()){ %> 
您的第一个字段内容为:<%=rs.getString(1)%> 
您的第二个字段内容为:<%=rs.getString(2)%> 
<%}%> 
<%out.print("数据库操作成功,恭喜您");%> 
<% rs.close();  
stmt.close();  
conn.close();  
%> 