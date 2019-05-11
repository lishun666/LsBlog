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


</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <div class="row row-lg">
                <div class="col-sm-12">
                    <!-- Example Toolbar -->
                    <div class="example-wrap">
                        <h4 class="example-title">文章管理</h4>
                        <div class="example">
                            <div class="btn-group hidden-xs" id="exampleToolbar" role="group">
                                <button type="button" class="btn btn-outline btn-default"  id="addButton">
                                    <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                                </button>
                                <button type="button" class="btn btn-outline btn-default" data-toggle="modal" id="deleteButton" >
                                    <i class="glyphicon glyphicon-trash " aria-hidden="true"></i>
                                </button>
                            </div>
                            <table id="articleTableToolbar" data-mobile-responsive="true">
                            </table>
                        </div>
                    </div>
                </div>
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

<!-- Peity -->
<%--<script src="${_ctx}/static/js/demo/bootstrap-table-demo.js"></script>--%>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<!--统计代码，可删除-->

<script>
    $(function(){
        //初始化Table
        var oTable = new TableInit();
        oTable.Init();
    })



    var TableInit = function () {

        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#articleTableToolbar').bootstrapTable({
                url:'${_ctx}/article/findAllArticle',         //请求后台的URL（*）
                method: 'post',                      //请求方式（*）
                toolbar: '#exampleTableEventsToolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: true,                     //是否启用排序
                sortName:"id",
                sortOrder: "desc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                queryParamsType: 'limit',
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
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
                showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                iconSize: 'outline',
                contentType: "application/x-www-form-urlencoded", //解决POST提交问题
                showExport: true,                     //是否显示导出
                buttonsAlign:"right",  //按钮位置
                exportDataType: "selected",              //basic', 'all', 'selected'.
                exportTypes:['excel','txt','json', 'xml'],  //导出文件类型   //'json', 'xml', 'csv', 'txt', 'sql', 'excel'
                Icons:'glyphicon-export',
                responseHandler:function(res) {
                    return {
                        "rows": res.articleList   //数据
                    };
                },
                icons: {
                    refresh: 'glyphicon-repeat',
                    toggle: 'glyphicon-list-alt',
                    columns: 'glyphicon-list'
                },
                columns: [
                    {checkbox: true },
                /*    {
                        title: '序号',
                        field: '',
                        align: 'center',
                        formatter: function (value, row, index) {
                            var pageSize = $('#exampleTableEvents').bootstrapTable('getOptions').pageSize;     //通过table的#id 得到每页多少条
                            var pageNumber = $('#exampleTableEvents').bootstrapTable('getOptions').pageNumber; //通过table的#id 得到当前第几页
                            return pageSize * (pageNumber - 1) + index + 1;    // 返回每条的序号： 每页条数 *（当前页 - 1 ）+ 序号
                        }
                    },*/
                    {title:'文章编号',field: 'articleId',sortable:true ,align:"center" },

                    {title:'文章名字',align:"center",align:"center",field: 'articlename'},
                    {title:'文章类型',align:"center",align:"center",field: 'articleType.typeName'},
                    {title:'操作',field:"Button",align:"center",formatter:buttonFormatter,
                    /*    formatter:function (value, row, index) {
                            return [
                                '<i class="fa fa-edit editButton" style="cursor: pointer;" ></i>'
                            ].join("")

                        },events:operateEvents*/
                    }
                ],
            });
        };
                //得到查询的参数
                oTableInit.queryParams = function (params) {
                    var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                        pageSize: params.limit,   //页面大小
                        pageNumber:params.pageNumber, //页码
                        sortName: params.sort,	//排序列名
                        sortOrder:params.order,	//排序方式
                        searchText:params.search//搜索框参数
                    };
                    return temp;
                };
                return oTableInit;
    }
    //按钮初始化
    function buttonFormatter(value,row) {
        
            var id = value;
            var result = "";
            result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"EditTypeById('" + row.articleId +"')\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
            result += "<a href='javascript:;' class='btn btn-xs red' onclick=\"DeleteTypeByIds('" + id + "')\" title='删除'>" + "<span class='glyphicon glyphicon-remove'></span></a>";
            return result;
    }
    //新增类型
    $("#addButton").click(function () {
        $(location).attr('href', '${_ctx}/article/toDetailsPage');
    })
    //修改类型
    function EditTypeById(articleId){
        $(location).attr('href', '${_ctx}/article/toDetailsPage?articleId='+articleId);
    }
    //删除类型
    $("#deleteButton").on("click",function () {
        var rows = $("#exampleTableToolbar").bootstrapTable('getSelections');
        console.log(rows);
        if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
            alert("请先选择要删除的记录!");
            return;
        }else {
            var arrays = new Array();// 声明一个数组
            $(rows).each(function () {// 通过获得别选中的来进行遍历
                arrays.push(this.typeId);// cid为获得到的整条数据中的一列
            });
            var idcard = arrays.join(','); // 获得要删除的id
            $.ajax({
                type:"post",
                 url: "${_ctx}/articleType/deleteArticleTypeByIds",
                data:{"idcard":idcard},
                success:function(data){
                    if(data.status == 1){
                        alert("删除成功");
                        $("#myModal").modal('hide');
                        $('#exampleTableToolbar').bootstrapTable(('refresh'));
                    }else alert("请求失败")

                }


            })
        }
    })

</script>

</body>
</html>
