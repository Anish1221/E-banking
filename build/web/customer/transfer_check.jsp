<%-- 
    Document   : transfer_check
    Created on : Jan 8, 2018, 12:59:19 PM
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
<%@include file="customer_nav.jsp" %>
<%

    if (session.getAttribute("username") == null) {
        response.sendRedirect("../index.jsp");
    }

    SystemDAO sysDAO = new SystemDAOImpl();
    String user = session.getAttribute("username").toString();
    String srcAccountNo = sysDAO.getAccountNo(user);

    Transaction transaction = new Transaction();
    TransactionDAO transDAO = new TransactionDAOImpl();
    Account account = new Account();

    String destAccountNo = request.getParameter("dest_account_no");
    String confirmDest = request.getParameter("confirm_dest_account_no");
    int transactionAmount = Integer.parseInt(request.getParameter("transfer_amt"));
    int newSrcBalance = sysDAO.getBalance(srcAccountNo) - transactionAmount;
    int newDestBalance = sysDAO.getBalance(destAccountNo) + transactionAmount;

    if (request.getMethod().equalsIgnoreCase("post")) {

        try {
            if (sysDAO.checkByAccountNo(destAccountNo, "tbl_account") == true) {
                if (destAccountNo.equals(confirmDest)) {
                    if (sysDAO.getBalance(srcAccountNo) >= transactionAmount) {
                        transaction.setAccountNo(confirmDest);
                        transaction.setTransactionAmount(transactionAmount);
                        transaction.setTransactionType("Transfer from: " + srcAccountNo);
                        transaction.setAvailableBalance(newDestBalance);
                        transDAO.insertTransation(transaction);

                        account.setAccountNo(destAccountNo);
                        transDAO.updateBalance(account, newDestBalance);

                        transaction.setAccountNo(srcAccountNo);
                        transaction.setTransactionAmount(transactionAmount);
                        transaction.setTransactionType("Transfer to: " + destAccountNo);
                        transaction.setAvailableBalance(newSrcBalance);
                        transDAO.insertTransation(transaction);

                        account.setAccountNo(srcAccountNo);
                        transDAO.updateBalance(account, newSrcBalance);

                        out.println("<h4>Successful Transfer of Rs. " + transactionAmount + " to Account " + confirmDest + "</h4>");
                    } else {
                        out.println("<h4>Sorry, You don't have enough Balance to proceed the transaction.</h4>");
                    }
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
        response.sendRedirect("transfer_check.jsp?illegal");
    }

%>

