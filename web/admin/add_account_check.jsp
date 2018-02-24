<%-- 
    Document   : account_success
    Created on : Dec 14, 2017, 2:59:43 PM
    Author     : acer
--%>

<%@page import="com.leapfrog.ebanking.dao.CustomerDAO"%>
<%@page import="com.leapfrog.ebanking.dao.impl.CustomerDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.impl.SystemDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.SystemDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.leapfrog.ebanking.entity.Account"%>
<%@page import="com.leapfrog.ebanking.dao.impl.AdminDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.AdminDAO"%>

<%@include file = "../header.jsp" %>
<%@include file = "admin_nav.jsp" %>

<%
    SystemDAO sysDAO = new SystemDAOImpl();
    CustomerDAO custDAO = new CustomerDAOImpl();
    AdminDAO adminDAO = new AdminDAOImpl();
    Account account = new Account();
    int id = (Integer) session.getAttribute("customerId");
    String accountNo = request.getParameter("account_no");
    double balance = Double.parseDouble(request.getParameter("balance"));

    if (request.getMethod().equalsIgnoreCase("post")) {
        try {
            account.setAccountNo(accountNo);
            account.setBalance(balance);
            
            if (adminDAO.insertAccount(account, id) > 0) {
                response.sendRedirect("acc_info.jsp");
            } else {
                out.println("<h1>Some error occured</h1>");
                custDAO.delete(sysDAO.getId());
                
            }
        } catch (ClassNotFoundException ce) {
            out.println(ce.getMessage());
        } catch (SQLException se) {
            out.println(se.getMessage());
        }
    } else {
        response.sendRedirect("add_account_check.jsp?error");
    }

%>
