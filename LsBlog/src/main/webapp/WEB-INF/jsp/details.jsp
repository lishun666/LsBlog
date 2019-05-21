<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/static/my/taglibs.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="${_ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${_ctx}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${_ctx}/static/css/animate.css" rel="stylesheet">
    <link href="${_ctx}/static/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="${_ctx}/static/css/plugins/summernote/summernote-bs4.css" rel="stylesheet">
    <link href="${_ctx}/static/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${_ctx}/static/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5 id="title">新增文章</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="form_basic.html#">选项1</a>
                            </li>
                            <li><a href="form_basic.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal m-t" id="articleForm">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">文章名字：</label>
                            <div class="col-sm-5">
                                <input id="articleName" name="articlename" class="form-control" type="text" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">文章类型：</label>
                            <div class="col-sm-5">
                                <select class="form-control m-b" id="selector">
                                    <option>---请选择文章类型---</option>
                                    <c:forEach var="type" items="${typeList}">
                                        <option value="${type.typeId}">${type.typeName}</option>
                                    </c:forEach>
                                </select>
<%--                                <input id="lastname" name="type_name" class="form-control" type="s" aria-required="true" aria-invalid="false" class="valid">--%>
                            </div>
                        </div>
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>编辑文章内容</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="form_editors.html#">
                                        <i class="fa fa-wrench"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-user">
                                        <li><a href="form_editors.html#">选项1</a>
                                        </li>
                                        <li><a href="form_editors.html#">选项2</a>
                                        </li>
                                    </ul>
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content no-padding">
                                <div class="summernote"> </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-5 col-sm-offset-3">
                                <button class="btn btn-primary"  id="submitbutton">提交</button>
                                <div class="btn btn-white" id="exitbutton">取消</div>
<%--                                <button class="btn btn-primary"  >取消</button>--%>
                            </div>
                        </div>
                    </form>
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

<!-- jQuery Validation plugin javascript-->
<script type="text/javascript" src="${_ctx}/static/js/plugins/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="${_ctx}/static/js/plugins/validate/messages_zh.min.js"></script>

<script type="text/javascript"  src="${_ctx}/static/js/demo/form-validate-demo.js"></script>
<script type="text/javascript" src=${_ctx}/static/js/dist/jquery.validate.js"></script>
<script type="text/javascript" src="${_ctx}/static/js/plugins/summernote/summernote.min.js"></script>
<script type="text/javascript" src="${_ctx}/static/js/plugins/summernote/summernote-zh-CN.js"></script>
<script src="${_ctx}/static/js/plugins/sweetalert/sweetalert.min.js"></script>

<!--统计代码，可删除-->
<script>
        $(document).ready(function () {
            $('.summernote').summernote({
                height: 300,
                lang: 'zh-CN',
                callbacks:{
                    //保存图片的方法
                    onImageUpload: function(files, editor, $editable) {
                        sendFile(files, editor, $editable);
                    },
                    // 删除图片的方法
                    onMediaDelete:function (target) {
                        deleteFile(target);
                    }
                }
            });
            if ("${articleId}" != '' ){
                UpdateArticle(${articleId});
            }
        })
        //初始化修改页面
        function UpdateArticle(id) {
                $("#title").html("修改文章");
                $.ajax({
                    data:{articleId: id },
                    type: "POST",
                    url: "${_ctx}/article/findArticleById",
                    headers: {
                        Accept: "application/json; charset=utf-8"
                    },
                    success: function (data) {
                        $("#articleName").val(data.article.articlename);
                        $("#selector").val(data.article.articleType.typeId);
                        var text = data.article.articlecontent;
                        $('.summernote').summernote('code', text);
                        $.ARTICLECONTENT = data.article.articlecontent;
                    }
                })
        }
        //删除图片
        function deleteFile(target) {
            var imgSrc = target.context.currentSrc;
            var data = new FormData();
            data.append("imgSrc", imgSrc);
            $.ajax({
                data: data,
                type: "POST",
                url: "${_ctx}/article/deleteImg",
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    console.log(data);
                }
            });
        }
        //文件上传
        function sendFile(files, editor, $editable) {
            var file = files[0];
            var data = new FormData();
            data.append("file", file);
            $.ajax({
                data: data,
                type: "POST",
                processData: false,
                contentType: false,
                cache: false,
                url: '${_ctx}/article/uploadImgs',
                success: function(data) {
                    if (data.status == 1){
                        var path = data.imgPath;
                        //回显图片
                        $('.summernote').summernote('insertImage', path);
                    }else{
                        console.log('图片上传失败');
                    }
                }
            });
        }
        var edit = function () {
            $("#eg").addClass("no-padding");
            $('.click2edit').summernote({
                lang: 'zh-CN',
                focus: true
            });
        };
        var save = function () {
            $("#eg").removeClass("no-padding");
            var aHTML = $('.click2edit').code();
            $('.click2edit').destroy();
        };

            $.validator.setDefaults({
                submitHandler: function() {
                    var articleId = '${articleId}';
                    var articlename = $("#articleName").val();
                    var typeId = $("#selector").val();
                    var articlecontent = $('.note-editable').html();
                    if (articleId == '') {
                        addSubmit(articlename,typeId,articlecontent);
                    }else {
                        if( $.ARTICLECONTENT == articlecontent){
                            swal({
                                title: "文章未做任何修改",
                                text: "此次未做认和修改，是否返回文章列表页面",
                                type: "warning",
                                showCancelButton: true,
                                confirmButtonColor: "#DD6B55",
                                confirmButtonText: "返回",
                                closeOnConfirm: false
                            }, function () {
                                $(window).attr("location","${_ctx}/article/toList");
                            });
                        }else {
                            editSubmit(articleId,articlename,typeId,articlecontent);
                        }
                    }
                    }
            });


        //添加文章提交
        function addSubmit(articlename,typeId,articlecontent){
            $.ajax({
                type:"post",
                data:{"articlename":articlename,"typeId":typeId,"articlecontent": articlecontent},
                url:"${_ctx}/article/addArticle",
                success:function(data) {
                    if (data.status == 1) {
                        alert("添加成功");
                        $(window).attr("location","${_ctx}/article/toList");
                    } else alert("请求失败")
                }
            })
        }
        //修改文章提交
        function editSubmit(articleId,articlename,typeId,articlecontent){
            $.ajax({
                type:"post",
                data:{"articleId":articleId,"articlename":articlename,"typeId":typeId,"articlecontent": articlecontent},
                url:"${_ctx}/article/editArticle",
                success:function(data) {
                    if (data.status == 1) {
                        alert("修改成功");
                        $(window).attr("location","${_ctx}/article/toList");
                    } else alert("请求失败")
                }
            })
        }
        //表单校验
        $().ready(function() {
             $("#articleForm").validate({
                 rules:{
                     articlename:"required"
                 },
                 messages:{
                     articlename:"请输入文章名"
                 }
             });

        });
            $('#exitbutton').on("click",function(){
                swal({
                    title: "是否确认退出",
                    text: "退出后您的编辑内容将不会保存",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "退出",
                    closeOnConfirm: false
                }, function () {
                    $(window).attr("location","${_ctx}/article/toList");
                    //swal("删除成功！", "您已经永久删除了这条信息。", "success");
                });
            })
</script>

</body>

</html>

