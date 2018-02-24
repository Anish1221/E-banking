<%-- 
    Document   : logout
    Created on : Dec 11, 2017, 3:14:26 PM
    Author     : acer
--%>
<%@include file="header.jsp" %>

<%

        session.removeAttribute("username");
        session.removeAttribute("password");
        session.invalidate();
        response.sendRedirect("index.jsp");
    
%> 

</div>
</body> 
</html>

