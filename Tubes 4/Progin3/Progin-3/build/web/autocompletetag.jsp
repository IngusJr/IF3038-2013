<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
    String input=new String(request.getParameter("input"));
    Connection con=null;
    ResultSet rst=null;
    Statement st=null;
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/progin_405_13510099","progin","progin");
      
    st=con.createStatement();
    ArrayList<String> arr_tag=new ArrayList<String>(); 
  
     rst=st.executeQuery("SELECT tag FROM tag_tugas1");
    
    while (rst.next())
    {
            arr_tag.add(rst.getString("tag"));
    }
    
    for (int i=0;i<arr_tag.size();i++)
        {
              if (arr_tag.get(i).startsWith(input))
                {
                      %>
                      <script>
                          function setval<%out.print(i);%>()
                          {
                              var suges=document.getElementById("sug<%out.print(i);%>").value;
                              document.getElementById("tambahtag").value=suges;
                          }
                      </script>
                      <button onclick="setval<%out.print(i);%>"><div id="sug<%out.print(i);%>"><%out.print(arr_tag.get(i));%></button><br>
                      <%
                };
        }
    
  
%>