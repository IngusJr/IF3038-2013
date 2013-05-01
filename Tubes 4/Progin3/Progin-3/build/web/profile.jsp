<%-- 
    Document   : profile.jsp
    Created on : Apr 13, 2013, 7:46:14 AM
    Author     : Akbar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String username=new String(request.getParameter("username"));%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <script>
   function cekatribut()
  {
    var username="<%out.print(username);%>";
    var pass=document.getElementById("editpassword").value;
    var email=document.getElementById("editemail").value;
    var lahir=document.getElementById("editbirthday").value;
    var nama=document.getElementById("editfullname").value;
    var xmlhttp;
		
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
        
	xmlhttp.onreadystatechange=function()
	{
            if (xmlhttp.readystate == 4 || xmlhttp.status == 200)
            {
        	document.getElementById("notifikasiatribut").innerHTML=xmlhttp.responseText;
            }							
	}
	xmlhttp.open("GET","cekprofilesama.jsp?username="+username+"&nama="+nama+"&pass="+pass+"&ultah="+lahir+"&email="+email,true);
        xmlhttp.send();							
    }

   function updateatribut()
  {
    var username="<%out.print(username);%>".value;
    var pass=document.getElementById("editpassword").value;
    var email=document.getElementById("editemail").value;
    var lahir=document.getElementById("editbirthday").value;
    var nama=document.getElementById("editfullname").value;
    var ava=document.getElementById("namaavatar").value;
    var xmlhttp;
		
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
        
	xmlhttp.onreadystatechange=function()
	{
            if (xmlhttp.readystate == 4 || xmlhttp.status == 200)
            {
        	
            }							
	}
	xmlhttp.open("GET","editatributprof.jsp?username="+username+"&nama="+nama+"&pass="+pass+"&ultah="+lahir+"&email="+email+"&ava="+ava,true);
        xmlhttp.send();							
    }

function checkPassword() {
var pass = document.getElementById("editpassword");
var email=document.getElementById("editemail");
    if(pass.value == "" || pass.value == null)
        {document.getElementById("passwordwarning").innerHTML="*Password tidak boleh kosong";return false;}
    else
    if(pass.value.length<8)
        {document.getElementById("passwordwarning").innerHTML="*Password minimal 8 karakter";return false;}
    else
    if(pass.value == email.value)
        {document.getElementById("passwordwarning").innerHTML="*Password tidak sama dengan e-mail";return false;}
    else
        {document.getElementById("passwordwarning").innerHTML="";return true;}
}

function checkConfirmPassword() {
var pass1=document.getElementById("editpassword");
var pass2=document.getElementById("editconfirmpassword");
    if(pass1.value != pass2.value)
        {document.getElementById("confirmwarning").innerHTML="*Password tidak cocok";return false;}
    else
        {document.getElementById("confirmwarning").innerHTML="";return true;}
}

function checkNama() {
var nama=document.getElementById("editfullname");
    var spacepos=nama.value.indexOf(" ");
    if(nama.value == "" || nama.value == null)
        {document.getElementById("namawarning").innerHTML="*Nama tidak boleh kosong";return false;}
    else
        if(spacepos<0)
            {document.getElementById("namawarning").innerHTML="*Nama minimal 2 kata";return false;}
        else
            {document.getElementById("namawarning").innerHTML="";return true;}
}

function checkEmail() {
	var email=document.getElementById("editemail");
    var atpos=email.value.indexOf("@");
    var dotpos=email.value.lastIndexOf(".");
    if(email.value == "" || email.value == null)
        {document.getElementById("emailwarning").innerHTML="*E-mail tidak boleh kosong";return false;}
    else
        if(atpos<1 || dotpos<atpos+1 || (dotpos+2)>=email.length)
            {document.getElementById("emailwarning").innerHTML=("*e-mail tidak valid");return false;}
        else
            {document.getElementById("emailwarning").innerHTML="";return true;}
}


function check_extension() {
		var filename=document.getElementById("editavatar");
      var re = /\..+$/;
      var ext = filename.match(re);
      if(!(ext==".jpg" || ext==".jpeg"))
           {document.getElementById("avatarwarning").innerHTML="ekstensi file tidak diterima";return false;}
       else
           {document.getElementById("avatarwarning").innerHTML="";return true;}
}


function checkValidation() {
    return (checkPassword() && checkConfirmPassword() && checkNama() && checkEmail());
}

	</script>

    <body>
        <%@ page import="java.sql.*"%>
        <%@ page import="java.util.*"%>
        <%
            Connection con=null;
            ResultSet rst=null;
            Statement st=null;
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
            st=con.createStatement();           
            rst=st.executeQuery("SELECT * FROM user1 WHERE username='"+username+"';");
            String nama=new String("");
            String lahir=new String("");
            String ava=new String("");
            String email=new String("");
            
            ArrayList<String> arr_idtgs=new ArrayList<String>();
            ArrayList<String> arr_stat=new ArrayList<String>();
            ArrayList<String> arr_namatgs=new ArrayList<String>();        
            while (rst.next())
            {
                nama=rst.getString("nama_lengkap");
                lahir=rst.getString("tanggal_lahir");
                ava=rst.getString("avatar");
                email=rst.getString("email");
            }
            
            rst=st.executeQuery("SELECT * FROM asignee_tugas1 WHERE username='"+username+"';");
            
            while (rst.next())
            {
                arr_idtgs.add(rst.getString("ID_tugas"));
            }
            
            out.print("username: "+nama+"<br>");
            out.print("ulang tahun: "+lahir+"<br>");
            %>
            avatar : <img src="avatar/<%out.print(ava);%>"></img><br>
            
            <%
            
            out.print("email: "+email+"<br>");
            
            for (int i=0;i<arr_idtgs.size();i++)
            {
                  rst=st.executeQuery("SELECT * FROM tugas1 WHERE ID_tugas='"+arr_idtgs.get(i)+"';");
                  rst.next();
                  arr_stat.add(rst.getString("status"));
                            arr_namatgs.add(rst.getString("nama_tugas"));
      
            }
            
            out.print("task yang sudah dikerjakan: <br>");
            for (int i=0;i<arr_idtgs.size();i++)
            {
                %>
                <% if (arr_stat.get(i).equals("sudah")) {%><a href="rinciantugas.jsp?ID_tugas=<%out.print(arr_idtgs.get(i));%>"><%out.print(arr_namatgs.get(i));%></a> , <%};%> 
                <%
            }
            
            out.print("<br>task yang sedang dikerjakan: <br>");
            for (int i=0;i<arr_idtgs.size();i++)
            {
                %>
                <% if (arr_stat.get(i).equals("belum")) {%><a href="rinciantugas.jsp?ID_tugas=<%out.print(arr_idtgs.get(i));%>"><%out.print(arr_namatgs.get(i));%></a> , <%};%> 
                <%
            }            
            %><br><br><rb>
                   <b>Form edit profile</b><br>
                   
                        <form action="editprofile.jsp" method="post"  enctype="multipart/form-data">
                            
                         <div id="notifikasiatribut"></div><br>
                       
                        Full name: <input type="text" name="nama" id="editfullname" onkeyup="return (checkNama() & cekatribut());">
			<div id="namawarning"></div><br> 
			Password: <input type="password" name="pass" id="editpassword" onkeyup="return (cekatribut() & checkPassword());">
			<!-- field input diatas harus diliat lagi di bagian keyup (yang getelementbyid)-->
			 <div id="passwordwarning"></div><br>
			Confirm password: <input type="password" id="editconfirmpassword" onkeyup="return (checkConfirmPassword() & cekatribut());">
			 <div id="confirmwarning"></div><br>
			Email: <input type="text" id="editemail" name="email" onkeyup="return (checkEmail() & cekatribut());">
			 <div id="emailwarning"></div><br>
			Birthday: <input type="text" id="editbirthday" name="ultah" onfocus="showCalendarControl(this)">
			 <div id="birthdaywarning"></div><br>
			Avatar:<br>
			<label for="file" id="namaavatar">Filename</label>
			<input type="file" name="ava" accept="image/jpeg" onchange="check_extension()"><br>
                       <input type="submit" value="upload avatar"></div>
                        </form>
                   <button onclick="updateatribut()">update atribut</button>
                        <div id="avatarwarning"></div>
			<div id="namawarning"></div>
            
    </body>
</html>
