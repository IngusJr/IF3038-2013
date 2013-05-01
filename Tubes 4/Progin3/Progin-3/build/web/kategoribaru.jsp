<%@ page import="java.sql.*"%>
<%
    String username="username2"; //sementara masukin username pembuat dari sini, belum dari session
    String nama_kategori=request.getParameter("nama_kat");
    String userberhak=new String("");
    userberhak=request.getParameter("userberhak");
   
    Connection con=null;
    ResultSet rst=null;
    Statement st=null;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
    st=con.createStatement();
         
    st.executeUpdate("INSERT INTO kategori_tugas1 VALUES ('"+username+"','"+nama_kategori+"','"+userberhak+"');");
       
    out.print("kategori telah berhasil dibuat!");
   %>kategori beres
