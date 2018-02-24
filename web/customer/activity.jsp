<%-- 
    Document   : activity
    Created on : Feb 23, 2018, 12:51:31 PM
    Author     : acer
--%>

<%@page import="com.leapfrog.ebanking.dao.impl.SystemDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.SystemDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.leapfrog.ebanking.dbutil.DbConnection"%>
<%@include file = "../header.jsp" %>
<%@include file = "customer_nav.jsp" %>


<h1>Transaction Activity</h1>
<table class="table table-bordered table-striped table-hover" style="margin-top: 20px">
    <tr>
        <td>Account No</td>        
        <td>Date of Transaction</td>        
        <td>Transaction Type</td>
        <td>Transaction Amount</td>
        <td>Available Balance</td>
    </tr>

    <%      
        if (session.getAttribute("username") == null) {
        response.sendRedirect("../index.jsp");
    }

    SystemDAO sysDAO = new SystemDAOImpl();
    String user = session.getAttribute("username").toString();
    String accountNo = sysDAO.getAccountNo(user);
        
        DbConnection db = new DbConnection();
        db.open();
        String sql="SELECT account_no, transaction_date, transaction_type, transaction_amount, available_balance FROM tbl_transaction WHERE account_no = ?";
        PreparedStatement stmt = db.initStatement(sql);     
        stmt.setString(1, accountNo);
        ResultSet rs = db.executeQuery();
        while(rs.next()){       
    %>

    <tr>
        <td><%=rs.getString("account_no")%></td>             
        <td><%=rs.getString("transaction_date")%></td>        
        <td><%=rs.getString("transaction_type")%></td>
        <td><%=rs.getString("transaction_amount")%></td>
        <td><%=rs.getString("available_balance")%></td>
        
    </tr>

    <% }
       db.close();
    
    %>


</table>

</div>
</body>
</html>
