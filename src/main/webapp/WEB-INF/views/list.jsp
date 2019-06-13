<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <title>Title</title>

    <%--引入jquery--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <%--引入样式--%>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>员工信息展示模块</h1>
        </div>
    </div>
        <%--按钮模块--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8" >
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
        <%--表单数据--%>
    <div class="row" >
        <table class="table table-hover">
            <tr>
                <th>#</th>
                <th>empName</th>
                <th>gender</th>
                <th>eamil</th>
                <th>deptName</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo}" var="emp">
            <tr>
                <th>${emp.empId}</th>
                <th>${emp.empName}</th>
                <th>${emp.gender}</th>
                <th>${emp.email}</th>
                <th>${emp.department.deptName}</th>
                <th>
                    <button class="btn btn-primary btn-sm">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        编辑
                    </button>
                    <button class="btn btn-danger btn-sm">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                        删除
                    </button>
                </th>
            </tr>
            </c:forEach>
        </table>
    </div>
        <%--分页条信息--%>
    <div class="row">
        <div class="col-md-4">当前记录数***</div>
        <div class="col-md-4 col-md-offset-2">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="#">首页</a></li>
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li><a href="#">尾页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url:"emps",
            data:"pn=1",
            type:"GET",
            success:function (result) {
        console.log(result);

            }

        });
    });
</script>
</body>
</html>

