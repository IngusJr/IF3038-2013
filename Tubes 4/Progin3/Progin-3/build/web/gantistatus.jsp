<%@ page import="java.sql.*"%>
<%
   Connection con=null;
   Statement st=null;
   ResultSet rs=null;
   String ID_tugas=new String("");
   ID_tugas=request.getParameter("ID_tugas");
   Class.forName("com.mysql.jdbc.Driver");
   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
  
   st=con.createStatement();
   rs=st.executeQuery("SELECT * FROM tugas1 WHERE ID_tugas='"+ID_tugas+"';");
   rs.next();
   String status=new String("");
   status=rs.getString("status");
   if (status.equals("belum")) {st.executeUpdate("UPDATE tugas1 SET status='sudah' WHERE ID_tugas='"+ID_tugas+"';");};
   if (status.equals("sudah")) {st.executeUpdate("UPDATE tugas1 SET status='belum' WHERE ID_tugas='"+ID_tugas+"';");};
   if (status.equals("belum")) {out.print("sudah");};
   if (status.equals("sudah")) out.print("belum");
   
   
    
   //st.executeQuery("UPDATE tugas1 SET status='"++"';");
%>