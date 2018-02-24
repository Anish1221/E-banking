
<%@page import="com.leapfrog.ebanking.dao.impl.SystemDAOImpl"%>
<%@page import="com.leapfrog.ebanking.dao.SystemDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.leapfrog.ebanking.dao.CustomerDAO"%>
<%@page import="com.leapfrog.ebanking.dao.impl.CustomerDAOImpl"%>
<%@page import="com.leapfrog.ebanking.entity.Customer"%>

<%@include file="../header.jsp" %>

<%
    Customer customer = new Customer();
    CustomerDAO custDAO = new CustomerDAOImpl();
    SystemDAO sysDAO = new SystemDAOImpl();
    

    if (request.getMethod().equalsIgnoreCase("post")) {

        try {

            customer.setFirstName(request.getParameter("first_name"));
            customer.setLastName(request.getParameter("last_name"));
            customer.setGender(request.getParameter("gender"));
            customer.setDob(request.getParameter("bday"));
            customer.setEmail(request.getParameter("email"));
            customer.setContactNo(request.getParameter("contact_no"));
            customer.setAddress(request.getParameter("address"));
            customer.setStatus(request.getParameter("status") != null);
            
            
            if (custDAO.insert(customer)> 0) {
                
                session.setAttribute("customerId", sysDAO.getId());
                response.sendRedirect("add_account.jsp");
            } else {
                out.println("Error Occured");
                
            }

        } catch (ClassNotFoundException ce) {
            out.println(ce.getMessage());
        } catch (SQLException se) {
            out.println(se.getMessage());
        }
    } else {
        response.sendRedirect("add_customer_check.jsp?illegal");
    }

%>