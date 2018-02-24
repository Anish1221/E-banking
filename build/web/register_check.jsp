
<%@page import="com.leapfrog.ebanking.entity.Login"%>
<%@page import="com.leapfrog.ebanking.dao.impl.SystemDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.SystemDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.leapfrog.ebanking.dao.CustomerDAO"%>
<%@page import="com.leapfrog.ebanking.dao.impl.CustomerDAOImpl"%>
<%@page import="com.leapfrog.ebanking.entity.Customer"%>

<%@include file="header.jsp" %>

<%
    Login login = new Login();
    SystemDAO systemDAO = new SystemDAOImpl();

    String accountNo = request.getParameter("account_no");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    Boolean error1 = systemDAO.checkByAccountNo(accountNo, "tbl_login") != true;
    Boolean error2 = systemDAO.checkByUsername(username) != true;

    if (request.getMethod().equalsIgnoreCase("post")) {

        try {
            login.setAccountNo(accountNo);
            login.setUsername(username);
            login.setPassword(password);

            if (systemDAO.checkByAccountNo(accountNo, "tbl_account") == true) {
                if (error1) {
                    if (error2) {
                        if (systemDAO.insertLogin(login) > 0) {
                            out.println("<h4>Sign up successful. Please go to home to sign in to your account</h4>");
                        } else {
                            out.println("Sign up failed!!!!");
                        }
                    } else {
                        out.println(error2);
                        out.println("Username already taken");
                    }
                } else {
                    out.println(error1);
                    out.println("<h1>Please enter valid Account No.</h1>");
                }
            } else {
                out.println("<h1>Please enter valid Account No.</h1>");
            }
        } catch (ClassNotFoundException ce) {
            out.println(ce.getMessage());
        } catch (SQLException se) {
            out.println(se.getMessage());
        }
    } else {
        response.sendRedirect("register_check.jsp?authentication");
    }

%>