<%@ page import="java.sql.*"%>
<%
    String username=new String(request.getParameter("username"));
    String email=new String(request.getParameter("email"));
   String nama=new String(request.getParameter("nama"));
    String password=new String(request.getParameter("pass"));
    String tanggal_lahir=new String(request.getParameter("ultah"));
    String ava=new String(request.getParameter("ava"));
    out.print(username);out.print(email);
    Connection con= null;
    ResultSet rst=null;
    Statement st=null;
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
    st=con.createStatement();
    
    //if (!ava.equals("") && ava != null) {st.executeUpdate("UPDATE user1 SET avatar='"+ava+"' WHERE username='"+username+"';");};
    if (email!=null && nama!=null && password!=null && tanggal_lahir!=null && ava!=null ) {
    if (!email.equals("") && email != null) {st.executeUpdate("UPDATE user1 SET email='"+email+"' WHERE username='"+username+"';");};
    if (!nama.equals("") && nama != null) {st.executeUpdate("UPDATE user1 SET nama_lengkap='"+nama+"' WHERE username='"+username+"';");};
    if (!password.equals("") && password != null) {st.executeUpdate("UPDATE user1 SET password='"+password+"' WHERE username='"+username+"';");};
    if (!tanggal_lahir.equals("") && tanggal_lahir != null) {st.executeUpdate("UPDATE user1 SET tanggal_lahir='"+tanggal_lahir+"' WHERE username='"+username+"';");};};

%>