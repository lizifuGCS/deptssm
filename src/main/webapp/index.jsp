<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <title>Title</title>

    <%--引入jquery--%>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <%--引入样式--%>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--修改员工模态框--%>

<div class="modal fade" tabindex="-1" role="dialog" id="empUpdateModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName-update-static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="emp_update_email" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input  type="radio" name="gender" id="updateGender1" value="男" > 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="updateGender2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<%--新增员工模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="empAddModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工增加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="emp_add_empName" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="emp_add_email" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input  type="radio" name="gender" id="inlineRadio1" value="男" > 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="inlineRadio2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">添加</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




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
            <button class="btn btn-primary" id="emp_add_modal">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--表单数据--%>
    <div class="row" >
        <table class="table table-hover" id="emps_table">
            <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="all-checkbox">
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>eamil</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    <%--分页条信息--%>
    <div class="row">
        <div class="col-md-4" id="page_info_area">
        </div>
        <div class="col-md-5 col-md-offset-1" id="page_info_nav">

        </div>
    </div>
</div>
<script type="text/javascript">

    var totalRecord,pageNumRecord;
    $(function () {
        to_page(1);
    });
    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                /*显示员工信息*/
                build_emps_table(result);
                /*显示分页信息*/
                build_page_info(result);
                /*显示分页条信息*/
                build_page_nav(result);
            }

        });
    }

    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.extend.page.list;

        $.each(emps,function (index, item) {
            var checkTd =  $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd =  $("<td></td>").append(item.empId);
            var empNameTd =  $("<td></td>").append(item.empName);
            var genderTd  = $("<td></td>").append(item.gender);
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit-id",item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("delete-id",item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
             $("<tr></tr>").append(checkTd)
                 .append(empIdTd)
                 .append(empNameTd)
                 .append(genderTd)
                 .append(emailTd)
                 .append(deptNameTd)
                 .append(btnTd)
                 .appendTo("#emps_table tbody");
        });
    }
    /*分页信息*/
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.page.pageNum+"页，总"
            +result.extend.page.pages+"页，总"+result.extend.page.total+"条记录"
        );
        totalRecord = result.extend.page.total;
        pageNumRecord= result.extend.page.pageNum;
    }
    /*分页条信息*/
    function build_page_nav(result){
        /*清空数据*/
        $("#page_info_nav").empty();


        var    ul = $("<ul></ul>").addClass("pagination");
        var   firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var   prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.page.hasPreviousPage == false){
            firstPage.addClass("disabled");
            prePage.addClass("disabled");
        }else{
            firstPage.click(function () {
                to_page(1);
            });
            prePage.click(function () {
                to_page(result.extend.page.pageNum-1);
            });
        }


        var   nextPage = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var   lastPage = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
        if (result.extend.page.hasNextPage == false){
            nextPage.addClass("disabled");
            lastPage.addClass("disabled");
        }else{
            nextPage.click(function () {
                to_page(result.extend.page.pageNum+1);
            });


            lastPage.click(function () {
                to_page(result.extend.page.pages);
            });
        }


        /*添加首页和上一页*/
        ul.append(firstPage).append(prePage);

        /*遍历页数*/
        $.each(result.extend.page.navigatepageNums,function (index,item) {
            var numli =  $("<li></li>").append($("<a></a>").append(item));
            ul.append(numli);
            /*如果遍历当前页，高亮*/
            if (result.extend.page.pageNum ==item){
                numli.addClass("active");
            }
            numli.click(function () {
                to_page(item);
            });

        });
        ul.append(nextPage).append(lastPage);

        var nav = $("<nav></nav>").append(ul);

        nav.appendTo("#page_info_nav");


    }

    function reset_form(ele){

        //$(ele)[0].reset();
        $(ele).removeClass("has-error has-success");
        $(ele).find(".help-block").text("");

    }


         /*弹出模态框事件*/
        $("#emp_add_modal").click(function () {
            getDepts("#dept_add_select");

            reset_form("#emp_add_modal form");

            /*点击弹出模态框*/
            $("#empAddModal").modal({
                backdrop:"static"
            });
        });

    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
           url:"${APP_PATH}/depts",
           type:"GET",
           success: function (result) {
               //console.log(result);
               $.each(result.extend.dept,function () {
                var  optiondept =   $("<option></option>").append(this.deptName).attr("value",this.deptId);
                   optiondept.appendTo(ele);
               });


            }
        });

    }

/*正则表达式验证前端输入的数据格式*/
    function validate_form(){
        var ename = $("#emp_add_empName").val();
        var enameT = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{3,16})/;
        if (!enameT.test(ename)) {
            show_validate_msg("#emp_add_empName","error","请输入长度大于3的有效用户名");
            return false;
        }else{
            show_validate_msg("#emp_add_empName","success"," ");
        }


        var emailt = $("#emp_add_email").val();
        var emailT = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!emailT.test(emailt)){
            show_validate_msg("#emp_add_email","error","您输入的邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#emp_add_email","success"," ");
    /*        $("#emp_add_email").parent().addClass("has-success");
            $("#emp_add_email").next("span").text(" ");*/
        }
        return true;
    }


    function show_validate_msg(ele,status,msg){
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success"==status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error"==status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }


    /*用户名后端校验是否重复*/
    $("#emp_add_empName").change(function () {
        var empName = $("#emp_add_empName").val();
        $.ajax({
            url:"${APP_PATH}/checkuser",
            type:"POST",
            data:"empName="+ empName,
            success:function (result) {
               if (result.code ==100) {
                   show_validate_msg("#emp_add_empName","success","用户名可用");
                   $("#emp_save_btn").attr("ajax-va","success");
               }else if(result.code ==200){
                   show_validate_msg("#emp_add_empName","error",result.extend.va_msg);
                   $("#emp_save_btn").attr("ajax-va","error");
               }
            }

        });

    });


    /*员工保存按钮*/
    $("#emp_save_btn").click(function () {

        //alert( $("#empAddModal form").serialize());
        if (!validate_form()){
            return false;
        }

        /*判断用户名是否重复*/
        if ($(this).attr("ajax-va")=="error"){
            return false;
        }

        $.ajax({
            url:"${APP_PATH}/saveEmp",
            type:"POST",
            data: $("#empAddModal form").serialize(),
            success:function (result) {
                if(result.code==100){
                    /!*关闭模态框*!/
                    $("#empAddModal").modal('hide');
                    /!*跳转到最后一页*!/
                    to_page(result.extend.page.pages);
                }else{
                    if (undefined != result.extend.errorFiles.email){
                        show_validate_msg("#emp_add_email","error",result.extend.errorFiles.email);
                    }
                    if (undefined != result.extend.errorFiles.empName){
                        show_validate_msg("#emp_add_empName","error",result.extend.errorFiles.empName);
                    }
                }


            }

        });

    });


    /*打开修改模态框*/
    $(document).on("click",".edit_btn",function () {

        $("#empUpdateModal").removeClass("has-error has-success");

        $("#empUpdateModal").find(".help-block").text("");

        getDepts("#dept_update_select");

        /*根据id的值查出员工的信息*/
        getEmp($(this).attr("edit-id"));

        $("#emp_update_btn").attr("edit-id",($(this).attr("edit-id")));

        /*点击弹出模态框*/
        $("#empUpdateModal").modal({
            backdrop:"static"
        });

    });

    function getEmp(id) {

        $.ajax({
            url:"${APP_PATH}/getEmp/"+id,
            type:"GET",
            success:function (result) {
               // console.log(result);
              var empUpdate = result.extend.employee;
              /*回显数据的四种形式*/
                $("#empName-update-static").text(empUpdate.empName);
                $("#emp_update_email").val(empUpdate.email);
                $("#empUpdateModal input[name=gender]").val([empUpdate.gender]);
                $("#empUpdateModal select").val([empUpdate.dId]);



            }
        });

    }

    $("#emp_update_btn").click(function () {

        /*检验邮箱格式*/
        var emailt = $("#emp_update_email").val();
        var emailT = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!emailT.test(emailt)){
            show_validate_msg("#emp_update_email","error","您输入的邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#emp_update_email","success"," ");
        }


        $.ajax({
            url:"${APP_PATH}/updateEmp/"+ $(this).attr("edit-id"),
            type:"POST",
            data: $("#empUpdateModal form").serialize()+"&_method=PUT",
            success: function (result) {
                if(result.code==100){

                   /*关闭模态框*/
                    $("#empUpdateModal").modal('hide');
                   /*跳到点击的当前页*/
                    to_page(pageNumRecord);
                }else{
                    alert("修改员工信息失败");
            }

        }
        });

    });



    /*单个删除*/
    $(document).on("click",".delete_btn",function () {

        var empName = $(this).parents("tr").find("td:eq(1)").text();
        var empId =$(this).attr("delete-id");

        if (confirm("确认要删除【"+empName+"】吗？")){
            $.ajax({
                url:"${APP_PATH}/deleteEmp/"+empId,
                type:"DELETE",
                success:function (result) {
                    /*提示消息*/
                    alert(result.msg);

                    /*跳转界面*/
                    to_page(pageNumRecord);
                }

            });
        }

    });

        $("#all-checkbox").click(function () {

            $(".check_item").prop("checked",$(this).prop("checked"));
        });

    $(document).on("click",".check_item",function () {
      var flag =  $(".check_item:checked").length==$(".check_item").length;
        $("#all-checkbox").prop("checked",flag);


    });



</script>
</body>
</html>

