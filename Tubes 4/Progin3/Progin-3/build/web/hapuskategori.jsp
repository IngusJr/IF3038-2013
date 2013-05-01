<%@ page import="java.sql.*"%>
<%
    String kategori=new String(request.getParameter("kategori"));
    Connection con=null;
    ResultSet rst=null;
    Statement st=null;
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
    st=con.createStatement();
    st.executeUpdate("DELETE FROM kategori_tugas1 WHERE kategori='"+kategori+"';");
    out.print("kategori "+kategori+" terhapus");
%>