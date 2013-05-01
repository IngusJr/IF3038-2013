<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
    String input=new String(request.getParameter("input"));
    Connection con=null;
    ResultSet rst=null;
    Statement st=null;
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
      
    st=con.createStatement();
    ArrayList<String> arr_ass_usern=new ArrayList<String>(); 
    ArrayList<String> arr_ass_nama=new ArrayList<String>();
     rst=st.executeQuery("SELECT username FROM asignee_tugas1");
    
    while (rst.next())
    {
            arr_ass_usern.add(rst.getString("username"));
    }
     
    
    for (int i=0;i<arr_ass_usern.size();i++)
    {
        rst=st.executeQuery("SELECT * FROM user1 WHERE username='"+arr_ass_usern.get(i)+"';");
        rst.next();
        arr_ass_nama.add(rst.getString("nama_lengkap"));

    }
     
     
             
    
    for (int i=0;i<arr_ass_nama.size();i++)
        {
              if (arr_ass_nama.get(i).startsWith(input))
                {
                      %>
                      <script>
                          function setval<%out.print(i);%>()
                          {
                              var suges=document.getElementById("sug<%out.print(i);%>").value;
                              document.getElementById("tambahassignee").value=suges;
                          }
                      </script>
                      <button onclick="setval<%out.print(i);%>"><div id="sug<%out.print(i);%>"><%out.print(arr_ass_nama.get(i));%></button><br>
                      <%
                };
        }
    
  
%>