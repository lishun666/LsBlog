<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/static/my/taglibs.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - Bootstrap Table</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${_ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${_ctx}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${_ctx}/static/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${_ctx}/static/css/animate.css" rel="stylesheet">
    <link href="${_ctx}/static/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${_ctx}/static/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">


</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <div class="row row-lg">
                <div class="col-sm-12">
                    <!-- Example Toolbar -->
                    <div class="example-wrap">
                        <h4 class="example-title">文章类型管理</h4>
                        <div class="example">
                            <div class="btn-group hidden-xs" id="exampleToolbar" role="group">
                                <button type="button" class="btn btn-outline btn-default" id="addButton">
                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                </button>
                                <button type="button" class="btn btn-outline btn-default" data-toggle="modal"
                                        id="deleteButton">
                                    <i class="glyphicon glyphicon-trash " aria-hidden="true"></i>
                                </button>
                            </div>
                            <table id="exampleTableToolbar" data-mobile-responsive="true">
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content animated bounceInRight">

            <div class="modal-body">
                <div class="form-group">
                    <input type="text" class="form-control" id="typeId" style="display: none">
                </div>
                <div class="form-group">
                    <label id="title">新增文章类型</label>
                    <input type="text" placeholder="请输入文章类型" class="form-control" id="articleTypeName">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="submitArticleType">保存</button>
            </div>
        </div>
    </div>
</div>


<!-- 全局js -->
<script src="${_ctx}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${_ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="${_ctx}/static/js/content.js?v=1.0.0"></script>


<!-- Bootstrap table -->
<script src="${_ctx}/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${_ctx}/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="${_ctx}/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${_ctx}/static/js/plugins/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<!--统计代码，可删除-->

<script>
    $(function () {
        //初始化Table
        var oTable = new TableInit();
        oTable.Init();
    })


    var TableInit = function () {

        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#exampleTableToolbar').bootstrapTable({
                url: '${_ctx}/articleType/findAllArticleType',         //请求后台的URL（*）
                method: 'post',                      //请求方式（*）
                toolbar: '#exampleTableEventsToolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortName: "id",
                sortOrder: "desc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                queryParamsType: 'limit',
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 5,                       //每页的记录行数（*）
                pageList: [10, 15, 20, 50],        //可供选择的每页的行数（*）
                search: true,                       //是否显示表格搜索
                strictSearch: true,
                showColumns: true,                  //是否显示所有的列
                showRefresh: true,                  //是否显示刷新按钮
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                //height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                iconSize: 'outline',
                contentType: "application/x-www-form-urlencoded", //解决POST提交问题
                showExport: true,                     //是否显示导出
                buttonsAlign: "right",  //按钮位置
                exportDataType: "selected",              //basic', 'all', 'selected'.
                exportTypes: ['excel', 'txt', 'json', 'xml'],  //导出文件类型   //'json', 'xml', 'csv', 'txt', 'sql', 'excel'
                Icons: 'glyphicon-export',
                responseHandler: function (res) {
                    return {
                        "rows": res.typeList   //数据
                    };
                },
                icons: {
                    refresh: 'glyphicon-repeat',
                    toggle: 'glyphicon-list-alt',
                    columns: 'glyphicon-list'
                },
                columns: [
                    {checkbox: true},
                    {title: '类型编号', field: 'typeId', sortable: true, align: "center"},
                    {title: '类型名字', align: "center", align: "center", field: 'typeName'},
                    {
                        title: '操作', field: "Button", align: "center", formatter: buttonFormatter,
                    }
                ],
            });
        };
        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                pageSize: params.limit,   //页面大小
                pageNumber: params.pageNumber, //页码
                sortName: params.sort,	//排序列名
                sortOrder: params.order,	//排序方式
                searchText: params.search//搜索框参数
            };
            return temp;
        };
        return oTableInit;
    }

    //按钮初始化
    function buttonFormatter(value, row) {

        var id = value;
        var result = "";
        result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"EditTypeById('" + row.typeName + "','" + row.typeId + "')\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
        result += "<a href='javascript:;' class='btn btn-xs red' onclick=\"DeleteTypeById('" + row.typeId + "')\" title='删除'>" + "<span class='glyphicon glyphicon-remove'></span></a>";
        return result;
    }

    //新增类型
    $("#addButton").click(function () {
        $("#articleTypeName").val("");
        $("#title").html("添加文章类型");
        $("#myModal").modal();
    })

    //修改类型
    function EditTypeById(typeName, typeId) {
        $("#title").html("修改文章类型");
        $("#articleTypeName").val(typeName);
        $("#typeId").val(typeId);
        $("#myModal").modal();
    }

    //删除类型
    $("#deleteButton").on("click", function () {
        swal({
            title: "您确定要删除这些吗",
            text: "删除后将无法恢复，请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除",
            closeOnConfirm: false
        }, function () {
            deleteType();
            swal("删除成功！", "您已经永久删除了这条信息。", "success");
        });
    })

    function deleteType() {
        var rows = $("#exampleTableToolbar").bootstrapTable('getSelections');
        if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
            alert("请先选择要删除的记录!");
            return;
        } else {
            var arrays = new Array();// 声明一个数组
            $(rows).each(function () {// 通过获得别选中的来进行遍历
                arrays.push(this.typeId);// cid为获得到的整条数据中的一列
            });
            var idcard = arrays.join(','); // 获得要删除的id
            $.ajax({
                type: "post",
                url: "${_ctx}/articleType/deleteArticleTypeByIds",
                data: {"idcard": idcard},
                success: function (data) {
                    if (data.status == 1) {
                        $("#myModal").modal('hide');
                        $('#exampleTableToolbar').bootstrapTable(('refresh'));
                    } else alert("请求失败")
                }
            })
        }
    }

    //提交按钮
    $("#submitArticleType").on("click", function () {
        var typeId = $("#typeId").val();
        var targetUrl = "${_ctx}/articleType/addArticleType";
        var targetUrl2 = "${_ctx}/articleType/editArticleType";
        var typeName = $("#articleTypeName").val();
        // var typeId = $("#typeId").val();
        if (typeId == null || typeId == "") {
            $.ajax({
                type: "post",
                url: targetUrl,
                data: {"typeName": typeName},
                success: function (data) {
                    if (data.status == 1) {
                        alert("添加成功");
                        $("#myModal").modal('hide');
                        $('#exampleTableToolbar').bootstrapTable(('refresh'));
                    } else alert("请求失败")

                }

            })
        } else {
            $.ajax({
                type: "post",
                url: targetUrl2,
                data: {"typeName": typeName, "typeId": typeId},
                success: function (data) {
                    if (data.status == 1) {
                        alert("修改成功");
                        $("#myModal").modal('hide');
                        $('#exampleTableToolbar').bootstrapTable(('refresh'));
                    } else alert("请求失败")
                }
            })
        }
    })

    //单个删除
    function DeleteTypeById(typeId) {
        swal({
            title: "您确定要删除此类型吗",
            text: "删除后将无法恢复，请谨慎操作！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "删除",
            closeOnConfirm: false
        }, function () {
            debugger;
            deleteOne(typeId);
            swal("删除成功！", "您已经永久删除了这条信息。", "success");
        });
    }

    function deleteOne(typeId) {
        $.ajax({
            data: {'typeId': typeId},
            type: 'post',
            url: "${_ctx}/articleType/deleteOneType",
            success: function (data) {
                if (data.status == 1) {
                    $('#exampleTableToolbar').bootstrapTable(('refresh'));
                } else alert("请求失败")
            }
        })
    }
</script>
</body>
</html>
