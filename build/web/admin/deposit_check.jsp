<%-- 
    Document   : deposit_check
    Created on : Jan 8, 2018, 1:05:03 PM
    Author     : acer
--%>


<%@page import="java.sql.SQLException"%>
<%@page import="com.leapfrog.ebanking.dao.impl.SystemDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.SystemDAO"%>
<%@page import="com.leapfrog.ebanking.entity.Account"%>
<%@page import="com.leapfrog.ebanking.dao.impl.TransactionDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.TransactionDAO"%>
<%@page import="com.leapfrog.ebanking.entity.Transaction"%>

<%@include file="../header.jsp" %>
<%@include file="admin_nav.jsp" %>
<%
    SystemDAO sysDAO = new SystemDAOImpl();

    Transaction transaction = new Transaction();
    TransactionDAO transDAO = new TransactionDAOImpl();
    Account account = new Account();

    String accountNo = request.getParameter("account_no");
    String confirmAcc = request.getParameter("confirm_account_no");
    double transactionAmount = Double.parseDouble(request.getParameter("deposit_amt"));
    double newBalance = sysDAO.getBalance(accountNo) + transactionAmount;

    if (request.getMethod().equalsIgnoreCase("post")) {

        try {
            if (sysDAO.checkByAccountNo(accountNo, "tbl_account") == true) {
                if (accountNo.equals(confirmAcc)) {

                    transaction.setAccountNo(accountNo);
                    transaction.setTransactionAmount(transactionAmount);
                    transaction.setTransactionType("Deposit");
                    transaction.setAvailableBalance(newBalance);

                    transDAO.insertTransation(transaction);

                    account.setAccountNo(accountNo);

                    transDAO.updateBalance(account, newBalance);

                    out.println("<h4>Successful Deposit of Rs. " + transactionAmount + " to Account " + accountNo + "</h4>");

                } else {
                    out.println("<h4>Mismatched Account no.</h4>");
                }
            } else {
                out.println("<h4>Account no. invalid</h4>");
            }
        } catch (ClassNotFoundException ce) {
            out.println(ce.getMessage());
        } catch (SQLException se) {
            out.println(se.getMessage());
        }
    } else {
        response.sendRedirect("deposit_check.jsp?illegal");
    }

%>
