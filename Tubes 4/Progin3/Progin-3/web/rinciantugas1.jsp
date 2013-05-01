<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
       <%@ page import="java.sql.*" %>
       <%@ page import="java.util.*" %>
       <% String ID_tugas=new String("");
           ID_tugas=request.getParameter("ID_tugas");
           String user=new String("username2");
       %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rincian tugas</title>
    </head>
<script>
       var timer=setInterval(function(){updatepage()},30000); //ipdate tigapuluh detik sekali
       function updatepage()
       {
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
                   document.getElementById("thewholething").innerHTML=xmlhttp.responseText;
               }
           }
           xmlhttp.open("GET","rinciantugas1.jsp?ID_tugas=<%out.print(ID_tugas);%>",true);
           xmlhttp.send();
       }
</script>
    <body>
    <script>
        
function edit_task()
    {
    	var tag="Tambah tag: <input id=\"tambahtag\" type=\"text\"  onkeyup=\"suggesttag()\"><br>";
       	var hapus_tag="hapus tag: <input id=\"hapustag\" type=\"text\" onkeyup=\"suggesttag()\"><br>";
	var deadline="Deadline: <input id=\"editdeadline\" type=\"text\" name=\"deadline\" ><br>"
	var assignee="Tambah assignee: <input id=\"tambahassignee\" type=\"text\" name=\"assignee\" onkeyup=\"suggestassi()\"><br>";
	var hapus_assignee="Hapus assignee: <input id=\"hapusassignee\" type=\"text\" name=\"hapus_assignee\" onkeyup=\"suggestassi()\"><br>";
	var submit="<button id=\"submit\" onclick=\"edit_task_ajax()\">KLIK UNTUK EDIT</button><br>";
        
        var stringform=tag+hapus_tag+deadline+assignee+hapus_assignee+submit;
	document.getElementById("bisadiedit").innerHTML=stringform;	
	document.getElementById("editbutton").innerHTML="";
    }
   function edit_task_ajax()
  {
    var assignee=document.getElementById("tambahassignee").value;
    var tag=document.getElementById("tambahtag").value;
    var deadline=document.getElementById("editdeadline").value;
    var hapus_assignee=document.getElementById("hapusassignee").value;
    var hapus_tag=document.getElementById("hapustag").value;
	
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
            if (xmlhttp.readystate==4 || xmlhttp.status==200)
            {
        	document.getElementById("bisadiedit").innerHTML=xmlhttp.responseText;
                document.getElementById("editbutton").innerHTML="<button onclick=\"edit_task()\">edit euy</button>";
                document.getElementById("suglist").innerHTML="";
        }							
	}
	xmlhttp.open("GET","updatetugas.jsp?ID_tugas=<%out.print(ID_tugas);%>&tambahtag="+tag+"&tambahassignee="+assignee+"&hapustag="+hapus_tag+"&hapusassignee="+hapus_assignee+"&deadline="+deadline,true);
        xmlhttp.send();							
    }

  function tambahkomen()
  {
    var xmlhttp;
    var komen=document.getElementById("inputkomen").value;
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
            if (xmlhttp.readystate==4 || xmlhttp.status==200)
            {
        	document.getElementById("notifikasitambah").innerHTML=xmlhttp.responseText;
            }							
	}
	xmlhttp.open("GET","tambahkomentar.jsp?username=<%out.print(user);%>&komentar="+komen+"&ID_tugas=<%out.print(ID_tugas);%>",true);
        xmlhttp.send();
        
    }

   function ubahstatus()
     {
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
            if (xmlhttp.readystate==4 || xmlhttp.status==200)
            {
        	document.getElementById("status").innerHTML=xmlhttp.responseText;
            }							
	}
	xmlhttp.open("GET","gantistatus.jsp?ID_tugas=<%out.print(ID_tugas);%>",true);
        xmlhttp.send();							
    }
 
   function hapustugas()
  {
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
        	document.getElementById("notifikasihapus").innerHTML=xmlhttp.responseText;
            }							
	}
	xmlhttp.open("GET","hapustugas.jsp?ID_tugas=<%out.print(ID_tugas);%>",true);
        xmlhttp.send();							
    }
       function suggesttag()
		{
                        var input = document.getElementById("tambahtag").value;
                        if (input.length == 0 || input == null) {document.getElementById("suglist").innerHTML="";return;};
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
				if (xmlhttp.readyState == 4 || xmlhttp.status==200)
                                {
				document.getElementById("suglist").innerHTML="daftar suggestion: <br>"+xmlhttp.responseText;
                              
                                }		
			}
				xmlhttp.open("GET","autocompletetag.jsp?input="+input,true);
				xmlhttp.send();
		}
                
        	function suggestassi()
		{
                        var input = document.getElementById("tambahassignee").value;
                        if (input.length == 0 || input==null) {document.getElementById("suglist").innerHTML="";return;};
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
				if (xmlhttp.readyState == 4 || xmlhttp.status==200)
                                {
				document.getElementById("suglist").innerHTML="daftar suggestion: <br>"+xmlhttp.responseText;
                              
                                }		
			}
				xmlhttp.open("GET","autocompleteass.jsp?input="+input,true);
				xmlhttp.send();
		}
    </script>
       <%
           Connection con=null;
           ResultSet rst=null;
           Statement st=null;
           
           
           ArrayList<String> arr_tag=new ArrayList<String>();
           ArrayList<String> arr_assignee=new ArrayList<String>();
           ArrayList<String> arr_att=new ArrayList<String>();
           String status=new String(""); //status tugas
           String deadline=new String("");
           String nama=new String("");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
           st=con.createStatement();
           rst=st.executeQuery("SELECT * FROM attachment_tugas1 WHERE ID_tugas='"+ID_tugas+"';"); //ngambil attachment
           
           while (rst.next())
           {
               arr_att.add(rst.getString("nama_attachment"));
           }
           
           rst=st.executeQuery("SELECT * FROM tag_tugas1 WHERE ID_tugas='"+ID_tugas+"';"); //ngambil tag
           
           while (rst.next())
           {
              arr_tag.add(rst.getString("tag"));
           }
           
           rst=st.executeQuery("SELECT * FROM asignee_tugas1 WHERE ID_tugas='"+ID_tugas+"'"); //ngambil assignee
           
           while (rst.next())
           {
              arr_assignee.add(rst.getString("username"));
           }
           
           rst=st.executeQuery("SELECT * FROM tugas1 WHERE ID_tugas='"+ID_tugas+"';");
           rst.next();
           status=rst.getString("status");             //ngambil status
           deadline=rst.getString("deadline");
           nama=rst.getString("nama_tugas");  
           String pembuat=new String(rst.getString("pembuat_tugas"));
       %>
         <div id="atribut">
              Nama tugas: <%out.print(nama);%><br>
              Status:<div id="status"><%out.print(status);%></div><br>
              <button onclick="ubahstatus()">ubah status!</button><br>  
              Attachment:
              <%
                for (int i=0;i<arr_att.size();i++)
                {
                    if (arr_att.get(i).contains(".jpg") || arr_att.get(i).contains(".jpeg") || arr_att.get(i).contains("gif") || arr_att.get(i).contains("png"))
                    {out.println("<img src=\"attachment/"+arr_att.get(i)+"\"></img><br>");}
                    else
                    if ((arr_att.get(i).contains(".mp4"))  || (arr_att.get(i).contains(".ogg")))
                     {out.println("<video height=\"300\" width=\"300\" controls><source src=\"attachment/"+arr_att.get(i)+"\"></source></video><br>");} else {out.println("<a href=\"attachment/"+arr_att.get(i)+"\">"+arr_att.get(i)+"</a><br>");};
                   
               }
              %><br>
             <div id="bisadiedit">
             Deadline: <%out.println(deadline);%><br>
             Tag:
             <%
                for (int i=0;i<arr_tag.size();i++)
                {
                    out.println(arr_tag.get(i)+",");
                }
             %>             
             <br>
             Assignee: 
             <%
               for (int i=0;i<arr_assignee.size();i++)
               {
                    %><a href="profile.jsp?username=<% out.println(arr_assignee.get(i)); %>"><%out.println(arr_assignee.get(i));%></a>,<%
               }
             %></div>
              <div id="suglist"></div>
              <%if (arr_assignee.contains(user)) {%><div id="editbutton"><button onclick="edit_task()">edit euy</button></div><%};%>
             
             <br>
             <%if (user.equals(pembuat)) {%> <button onclick="hapustugas()">Hapus tugas!</button><br><%};%>
             <div id="notifikasihapus"></div><br>
             Komentar tugas:<br>
             <iframe src="pagekomentar.jsp?ID_tugas=<%out.print(ID_tugas);%>&halaman=1" frameborder="0" width="300" height="300"></iframe><br>
             <textarea id="inputkomen" rows="10" cols="30"></textarea><br>
             <button onclick="tambahkomen()">Tambah komentar!</button><br>
             <div id="notifikasitambah"></div>
         </div>
    </body>
</html>
