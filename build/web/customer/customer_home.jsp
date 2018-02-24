<%-- 
    Document   : home
    Created on : Dec 10, 2017, 11:11:03 PM
    Author     : acer
--%>
<%@page import="com.leapfrog.ebanking.dao.impl.SystemDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.SystemDAO"%>

<%@include file="../header.jsp" %>

<%@include file="customer_nav.jsp" %>

<%

    if (session.getAttribute("username") == null) {
        response.sendRedirect("../index.jsp");
    }

    SystemDAO sysDAO = new SystemDAOImpl();
    String user = session.getAttribute("username").toString();
    String accountNo = sysDAO.getAccountNo(user);
%>


<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="jumbotron">
            <% out.println("<h5> Welcome, " + user + "</h5>");%>
            <br />
            <br />
            <h4>Account Details</h4>
            <hr>
            <h5>Account no.: <%=accountNo%> </h5>
            <h5>Current Balance: Rs. <%=sysDAO.getBalance(accountNo)%></h5>

        </div>
    </div>
</div>


</div>
</body>
</html>
