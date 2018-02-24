<%-- 
    Document   : register
    Created on : Dec 3, 2017, 9:55:33 AM
    Author     : acer
--%>
<%@include  file = "header.jsp" %>



<div class="col-md-8 col-md-offset-2">

    <h2>Sign Up</h2>
    <form method="post" action="register_check.jsp">
        <div class="form-group">
            <label>Account No.</label>
            <input type="text" name="account_no" class="form-control" required="required">
        </div>
        <div class="form-group">
            <label>Username</label>
            <input type="text" name="username" class="form-control" required="required">
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" class="form-control" required="required">
        </div>
        <button type="submit" class="btn btn-success btn-md">Sign Up</button>

    </form>

</div>


</div>
</body>
</html>
