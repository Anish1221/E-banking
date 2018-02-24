<%-- 
    Document   : admin_home
    Created on : Dec 15, 2017, 12:10:26 PM
    Author     : acer
--%>

<%@include file="../header.jsp" %>
<%@include file="admin_nav.jsp" %>

<% 
    
    if(session.getAttribute("username") == null){
        response.sendRedirect("../index.jsp");
    }
    
    String user= session.getAttribute("username").toString();
    out.println("<h4> Welcome, " + user.toUpperCase() + "</h4>");
    
%>

<img class="img-responsive col-md-12" src="../image/e-banking.jpg" alt="E-banking Homepage" >

</div>
</body>
</html>
