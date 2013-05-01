<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
    String user=new String("username2");
    String kategori=new String();
    String pembuatkategori=new String("");
    kategori=request.getParameter("kategori");
    Connection con=null;
    ResultSet rst=null;
    Statement st=null;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
    st=con.createStatement();
    
    
    rst=st.executeQuery("SELECT * FROM tugas1 WHERE kategori='"+kategori+"';");
    ArrayList<String> arr_idtgs=new ArrayList<String>();
    ArrayList<String> arr_namatgs=new ArrayList<String>();
    ArrayList<String> arr_deadline=new ArrayList<String>();
    ArrayList<String> arr_status=new ArrayList<String>();
    ArrayList<String> arr_tag=new ArrayList<String>();
    ArrayList<String> arr_pembuat=new ArrayList<String>();
    
    while (rst.next())
    {
            arr_idtgs.add(rst.getString("ID_tugas"));
            arr_namatgs.add(rst.getString("nama_tugas"));
            arr_deadline.add(rst.getString("deadline"));
            arr_status.add(rst.getString("status"));
            arr_pembuat.add(rst.getString("pembuat_tugas"));
    }
    int i=0;
    String tagtemp=new String("");
    while (i<arr_idtgs.size())
    {
         rst=st.executeQuery("SELECT * FROM tag_tugas1 WHERE ID_tugas='"+arr_idtgs.get(i)+"';");
       while (rst.next())
       {
           tagtemp=tagtemp+rst.getString("tag");
       } 
         
       arr_tag.add(tagtemp);
       tagtemp="";
       i++;
    }
   
   rst=st.executeQuery("SELECT * FROM kategori_tugas1 WHERE kategori='"+kategori+"';");
   rst.next();
   pembuatkategori=rst.getString("username");
   i=0;
   
   %>
   <script>
       function hapuskategori()
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
               if (xmlhttp.readyState == 4 || xmlhttp.status == 200)
               {
                   document.getElementById("kategoriterhapus").innerHTML="kategori <%out.print(kategori);%> terhapus";
               }
           }
           xmlhttp.open("GET","hapuskategori.jsp?kategori=<%out.print(kategori);%>",true);
           xmlhttp.send();
        }
   </script>
   <a href="tambah_tugas.jsp?kategori=<%out.print(kategori);%>"><button>tambah tugas untuk kategori <%out.print(kategori);%></button><a>
   <%if (user.equals(pembuatkategori)) {%><button onclick="hapuskategori()">hapus kategori <%out.print(kategori);%></button><br>
   <div id="kategoriterhapus"></div><br><%};
    for (i=0;i<arr_namatgs.size();i++)
    {
        
        %>     
        <div id="tugas<%out.print(i);%>">
        <script>
	function ubahstatus<%out.print(i);%>()
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
                	if (xmlhttp.readyState == 4 || xmlhttp.status == 200)
                	{
			document.getElementById("stat").innerHTML=xmlhttp.responseText;
			}		
		}
            xmlhttp.open("GET","gantistatus.jsp?ID_tugas=<%out.print(arr_idtgs.get(i));%>",true);
            xmlhttp.send();
	}             
        </script>        
        Nama tugas: <%out.print(arr_namatgs.get(i));%><br>
        Deadline tugas: <%out.print(arr_deadline.get(i));%><br>
        Status tugas: <div id="stat"><%out.print(arr_status.get(i));%></div><br>
        Tag: <%out.print(arr_tag.get(i));%><br>
        <%if (user.equals(arr_pembuat.get(i)) || user.equals(pembuatkategori)) {%><button onclick=<%out.print("\"hapustugas"+i+"()\"");%>>Hapus tugas!</button><%};%>
        </div>
        <button onclick=<%out.print("\"ubahstatus"+i+"()\"");%>>ubah status</button><br><br>
        <% 
    }
   
    
    
%>