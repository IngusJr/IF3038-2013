<%@ page import="java.sql.*" %>
<%
    String username=new String(request.getParameter("username"));
    String namabaru=new String(request.getParameter("nama"));
    String passbaru=new String(request.getParameter("pass"));
    String ultahbaru=new String(request.getParameter("ultah"));
    String emailbaru=new String(request.getParameter("email"));
    Connection con=null;
    ResultSet rst=null;
    Statement st=null;
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
    st=con.createStatement();
    rst=st.executeQuery("SELECT * FROM user1 WHERE username='"+username+"';");
    rst.next();
    String namalama=new String(rst.getString("nama_lengkap"));
    String passlama=new String(rst.getString("password"));
    String ultahlama=new String(rst.getString("tanggal_lahir"));
    String emaillama=new String(rst.getString("email"));
    
    if (namalama.equals(namabaru)) {out.print("Nama lama sama dengan nama baru!<br>");};
    if (emaillama.equals(emailbaru)) {out.print("Email lama sama dengan email baru!<br>");};
    if (ultahlama.equals(ultahbaru)) {out.print("Ultah lama sama dengan ultah baru!<br>");};
    if (passlama.equals(passbaru)) {out.print("Password lama sama dengan password baru!<br>");};
    
%>  