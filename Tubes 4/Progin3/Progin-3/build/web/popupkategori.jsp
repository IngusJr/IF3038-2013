<%-- 
    Document   : popupkategori
    Created on : Apr 11, 2013, 12:43:38 PM
    Author     : Akbar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pop-up pembuat kategori</title>
    </head>
    <div id="tandaterbikin"></div>
  
    <script>
        function bikinkategori()
        {
            var namakat=document.getElementById("namakategori").value;
            var userberhak=document.getElementById("penggunaberhak").value;
            var xmlhttp;
            if (window.XMLHttpRequest)
            {
                xmlhttp=new XMLHttpRequest();
            }
            else
            {
                xmlhttp=new ActiveObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onsteadychange=function()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("tandaterbikin").innerHTML=xmlhttp.responseText;
                }
            }
            xmlhttp.open("GET","kategoribaru.jsp?nama_kat="+namakat+"&userberhak="+userberhak,true);
            xmlhttp.send();
        }
    </script>
    <body>
        <%
            Connection con=null;
            ResultSet rst=null;
            Statement st=null;
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
            st=con.createStatement();
            %>
           
            Nama kategori: <input type="textfield" id="namakategori"><br>
            Penguguna yang berhak: <input type="textfield" id="penggunaberhak"><br>
            (pisahkan pengguna yang berhak dengan koma)<br>
          
            <button onclick="bikinkategori()">Buat kategori!</button>
        
            <%
            
        %>
    </body>
</html>
