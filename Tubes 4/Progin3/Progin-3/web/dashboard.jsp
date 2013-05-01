<div id="thewholething">
       <%@ page import="java.text.SimpleDateFormat"%>
       <%@ page import="java.util.Calendar" %>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
    </head>
    <script>
                var timer=setInterval(function(){updatedb()},30000)
        	function updatedb() //untuk mengupdate dashboard tanpa harus refresh
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
				if (xmlhttp.readyState == 4 || xmlhttp.status==200)
                                {
                                  document.getElementById("thewholething").innerHTML=xmlhttp.responseText;
                                }		
			}
				xmlhttp.open("GET","dashboard1.jsp",true);
				xmlhttp.send();
		}        
    </script>
    <body>
        <% Calendar cal=Calendar.getInstance();
    cal.getTime();SimpleDateFormat sdf=new SimpleDateFormat("HH:mm:ss");
    out.println("Latest update: "+sdf.format(cal.getTime())+"<br>");%>
        <script>
            function kategoribaru()
            {
                win=window.open('popupkategori.jsp','popUpWindow','height=300,width=300,left=10,top=10,resizable=no,scrollbar=no,toolbar=no,menubar=no,location=no,directories=no,status=no');
            }
        </script>
        <%@ page import="java.sql.*"%>
        <%@ page import="java.util.*"%>
        <%
            int i=0;
            Connection con=null;
            ResultSet rst=null;
            Statement st=null;
            String user=new String("username2");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
            st=con.createStatement();
            ArrayList<String> arr_tag=new ArrayList<String>();
            ArrayList<String> arr_nama=new ArrayList<String>();
            ArrayList<String> arr_status=new ArrayList<String>();
            ArrayList<String> arr_deadline=new ArrayList<String>();
            ArrayList<String> arr_idtgs=new ArrayList<String>();
            ArrayList<String> arr_pembuat=new ArrayList<String>();
            ArrayList<String> arr_kategori=new ArrayList<String>();
            ArrayList<String> arr_katcreator=new ArrayList<String>();
            
            rst=st.executeQuery("SELECT * FROM kategori_tugas1");
            
            while (rst.next())
            {
                    arr_katcreator.add(rst.getString("username"));
            }
            
            rst=st.executeQuery("SELECT * FROM tugas1");
            i=0;
            while(rst.next())
            {
                arr_nama.add(rst.getString("nama_tugas"));
                arr_status.add(rst.getString("status"));
                arr_deadline.add(rst.getString("deadline"));
                arr_idtgs.add(rst.getString("ID_tugas"));
                arr_pembuat.add(rst.getString("pembuat_tugas"));
            }
            
            String tagtemp=new String(""); //variabel sementara buat 
            
            while (i<arr_idtgs.size()) //ngambil tag
            {
               rst=st.executeQuery("SELECT * FROM tag_tugas1 WHERE ID_tugas='"+arr_idtgs.get(i)+"';");   
              while (rst.next())
               {
                  tagtemp=tagtemp+rst.getString("tag")+",";
               }
               arr_tag.add(tagtemp);
               tagtemp="";
               i++;
             }
            i=0;
          rst=st.executeQuery("SELECT * FROM kategori_tugas1");  
          
          while (rst.next())
          {
              arr_kategori.add(rst.getString("kategori"));
          }
          out.print("Daptar kategori: <br>");
          for (i=0;i<arr_kategori.size();i++)
          {
            %>
            <script>
        	function hapuskategori<%out.print(i);%>()
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
				if (xmlhttp.readyState == 4 || xmlhttp.status==200)
                                {
				document.getElementById("tandahapuskategori").innerHTML="kategori <%out.print(arr_kategori.get(i));%> terhapus";
                              
                                }		
			}
				xmlhttp.open("GET","hapuskategori.jsp?kategori=<%out.print(arr_kategori.get(i));%>",true);
				xmlhttp.send();
		}                
        	function gantikategori<%out.print(i);%>()
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
				if (xmlhttp.readyState == 4 || xmlhttp.status==200)
                                {
				document.getElementById("tandagantikategori").innerHTML="berikut adalah daftar tugas kategori <%out.print(arr_kategori.get(i));;%>";
                                document.getElementById("semuatugas").innerHTML=xmlhttp.responseText;
                                }		
			}
				xmlhttp.open("GET","gantikategori.jsp?kategori=<%out.print(arr_kategori.get(i));%>",true);
				xmlhttp.send();
		}                
            </script>
            <%
            out.print("<button onclick=\"gantikategori"+i+"()\">"+"pilih kategori "+arr_kategori.get(i)+"</button>");
            if (user.equals(arr_katcreator.get(i))) {out.print("<button onclick=\"hapuskategori"+i+"()\">hapus kategori "+arr_kategori.get(i)+"</button><br>");} else {out.print(" tidak bisa menghapus kategori '"+arr_kategori.get(i)+"' karena anda bukan pembuatnya<br>");};
          }
          out.print("<br>");
          %><button onclick="kategoribaru()">buat kategori baru</button><br><%                              
             i=0;
          out.print("<div id=\"tandagantikategori\"></div><br>");
          out.print("<div id=\"tandahapuskategori\"></div><br>");
          out.print("<div id=\"semuatugas\">");
              for (i=0;i<arr_nama.size();i++)
                 {%>
      
                 <div id="tugas<%out.print(i);%>">
                       <script>
                 function ubahstat<%out.print(i);%>()
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
                            document.getElementById("stat<%out.print(i);%>").innerHTML=xmlhttp.responseText;
                        }							
                    }
                 xmlhttp.open("GET","gantistatus.jsp?ID_tugas=<%out.print(arr_idtgs.get(i));%>",true);
                 xmlhttp.send();							
    }

                 function hapustugas<%out.print(i);%>()
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
                            document.getElementById("tugas<%out.print(i);%>").innerHTML=xmlhttp.responseText;
                        }							
                    }
                 xmlhttp.open("GET","hapustugas.jsp?ID_tugas=<%out.print(arr_idtgs.get(i));%>",true);
                 xmlhttp.send();							
    }
                 </script>
                     Nama task: <%out.print(arr_nama.get(i));%><br>
            Tanggal deadline: <%out.print(arr_deadline.get(i));%><br>
            Tag: <%out.print(arr_tag.get(i));%><br>
            Status task: <div id=<%out.print("\"stat"+i+"\"");%>><%out.print(arr_status.get(i));%></div><br>
            <button onclick="ubahstat<%out.print(i+"()");%>">ubah status!</button><br>
           <%if (user.equals(arr_pembuat.get(i))) {%><button onclick="hapustugas<%out.print(i+"()");%>">Hapus tugas!</button><%}%>
                 </div><%};
            out.print("</div>");
            %>
            
                    
        
    </body>
</html>
</div>