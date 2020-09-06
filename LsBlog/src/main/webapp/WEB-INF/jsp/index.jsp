<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/static/my/taglibs.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>后台管理模板</title>

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${_ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${_ctx}/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="${_ctx}/static/css/animate.css" rel="stylesheet">
    <link href="${_ctx}/static/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg fixed-nav" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img alt="image" class="img-circle" src="${_ctx}/static/img/profile_small.jpg"/></span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">admin</strong></span>
                                <span class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a class="J_menuItem" href="form_avatar.html">修改密码</a>
                            </li>
                            <li><a href="login.html">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">MVC
                    </div>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-table"></i>
                        <span class="nav-label">文章管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem"
                               href="${pageContext.request.contextPath}/articleType/toTable">文章类型管理</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="${pageContext.request.contextPath}/article/toList">文章管理</a>
                        </li>
                    </ul>
                    <a href="#">
                        <i class="fa fa-picture-o"></i>
                        <span class="nav-label">相册管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="#">相册管理</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="#">相片管理</a>
                        </li>
                    </ul>
                </li>
                <%--<li>
                    <a href="#"><i class="fa fa-picture-o"></i> <span class="nav-label">相册</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="basic_gallery.html">基本图库</a>
                        </li>
                        <li><a class="J_menuItem" href="carousel.html">图片切换</a>
                        </li>
                        <li><a class="J_menuItem" href="blueimp.html">Blueimp相册</a>
                        </li>
                    </ul>
                </li>--%>

            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-fixed-top" role="navigation" style="margin-bottom: 0 ;background:#345f73">
                <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i
                        class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                        <div class="form-group">
                            <input type="text" style=" color:#FFF; font-size:20px" value="后台管理系统" class="form-control"
                                   disabled="disabled" name="top-search" id="top-search">

                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown hidden-xs">
                        <a href="login.html" class="right-sidebar-toggle" aria-expanded="false">
                            <i class="fa fa fa-sign-out"></i>安全退出
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
            <a href="#" class="roll-nav roll-right J_tabExit" id="alarm-fullscreen-toggler"><i
                    class="fa fa-arrows-alt"></i> 全屏</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="index_v3.html?v=4.0" frameborder="0"
                    data-id="index_v1.html" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">&copy; 2019 <a href="#" target="_blank">西安捷天信息科技有限公司</a>
            </div>
        </div>
    </div>

</div>

<!-- 全局js -->
<script src="${_ctx}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${_ctx}/static/js/quanping.js"></script>
<script src="${_ctx}/static/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${_ctx}/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${_ctx}/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${_ctx}/static/js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="${_ctx}/static/js/hplus.js?v=4.1.0"></script>
<script type="text/javascript" src="${_ctx}/static/js/contabs.js"></script>

<!-- 第三方插件 -->
<script src="${_ctx}/static/js/plugins/pace/pace.min.js"></script>

</body>

</html>
