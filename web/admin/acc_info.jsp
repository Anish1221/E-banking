<%-- 
    Document   : acc_manager
    Created on : Dec 14, 2017, 1:02:50 PM
    Author     : acer
--%>

<%@page import="com.leapfrog.ebanking.dbutil.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.leapfrog.ebanking.dao.impl.SystemDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.SystemDAO"%>
<%@page import="com.leapfrog.ebanking.dao.impl.CustomerDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.CustomerDAO"%>
<%@page import="com.leapfrog.ebanking.entity.Customer"%>

<%@include file="../header.jsp" %>
<%@include file="admin_nav.jsp" %>

<h1>Customer Database</h1>
<table class="table table-bordered table-striped table-hover" style="margin-top: 20px">
    <tr>
        <td>Account No.</td>        
        <td>Name</td>        
        <td>Gender</td>
        <td>DOB</td>
        <td>Email</td>
        <td>Contact No.</td>
        <td>Address</td>
        <td>Status</td>
        <td>Balance</td>
    </tr>
    
    <%              
        DbConnection db = new DbConnection();
        db.open();
        String sql="SELECT a.account_no, c.first_name, c.last_name, c.gender, c.bday, c.email, c.contact_no, c.address, c.status, a.balance FROM tbl_account AS a, tbl_customer AS c WHERE a.customer_id = c.customer_id";
        db.initStatement(sql);        
        ResultSet rs = db.executeQuery();
        while(rs.next()){       
    %>
    
    <tr>
        <td><%=rs.getString("account_no")%></td>             
        <td><%=rs.getString("first_name")%> <%=rs.getString("last_name")%></td>        
        <td><%=rs.getString("gender")%></td>
        <td><%=rs.getString("bday")%></td>
        <td><%=rs.getString("email")%></td>
        <td><%=rs.getString("contact_no")%></td>
        <td><%=rs.getString("address")%></td>
        <td><%=rs.getBoolean("status")%></td>
        <td><%=rs.getDouble("balance")%></td>
        
    </tr>

    <% }
       db.close();
    
    %>
    

</table>
</div>
</body>
</html>
