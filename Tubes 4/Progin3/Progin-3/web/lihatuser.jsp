<%-- 
    Document   : lihatuser, melihat profil user lain
    Created on : 12 Apr 13, 14:45:44
    Author     : rahmi
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ page language="java" import="helper.MyDatabase,java.sql.ResultSet;" errorPage="" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>

<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
%>
<%
if(session.getAttribute("sUsername") == null || session.getAttribute("sUsername").equals(""))
{
response.sendRedirect("index.jsp?error=Belom Login");
}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link rel="stylesheet" type="text/css" href="css/profil.css">
        <title>Profil Asignee</title> 
    </head>
    <body>
        <div id="profile-header">  
            <h1>User <% out.println(" "+ request.getAttribute("tUsername") + " "); // ceritanya mau ngambil nama user yang diklik%></h1>
        </div>
        <div id="profile-biodata">
            <h4> Username 	:<% /*(String)session.getAttribute("sUsername"); */out.println(" "+ request.getAttribute("username") + " "); %>	</h4>
            <h4> Nama Lengkap 	:<% /*(String)session.getAttribute("sFullName");*/ out.println(" "+ request.getAttribute("nama_lengkap") + " "); %>	</h4>
            <h4> Tanggal lahir 	:<% /*(String)session.getAttribute("sBirth");*/ out.println(" "+ request.getAttribute("tanggal_lahir") + " "); %>	</h4>
            <h4> Email 		:<% /*(String)session.getAttribute("sEmail");*/ out.println(" "+ request.getAttribute("email") + " "); %>	</h4>
        </div>   
       
            <%--
            /* String tQuery = "SELECT * FROM user1 WHERE username='"+tUsername+"' AND password='"+tPassword+"';";              
            try
            {
                ResultSet tResult = MyDatabase.getSingleton().selectDB(tQuery);
                while (result.next()) { 
                    request.getAttribute("tAvatar",tResult.getString("avatar"));
                    request.getAttribute("tUsername",tResult.getString("username"));
                    request.getAttribute("tFullName",tResult.getString("nama_lengkap"));
                    request.getAttribute("tBirth",tResult.getString("tanggal_lahir"));
                    request.getAttribute("tEmail",tResult.getString("email"));
                    response.sendRedirect("mainpage.jsp"); } 
            } catch (Exception e) {
                e.printStackTrace(); } */
            
            String value = request.getParameter("textvalue");
            query = new StringBuilder();
            query.append("SELECT * ");
            query.append("FROM user1 ");
            ResultSet users = MyDatabase.getSingleton().selectDB(query.toString());
                while(users.next()) {
                    out.println("<img src=\"avatar/"+users.getString("avatar")+"\" width=\"75\" height=\"75\"><br>");
                    out.println("Username : <a href=\"profile.jsp?username="+users.getString("username")+"\">"+users.getString("username")+"</a>");
                    out.println("<br>Nama Lengkap : "+users.getString("nama_lengkap"));
                    out.println("<br>Tanggal Lahir : "+users.getString("tanggal_lahir"));
                    out.println("<br>Email : "+users.getString("email"));
        }
          --%>
           <div id="profile-tugas">
              <h2 id="profile-title"> Tugas </h2>
              <p> ini Task user yang dilihat </p>
              
              <%-- 
                String value = request.getParameter("textvalue");
                ResultSet users = MyDatabase.getSingleton().selectDB(query.toString());
                query = new StringBuilder();
                query.append("SELECT * ");
                query.append("FROM tugas1 ");
                query.append("WHERE pembuat_tugas= "'users.getString("username")';");
                    while(users.next()) {
                        out.println("<br>Task : "+tugas.getString("ID_tugas"));
                    }
              --%>
          </div>
    </body>
</html>
