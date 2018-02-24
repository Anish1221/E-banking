
<%@include file="header.jsp" %>

<%
    
    if (session.getAttribute("username") != null) {
        if(session.getAttribute("userRole").equals("Admin")){
        response.sendRedirect("admin/admin_home.jsp?");
        }else if(session.getAttribute("userRole").equals("Customer")){
        response.sendRedirect("customer/customer_home.jsp");
        }
    }
%>

<div class="row">
    <div class="col-sm-8" id="slideShowContainer">
        <ul class="slideshow">
            <img class="img-responsive" src="image/e-banking.jpg" alt="Bank Homepage" >
        </ul>
    </div>
    <div class="col-sm-3 " >
        <h3>Login</h3>
        <form method="post" action="login_check.jsp">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" class="form-control" required="required">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" class="form-control" required="required">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-success form-control" >Sign In</button>
            </div>
        </form>
        <p class="text-center">No Account Yet? <a href="register.jsp">Sign Up</a></p>
    </div>
</div>

</div>
</body>
</html>
