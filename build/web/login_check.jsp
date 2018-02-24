

<%@page import="com.leapfrog.ebanking.entity.Login"%>
<%@page import="com.leapfrog.ebanking.dao.impl.SystemDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.SystemDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.leapfrog.ebanking.dao.impl.CustomerDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.CustomerDAO"%>
<%@page import="com.leapfrog.ebanking.entity.Customer"%>

<%@include file="header.jsp"%>


<%
    
    SystemDAO systemDAO = new SystemDAOImpl();

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String userRole = systemDAO.checkLogin(username, password);

    if (request.getMethod().equalsIgnoreCase("post")) {

        if (userRole != null && userRole.equalsIgnoreCase("admin")) {
            session.setAttribute("username", username);
            session.setAttribute("userRole", userRole);
            response.sendRedirect("admin/admin_home.jsp?success");
        } else if (userRole != null && userRole.equalsIgnoreCase("customer")) {
            session.setAttribute("username", username);
            session.setAttribute("userRole", userRole);
            response.sendRedirect("customer/customer_home.jsp?success");
        } else {
            out.println("<h1>Please check your login credentials.</h1>");
        }

    } else {
        response.sendRedirect("login_check.jsp?authentication");
    }
%>