<%@ page import="java.sql.*"%>
<%
    Connection con=null;
    ResultSet rst=null;
    Statement st=null;
    con=DriverManager.getConnection("jdbc:mysql://localhost/progin_405_13510099","progin","progin");
    st=con.createStatement();
    
    

    
%>