<%--
  Created by IntelliJ IDEA.
  User: PoSui
  Date: 2020/9/30
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <style type="text/css">


        .pure-table {
            border-collapse: collapse;
            border-spacing: 0;
            empty-cells: show;
            border: 1px solid #cbcbcb;
        }

        .pure-table caption {
            color: #000;
            font: italic 85%/1 arial,sans-serif;
            padding: 1em 0;
            text-align: center;
        }

        .pure-table td,.pure-table th {
            border-left: 1px solid #cbcbcb;
            border-width: 0 0 0 1px;
            font-size: inherit;
            margin: 0;
            overflow: visible;
            padding: .5em 1em;
        }

        .pure-table thead {
            background-color: #e0e0e0;
            color: #000;
            text-align: left;
            vertical-align: bottom;
        }

        .pure-table td {
            background-color: transparent;
        }
    </style>
    <title>停车场信息管理系统</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <!-- Bootstrap -->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--分页内容-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
    <script src="${pageContext.request.contextPath}/js/index.js" type="text/javascript" charset="utf-8"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/calender.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/calender.css">

    <!--表格样式-->
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/table.js"></script>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootbox/bootbox.min.js"></script>

    <!--图标样式-->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">

</head>
<body style="background-color: #D3D3D3">
<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0px">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="" style="color: black">停车场信息管理系统</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <%--<li><p class="navbar-text">${sessionScope.user.username},</p></li>--%>
            <%--<li><a href="${pageContext.request.contextPath}/userController/signOut?logout=true"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>--%>
        </ul>
    </div>
</nav>
<div class="row" style="width: 100%;">
    <div class="col-md-3">
        <div class="navbar_left_0">
            <div class="user">
<%--                <div class="user__pic"></div>--%>
                <div class="user__name" style="color: black;font-weight: bold;font-style: oblique ">欢迎${sessionScope.user.username}使用本系统</div>
            </div>
            <div class="bar">
                <div class="options">
                    <ul>
                        <li class="active" style="color: black"><i href="#home" data-toggle="tab" class="fa fa-home"> Home</i></li>
                        <span class="options__division">基本功能</span>
                        <li><i data-toggle="tab" href="#userMsg_tab" onclick="showUserMsg()" class="fa fa-id-card"> 基本信息</i></li>
                        <li><i data-toggle="tab" href="#tokens_tab" onclick="showTokens()" class="fa fa-credit-card"> 我的卡券</i></li>
                        <li><i data-toggle="tab" href="#carsMsg_tab" onclick="showCars()" class="fa fa-car"> 车辆管理</i></li>
 <!--onclick="showParkingTime()"-->
                        <li><i data-toggle="tab" href="#parkingTime_tab"  onclick="getParkingRecords()" class="fa fa-clock"> 停车记录</i></li>
                        <li><i data-toggle="tab" href="#fare_tab" onclick="getParkingMsg()" class="fa fa-university"> 停车费用</i></li>
<%--                        <li><i data-toggle="tab" href="#parking_tab" onclick="showParking()" class="fa fa-bars"> 车位情况</i></li>--%>
                    </ul>
                </div>
                <div class="settings">
                    <ul>
                      <!--  <li class="acc-settings"><i class="fas fa-cog"></i> Account Settings</li> -->
                        <li><a href="${pageContext.request.contextPath}/userController/signOut?logout=true" class="fas fa-sign-out-alt"> Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class='box'>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="home">
                    <div style="margin-bottom: 15px;text-align: center">
                        <p style="letter-spacing: 0;color: #6495ED;font-size: 50px;
                    text-shadow:0px 1px 0px #999, 0px 2px 0px #888, 0px 3px 0px #777, 0px 4px 0px #666, 0px 5px 0px #555, 0px 6px 0px #444, 0px 7px 0px #333, 0px 8px 7px #001135">
                            欢迎使用停车场管理系统</p>
                    </div>
                    <div id="myCarouse" class="carousel slide">
                        <!-- 轮播（Carousel）指标 -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarouse" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarouse" data-slide-to="1"></li>
                            <li data-target="#myCarouse" data-slide-to="2"></li>
                        </ol>
                        <!-- 轮播（Carousel）项目 -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="${pageContext.request.contextPath}/pic/car1.jpg" alt="First slide">
                            </div>
                            <div class="item">
                                <img src="${pageContext.request.contextPath}/pic/car2.jpg" alt="Second slide">
                            </div>
                            <div class="item">
                                <img src="${pageContext.request.contextPath}/pic/car3.png" alt="Third slide">
                            </div>
                        </div>
                        <!-- 轮播（Carousel）导航 -->
                        <a class="left carousel-control" href="#myCarouse" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarouse" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>



                <div class="tab-pane fade" id="userMsg_tab">
                </div>

<!--我的卡券-->

                <!--购买卡券模块 -->
                <div class="modal fade" id="tokenAddingModal">
                    <div class="modal-dialog modal-lg modal_position" style="width:480px">
                        <div class="modal-content">

<%--                            <div class="modal-header">--%>
<%--                                <button type="button" class="close" data-dismiss="modal">&times;</button>--%>
<%--                                <h4 class="modal-title" title="carsTable">添加</h4>--%>
<%--                            </div>--%>

                            <div class="modal-header">
                            <!--    <button type="button" class="close" data-dismiss="modal">&times;购买</button> -->
                                <h1 class="modal-title" title="tokenAddingModal">购买卡券</h1><br>
                         <!-- <span style="text-align: center;font-weight: bold">确认订单</span><br><br>
-->
                            </div>
                            <div class="modal-body">
                                <div align="center">
                                <!--    <img src="${pageContext.request.contextPath}/pic/wxzf.jpg"> -->
                                    <table class='table table-bordered'>
                                        <thead>
                                        <tr>
                                            <th>车牌号码</th><th>收费方案</th><th>支付金额</th>
                                        </tr>
                                        </thead>
                                        <tbody id='tokenOrder_body'>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                <button onclick='addToken()' type="button" class="btn btn-primary">确定</button>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="tab-pane fade" id="tokens_tab">
                    <div>
<%--                        <button onclick='addToken()' class="btn btn-primary btn-lg" data-toggle="modal" data-target="#tokenAddingModal">--%>
<%--                            <span>购买卡券</span>--%>
<%--                        </button>--%>
                    </div>
                    <table class='table table-bordered'>
                        <thead>
                        <tr>
                            <th>卡号</th><th>车牌号码</th><th>办理时间</th><th>到期时间</th>
                        </tr>
                        </thead>
                        <tbody id='tokens_body'></tbody>
                    </table>
                </div>

<!--停车记录-->

                <div class="tab-pane fade" id="parkingTime_tab">
                    <table class='table table-bordered'>
                        <thead>
                        <tr>
                            <th>车牌号码</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>总时长(h)</th>
                            <th>消费金额</th>
                        </tr>
                        </thead>
                        <tbody id='time_body'>


                        </tbody>
                    </table>
                    <div id = 'time_body_pagetable'></div>
                </div>


<!--添加车辆模块 -->


                <div class="tab-pane fade" id="carsMsg_tab">
                    <p id="carMsg_p" hidden></p>
                    <div class="export">
                        <button onclick='addCar()' id="new_add" type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#carsTable">
                            <img src="${pageContext.request.contextPath}/pic/add.png"/>
                            <span>添加</span>
                        </button>
                    </div>
                    <!--这里用来点击添加使用-->
                    <div class="modal fade" id="carsTable">
                        <div class="modal-dialog modal-lg modal_position">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title" title="carsTable">添加</h4>
                                </div>
                                <div class="modal-body">
                                    <table id="xztb" class="table">
                                        <tbody>
                                        <tr>
                                            <td class="tb_bg"><label for="licenseNum"><p style="font-size: 14px; color: red;">*</p>车牌号码</label>
                                            </td>
                                            <td><input id="licenseNum" type="text" placeholder="请输入车牌号码"/></td>
                                            <td class="tb_bg"><label for="brand"><p style="font-size: 14px; color: red;">*</p>汽车品牌</label>
                                            </td>
                                            <td><input id="brand" type="text" placeholder="请输入汽车品牌"/></td>
                                        </tr>
                                        <tr>
                                            <td class="tb_bg"><label for="color"><p style="font-size: 14px; color: red;">*</p>汽车颜色</label>
                                            </td>
                                            <td><input id="color" type="text" placeholder="请输入汽车颜色"/></td>
                                            <td class="tb_bg"><label for="formula">收费方案</label></td>
                                            <td>
                                                <select id="formula" class="form-control select_down" style="font-size: 13px; color: #666;">
                                                    <option id="f1">普通计费</option>
                                                    <option id="f2">月卡</option>
                                                    <option id="f3">年卡</option>
                                                </select>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                    <button onclick='modifyOrAdd();addTokenOrder()' id="add_btn" type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                                </div>
                            </div>
                        </div>
                    </div>
<!--这里用来点击编辑使用-->


                    <!--车辆管理-->
                    <table id="cars_tb" class="table">
                        <thead>
                        <tr>
                            <th>车牌号码</th>
                            <th>汽车品牌</th>
                            <th>汽车颜色</th>
                            <th>收费方案</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="carsTBody">

                        </tbody>
                    </table>
                </div>


<!--停车费用-->

                <div class="tab-pane fade" id="fare_tab">
                    <div class="box">
                        <button  onclick="getCarMsgOnlyName()" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#parkingAddCar" style="width: 740px">
                            <span>点击按钮停放车辆</span>
                        </button>
<!--支付费用模块-->
                        <div class="modal fade" id="payModal">
                            <div class="modal-dialog modal-lg modal_position" style="width: 580px">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title" title="payModalTitle">支付</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div align="center">
                                            <img src="${pageContext.request.contextPath}/pic/wxzf.jpg">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                        <button onclick='hasPaid()' type="button" class="btn btn-primary">确定</button>
                                    </div>
                                </div>
                            </div>
                        </div>
<!--添加车辆进入停车场模块-->
                        <div class="modal fade" id="parkingAddCar">
                            <div class="modal-dialog modal-lg modal_position" style="width: 580px">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title" title="payModalTitle">添加车辆</h4>
                                    </div>
                                    <div class="modal-body" id="intoParking">
                                        <div align="center">
                                            <table id="parkingAddCar_tb" class="pure-table">
                                                <thead>
                                                <tr>
                                                    <th>车牌号码</th>
                                                    <th>汽车品牌</th>
                                                    <th>汽车颜色</th>
                                                    <th>收费方案</th>
                                                    <th>选择入库</th>
                                                </tr>
                                                </thead>
                                                <tbody id="parkingAddCarTBody">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                        <button onclick='setBeginTime();getParkingMsg()' type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
                                    </div>
                                </div>
                            </div>
                        </div>
<!--支付表单-->
                        <div class="modal fade" id="OrderPay">
                            <div class="modal-dialog modal-lg modal_position" style="width: 980px">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title" title="payModalTitle">确认订单</h4>
                                    </div>
                                    <div class="modal-body" id="Order">
                                        <div align="center">
                                            <table id="Order_tb" class="pure-table">
                                                <thead>
                                                <tr>
                                                    <th>订单编号</th>
                                                    <th>开始时间</th>
                                                    <th>结束时间</th>
                                                    <th>总计停放时间（小时）</th>
                                                    <th>付款金额（元）</th>
                                                </tr>
                                                </thead>
                                                <tbody id="OrderPayTBody">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                        <button onclick='AliPay()' type="button" class="btn btn-primary">确定</button>
                                    </div>
                                </div>
                            </div>
                        </div>


<!--停车费用模块-->
                        <table id="fares_tb" class="table">
                            <thead>
                            <tr>
                                <th>车牌号码</th>
                                <th>汽车品牌</th>
                                <th>汽车颜色</th>
                                <th>收费方案</th>
                                <th>开始时间</th>
                                <th>是否支付</th>
                            </tr>
                            </thead>
                            <tbody id="faresTBody">

                            </tbody>
                        </table>
                    </div>
                </div>

<!--车位概况-->

                <div class="tab-pane fade" id="parking_tab">
                    <div class="export">
                        <button onclick='showParking()' id="parking_flush" type="button" class="btn btn-primary btn-sm">
                            <i class="fa fa-refresh"> 刷新</i>
                        </button>
                    </div>
                    <table class='table table-bordered'>
                        <thead>
                        <tr>
                            <th>A</th><th>B</th><th>C</th><th>D</th><th>E</th><th>F</th><th>G</th><th>H</th><th>I</th><th>J</th>
                        </tr>
                        </thead>
                        <tbody id='parking_body'></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>






    <div class="col-md-3">
        <div class="box" style="height: 200px;margin-top: 5px;border: blue;border-width: 1px">
            <div class="title"><span>公告</span></div>
            <ul style="margin-top: 3px">
                <li>普通计费：5元每小时</li>
                <li>月卡费用：500元   </li>
                <li>年卡费用：5000元  </li>
                <li>购买卡券后，每次支付0.01元手续费</li>
            </ul>
        </div>
        <!--日历-->
        <div class="calendar" style="margin-top: 20px">
            <div class="header">
                <a data-action="prev-month" href="javascript:void(0)" title="Previous Month"><i></i></a>
                <div class="text" data-render="month-year"></div>
                <a data-action="next-month" href="javascript:void(0)" title="Next Month"><i></i></a>
            </div>
            <div class="months" data-flow="left">
                <div class="month month-a">
                    <div class="render render-a"></div>
                </div>
                <div class="month month-b">
                    <div class="render render-b"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--</div>--%>

</body>
<script type="text/javascript">

    var userMsgShown = false;
    var carsMsgShown = false;
    var parkingTimeShown = false;
    var tokensShown = false;
    var faresShown = false;
    var paid = false;
    var oldFormula;
    //显示个人信息
    function showUserMsg() {
        // $("#member_body").empty();
        if (!userMsgShown){
            userMsgShown = true;

            var username = "${sessionScope.user.username}";

            var table = "<table id=\"user_tb\" class=\"table\"><thead><tr><th></th><th>用户基本信息</span></th></th><th></th></tr></thead></table>";
            $("#userMsg_tab").append(table);

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/driverController/getDriverMsg.username',
                data: {
                    "username": username
                },
                dataType: 'json',
                success: function (result) {
                    if(result != null){
                        var driverId = result.driverId;
                        var tBody = "<tbody id='"+driverId+"'></tbody>";
                        $("#user_tb").append(tBody);

                        var t1 = "<tr id='t1' style='height: 50px'><th>姓名</th><th id='t1_th2'>"+result.driverName+"</th><th><a id='t1_a1' onclick='modifyUserMsg(this)'>修改</a><a id='t1_a2' onclick='cancelModification(this)' hidden>取消 </a><a id='t1_a3' onclick='confirmModification(this)' hidden>保存</a></th></tr>";
                        var t2 = "<tr id='t2' style='height: 50px'><th>性别</th><th id='t2_th2'>"+result.gender+"</th><th><a id='t2_a1' onclick='modifyUserMsg(this)'>修改</a><a id='t2_a2' onclick='cancelModification(this)' hidden>取消 </a><a id='t2_a3' onclick='confirmModification(this)' hidden>保存</a></th></tr>";
                        var t3 = "<tr id='t3' style='height: 50px'><th>手机号码</th><th id='t3_th2'>"+result.phone+"</th><th><a id='t3_a1' onclick='modifyUserMsg(this)'>修改</a><a id='t3_a2' onclick='cancelModification(this)' hidden>取消 </a><a id='t3_a3' onclick='confirmModification(this)' hidden>保存</a></th></tr>";
                        var t4 = "<tr id='t4' style='height: 50px'><th>身份证号码</th><th id='t4_th2'>"+result.idCardNum+"</th><th><a id='t4_a1' onclick='modifyUserMsg(this)'>修改</a><a id='t4_a2' onclick='cancelModification(this)' hidden>取消 </a><a id='t4_a3' onclick='confirmModification(this)' hidden>保存</a></th></tr>";
                        var t5 = "<tr id='t5' style='height: 50px'><th>所在地</th><th id='t5_th2'>"+result.address+"</th><th><a id='t5_a1' onclick='modifyUserMsg(this)'>修改</a><a id='t5_a2' onclick='cancelModification(this)' hidden>取消 </a><a id='t5_a3' onclick='confirmModification(this)' hidden>保存</a></th></tr>";
                        $("#"+driverId).append(t1,t2,t3,t4,t5);

                    }
                }
            })
        }
    }

    function cancelModification(item) {
        var tr_id = $(item).parents("tr").attr("id");
        var value = $("#"+tr_id+"_th2")[0].children[0].value;

        if( tr_id == "t2"){
            if(value == "male"){
                value = "男";
            }else{
                value = "女";
            }
        }

        $("#"+tr_id+"_th2").empty();
        $("#"+tr_id+"_th2").append(value);

        $("#"+tr_id+"_a1").show();
        $("#"+tr_id+"_a2").hide();
        $("#"+tr_id+"_a3").hide();
    }

    //修改个人信息
    function modifyUserMsg(item) {
        var tr_id = $(item).parents("tr").attr("id");

        var value = $("#"+tr_id+"_th2")[0].textContent;
        $("#"+tr_id+"_th2").empty();
        if (tr_id == "t1") {
            $("#"+tr_id+"_th2").append("<input style='width: 300px' type=\"text\" placeholder=\"请输入姓名\" value='"+value+"'>");
        }else if (tr_id == "t2"){
            $("#"+tr_id+"_th2").append("<input type=\"radio\" name=\"gender\" value=\"male\" checked>男<input type=\"radio\" name=\"gender\" value=\"female\">女");
        } else if (tr_id == "t3"){
            $("#"+tr_id+"_th2").append("<input style='width: 300px' type=\"number\" placeholder=\"请输入手机号码\" value='"+value+"'>");
        }else if (tr_id == "t4"){
            $("#"+tr_id+"_th2").append("<input style='width: 300px' type=\"text\" placeholder=\"请输入身份证号码\" value='"+value+"'>");
        }else if (tr_id == "t5"){
            $("#"+tr_id+"_th2").append("<input style='width: 300px' type=\"text\" placeholder=\"请输入所在地\" value='"+value+"'>");
        }
        $("#"+tr_id+"_a1").hide();
        $("#"+tr_id+"_a2").show();
        $("#"+tr_id+"_a3").show();
    }

    //确认修改信息
    function confirmModification(item) {
        var driverId = ${sessionScope.user.driverId}
        var tr_id = $(item).parents("tr").attr("id");
        var value = $("#"+tr_id+"_th2")[0].children[0].value;
        if( tr_id == "t2"){
            value = $("input[type='radio']:checked").val();
        }

        var change;
        if (tr_id == "t1") {
            change = driverId+"#t1#"+value;
        }else if (tr_id == "t2"){
            change = driverId+"#t2#"+value;
        } else if (tr_id == "t3"){
            change = driverId+"#t3#"+value;
        }else if (tr_id == "t4"){
            change = driverId+"#t4#"+value;
        }else if (tr_id == "t5"){
            change = driverId+"#t5#"+value;
        }

        if( tr_id == "t2"){
            if(value == "male"){
                value = "男";
            }else{
                value = "女";
            }
        }

        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/driverController/modifyMsg.change',
            data: {
                "change":change
            },
            dataType: 'json',
            success:function (result) {

            }
        })

        $("#"+tr_id+"_th2").empty();
        $("#"+tr_id+"_th2").append(value);

        $("#"+tr_id+"_a1").show();
        $("#"+tr_id+"_a2").hide();
        $("#"+tr_id+"_a3").hide();
    }

    //显示停车记录
    function showParkingTime() {
        if (!parkingTimeShown){
            parkingTimeShown = true;
            // var table = "<table class='table table-bordered'><thead><tr><th>车牌号码</th><th>开始时间</th><th>结束时间</th><th>总时长(h)</th></tr></thead><tbody id='time_body'></tbody></table>";
            // $("#parkingTime_tab").append(table);
            var driverId = ${sessionScope.user.driverId};

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/parkingTimeController/showTimes.driverId',
                data: {
                    "driverId": driverId
                },
                dataType: 'json',
                success: function (result) {
                    if(result != null){

                        for (var i = 0; i < result.length; i++) {
                            var time = result[i];
                            var begin = new Date(time.beginTime);
                            var b = begin.getFullYear()+"-"+(begin.getMonth()+1)+"-"+begin.getDate()+" "+begin.getHours()+":"+begin.getMinutes()+":"+begin.getSeconds();

                            var end = new Date(time.endTime);
                            var e = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate()+" "+end.getHours()+":"+end.getMinutes()+":"+end.getSeconds();
                            var tr = "<tr id='"+time.timeId+"'><th>"+time.licenseNum+"</th><th>"+b+"</th><th>"+e+"</th><th>"+time.totalTime+"</th></tr>";
                            $("#time_body").append(tr);
                        }
                    }
                }
            })
        }

    }
    function getParkingMsg(){
        if (!parkingTimeShown){
            parkingTimeShown = true;
            var driverId = ${sessionScope.user.driverId};
            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/parkingTimeController/getAllTime.driverId',
                data: {
                    "driverId": driverId
                },
                dataType: 'json',
                success: function (result) {
                    if(result!=null){
                        for (var i = 0; i < result.length; i++) {
                            var tr = "<tr id='"+result[i].timeId+"'><th>"+result[i].licenseNum+"</th><th>"+result[i].brand+"</th><th>"+result[i].color+"</th>";
                            var th = "";
                            if(result[i].formulaId == 1){
                                th = "<th id='f1'>普通计费</th>";
                            }else if(result[i].formulaId == 2){
                                th = "<th id='f2'>月卡</th>";
                            }else if(result[i].formulaId == 3){
                                th = "<th id='f3'>年卡</th>";
                            }else {
                                th = "<th id='f4'>---</th>";
                            }
                            tr = tr+th;
                            var date = new Date(result[i].beginTime);
                            tr = tr+"<th>"+timestampToTime(date)+"</th><th><button data-toggle='modal' data-target='#OrderPay' onclick='setEndTime(this);getOrder(this)' timeId='"+result[i].timeId+"' formulaId='"+result[i].formulaId+"'>支付</button></th></tr>"
                            $("#faresTBody").append(tr);
                        }

                    }else {
                        console.log("no");
                    }
                }
            })
        }
    }
<!--插入结束时间-->
    function setEndTime(item){
            var id = $(item).attr("timeId");
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/parkingTimeController/setEndTime',
                data: {
                    "timeId":id
                },
                dataType: 'json',
            })

    }
<!--获取订单并刷新到页面-->
    <!--在获取订单这里接着写！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->
    var copyResult;
    function getOrder(item){
        $("#OrderPayTBody").empty();
        var id = $(item).attr("timeId");
        var formulaId = $(item).attr("formulaId");

        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/fareController/getParkingMsgToOrder',
            data: {
                "timeId":id
            },
            dataType: 'json',
            success:function (result){

                var OrderArr = eval(result);
                if(OrderArr.formulaId!= "1"){
                    OrderArr.money=0.01;
                }
                console.log(OrderArr);
                copyResult =result;
                //copyResult=result;
                // console.log(OrderArr);
                // console.log(OrderArr.orderId);
                var tr = "<tr><th>"+OrderArr.orderId+"</th><th>" + timestampToTime(OrderArr.beginTime) + "</th><th>" + timestampToTime(OrderArr.endTime) + "</th><th>" + OrderArr.totalTime + "</th><th>" + OrderArr.money + "</th></tr>";
                // var tr = "<tr><th>"+result+"</th></tr>";
                $("#OrderPayTBody").append(tr);
                //var obj = jquery.parseJSON(result);
            }
        })

    }

   <!--时间戳转时间-->
    function timestampToTime(timestamp) {
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        Y = date.getFullYear() + '-';
        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        D = date.getDate() + ' ';
        h = date.getHours() + ':';
        m = (date.getMinutes() < 10 ? '0'+(date.getMinutes()) : date.getMinutes()) + ':';
        s = (date.getSeconds() < 10 ? '0'+(date.getSeconds()) : date.getSeconds());
        return Y+M+D+h+m+s;
    }
<!--alipay-->
    function AliPay(){

        location.href="${pageContext.request.contextPath}/alipay/orderPay?orderId="+copyResult.orderId+"&money="+copyResult.money+"";
    }
    <!--alipayToken-->
    function tokenOrderPay(){
        var orderId=sj();
        TokenOrderId+=orderId;
        location.href="${pageContext.request.contextPath}/alipay/orderPay?orderId="+TokenOrderId+"&money="+Tokenmoney+"";

    }
    <!--整点随机数-->
    function sj() {
        //x上限，y下限
        var x = 100000;
        var y = 0;
        var rand = parseInt(Math.random() * (x - y + 1) + y);
        return rand;
    }
<!--停车记录-->
    <!--分页-->
    function getParkingRecords(){
        var driverId = ${sessionScope.user.driverId};
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/fareController/getParkingRecords',
            data: {
                "driverId": driverId
            },
            dataType: 'json',
            success :function (result){
                var nums = result.length, // 总数
                    counts = 15; // 每页个数
                var p = new Page({
                    el: '#time_body_pagetable',
                    nums: nums,
                    counts: counts,
                    defaultPage: 1,
                    defaultPage: 1,
                    showHeadFoot: !false, // 显示首页尾页
                    jumpToOrder: true,  // 跳转到指定页
                    showNowAndAll: true, // 当前页/共几页
                    clickEvent: function(currectPage) {
                        $("#time_body").empty();
                        var i = currectPage*15;
                        for(var j=i-15;j<i;j++){
                            var tr = "<tr><th>"+result[j].licenseNum+"</th><th>"+timestampToTime(result[j].beginTime)+"</th><th>"+timestampToTime(result[j].endTime)+"</th><th>"+result[j].totalTime+"</th><th>"+result[j].money+"</th></tr>";
                            $("#time_body").append(tr);

                        }


                        // alert('点击了第' + currectPage + "页");
                        // console.log('点击了第' + currectPage + "页");
                    }
                });
                //console.log(p)


            }
        }
        )}

// function page(){
//        console.log(ParkingRecords.length);
//     var nums = $(ParkingRecords).length, // 总数
//         counts = 10; // 每页个数
//     var p = new Page({
//         el: '#time_body_pagetable',
//         nums: nums,
//         counts: counts,
//         defaultPage: 1,
//         defaultPage: 1,
//         showHeadFoot: !false, // 显示首页尾页
//         jumpToOrder: true,  // 跳转到指定页
//         showNowAndAll: true, // 当前页/共几页
//         clickEvent: function(currectPage) {
//             $(time_body).empty();
//             var i = currectPage*10;
//             for(var j=i-10;j<i;j++){
//                 $(time_body).append(j);
//             }
//             // alert('点击了第' + currectPage + "页");
//             // console.log('点击了第' + currectPage + "页");
//         }
//     });
//     //console.log(p)
// }

    //显示拥有的车辆信息
    function showCars() {
        var driverId = "${sessionScope.user.driverId}";

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/carController/findCarsByDriverId.driverId',
                data: {
                    "driverId": driverId
                },
                dataType: 'json',
                success: function (result) {
                    if(result != null){
                    $("#carsTBody").empty();
                        for (var i = 0; i < result.length; i++) {
                            var car = result[i];
                            var tr = "<tr id='"+car.carId+"'><th>"+car.licenseNum+"</th><th>"+car.brand+"</th><th>"+car.color+"</th></tr>";
                            $("#carsTBody").append(tr);

                            if(car.formulaId == 1){
                                var th = "<th id='f1'>普通计费</th>";
                                $("#"+car.carId).append(th);
                            }else if(car.formulaId == 2){
                                var th = "<th id='f2'>月卡</th>";
                                $("#"+car.carId).append(th);
                            }else if(car.formulaId == 3){
                                var th = "<th id='f3'>年卡</th>";
                                $("#"+car.carId).append(th);
                            }else {
                                var th = "<th id='f4'>---</th>";
                                $("#"+car.carId).append(th);
                            }

                            var a = "<th><a onclick='showEditModal(this)' class=\"edit\" data-toggle=\"modal\"  data-target=\"#carsTable\">编辑</a><a onclick='deleteCar(this)' class=\"del\">删除</a></th>";
                            $("#"+car.carId).append(a);
                        }
                    }
                }
            })
    }
<!--取得车辆部分信息-->
    function getCarMsgOnlyName(){
        var driverId = "${sessionScope.user.driverId}";
        if(!carsMsgShown){
            carsMsgShown = true;

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/carController/findCarsByDriverId.driverId',
                data: {
                    "driverId": driverId
                },
                dataType: 'json',
                success: function (result) {
                    if(result != null){

                        for (var i = 0; i < result.length; i++) {
                            var car = result[i];
                            var tr = "<tr id='"+car.carId+"'><th>"+car.licenseNum+"</th><th>"+car.brand+"</th><th>"+car.color+"</th>";
                            var th = "";
                            if(car.formulaId == 1){
                                th = "<th id='f1'>普通计费</th>";
                            }else if(car.formulaId == 2){
                                th = "<th id='f2'>月卡</th>";
                            }else if(car.formulaId == 3){
                                th = "<th id='f3'>年卡</th>";
                            }else {
                                th = "<th id='f4'>---</th>";
                            }
                            tr = tr+th;
                            tr = tr+"<th><input type='checkbox' name='carCheckBox' value ='"+car.carId+"'>入库</th>";
                            tr = tr+"</tr>";
                            $("#parkingAddCarTBody").append(tr);
                        }
                    }
                }
            })
        }
    }
<!--插入开始停车时间-->
    function setBeginTime(){

            var checkID = [];
            $("input[name='carCheckBox']:checked").each(function(i){
                    console.log($(this).val());
                checkID[i] = $(this).val();
            });
        <!--记得把ajax放在else里-->
            // for(var j =0;j<checkID.length;j++){
            //     if (checkID[j] == 6){
            //         alert("你所选择的车辆可能已经入库，请重新选择");
            //     }else {
            //
            //     }
            // }
        $.ajax({
            type: 'post',
            data:{
                "ids":checkID.toString()
            },
            url: '${pageContext.request.contextPath}/parkingTimeController/addTime'
        });



    }
    function deleteCar(item) {

        var carId = $(item).parents('tr')[0].id;

        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/carController/deleteCar.carId',
            data: {
                "carId":carId
            }
        });
        $(item).parents('tr').remove();
    }

    function showEditModal(item) {
        var carId = $(item).parents('tr')[0].id;
        var licenseNum = $(item).parents('tr')[0].children[0].innerHTML;
        var brand = $(item).parents('tr')[0].children[1].innerHTML;
        var color = $(item).parents('tr')[0].children[2].innerHTML;
        oldFormula = $(item).parents('tr')[0].children[3].innerHTML;

        $("h4[title='carsTable']").text("编辑");
        $("h4[title='carsTable']").attr("id","modal_"+carId);
        $("#licenseNum").val(licenseNum);
        $("#brand").val(brand);
        $("#color").val(color);
    }

    function addCar() {
        $("h4[title='carsTable']").text("添加");
        $("h4[title='carsTable']").removeAttr("id");
        $("#licenseNum").val("");
        $("#brand").val("");
        $("#color").val("");
    }

    function modifyOrAdd() {
        var carId = $("h4[title='carsTable']")[0].id.substring(6);
        if (carId == "" || carId == null ||carId == undefined){
            var isOk = checkModal();
            if (isOk){
                addCarMsg();
            }
        }else {
            var isOk = checkModal();
            if (isOk){
                modifyCarMsg(carId);
            }
        }
    }

    //检查车辆信息不能为空
    function checkModal() {
        if ($('#licenseNum').val().trim()==='') {
            bootbox.alert({
                title: "温馨提示",
                message: "车牌号码不能为空",
                closeButton:false
            })
            hasNullMes = true;
            return false;
        }
        if ($('#brand').val().trim()==='') {
            bootbox.alert({
                title: "温馨提示",
                message: "汽车品牌不能为空",
                closeButton:false
            })
            hasNullMes = true;
            return false;
        }
        if ($('#color').val().trim()==='') {
            bootbox.alert({
                title: "温馨提示",
                message: "汽车颜色不能为空",
                closeButton:false
            })
            hasNullMes = true;
            return false;
        }
        return true;
    }

    //ajax添加车辆
    function addCarMsg() {
        var licenseNum = $("#licenseNum").val();
        var brand = $("#brand").val();
        var color = $("#color").val();
        var formula = $("#formula")[0].value;

        var formulaId;
        if(formula == "普通计费"){
            formulaId = 1;
        }else if(formula == '月卡'){
            formulaId = 2;
        }else if(formula == '年卡'){
            formulaId = 3;
        }
        var car = {
            "carId":0,
            "licenseNum":licenseNum,
            "brand":brand,
            "color":color,
            "formulaId":formulaId,
            "driverId":"${sessionScope.user.driverId}"
        }

        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/carController/addCar.car',
            data: car,
            dataType: 'json',
            success: function (result) {
                $("#carsTable").modal('hide');

                var tr = "<tr id='"+result.carId+"'><th>"+result.licenseNum+"</th><th>"+result.brand+"</th><th>"+result.color+"</th></tr>";
                $("#carsTBody").append(tr);

                if(result.formulaId == 1){
                    var th = "<th id='f1'>普通计费</th>";
                    $("#"+result.carId).append(th);
                }else if(result.formulaId == 2){
                    var th = "<th id='f2'>月卡</th>";
                    $("#"+result.carId).append(th);
                }else if(result.formulaId == 3){
                    var th = "<th id='f3'>年卡</th>";
                    $("#"+result.carId).append(th);
                }else {
                    var th = "<td id='f4'>---</td>";
                    $("#"+car.carId).append(th);
                }

                var a = "<th><a onclick='showEditModal(this)' class=\"edit\" data-toggle=\"modal\" data-target=\"#carsTable\">编辑</a><a onclick='deleteCar(this)' class=\"del\">删除</a></th>";
                $("#"+result.carId).append(a);
            }
        })
    }

    function modifyCarMsg(carId) {
        var licenseNum = $("#licenseNum").val();
        var brand = $("#brand").val();
        var color = $("#color").val();
        var formula = $("#formula")[0].value;

        var formulaId;
        if(formula == "普通计费"){
            formulaId = 1;
        }else if(formula == '月卡'){
            formulaId = 2;
            $("#tokenAddingModal").modal("show");
        }else if(formula == '年卡'){
            formulaId = 3;
            $("#tokenAddingModal").modal("show");
        }
        var car = {
            "carId":carId,
            "licenseNum":licenseNum,
            "brand":brand,
            "color":color,
            "formulaId":formulaId,
            "driverId":"${sessionScope.user.driverId}"
        };
        $("#carMsg_p").empty();
        $("#carMsg_p").append(JSON.stringify(car));

        if(formulaId == 1){
            paid = true;
            modifyCar(car,100);
            $("#carsTable").modal('hide');
        }
    }

    //ajax修改车辆信息
    function modifyCar(car,code) {
        if (paid && code == 100){
            var formula;
            if(car.formulaId == 1){
                formula = "普通计费";
            }else if(car.formulaId == 2){
                formula = "月卡";
            }else if(car.formulaId == 3){
                formula = '年卡';
            }
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/carController/modifyCar.car',
                data: car,
                dataType: 'json',
                success: function (result) {
                    paid = false;
                    $("tr#"+car.carId).empty();
                    var tds = "<th>"+car.licenseNum+"</th><th>"+car.brand+"</th><th>"+car.color+"</th><th>"+formula+"</th>"+
                        "<th><a onclick='showEditModal(this)' class=\"edit\" data-toggle=\"modal\" data-target=\"#carsTable\">编辑</a><a onclick='deleteCar(this)' class=\"del\">删除</a></th>";
                    $("tr#"+car.carId).append(tds);
                }
            })
        }
    }
    //给票券模态框添加信息
    var TokenOrderId;
    var Tokenmoney;
    function addTokenOrder(){
        $("#tokenOrder_body").empty();
        var carJson = $("#carMsg_p")[0].textContent;
        var car = JSON.parse(carJson);
        console.log(car);
        console.log(car.formulaId);
        var tr = "";
        if(car.formulaId == "2"){
            TokenOrderId = "2";
            fangan="月卡";
            Tokenmoney=500;
            tr = "<tr id = "+car.carId+"><th>"+car.licenseNum+"</th><th>月卡</th><th>500</th>";
        }else if(car.formulaId == "3"){
            TokenOrderId = "3";
            fangan="年卡";
            Tokenmoney=5000;
            tr = "<tr id = "+car.carId+"><th>"+car.licenseNum+"</th><th>年卡</th><th>5000</th>";
        }

        $("#tokenOrder_body").append(tr);

    }
//ajax添加票券
    function addToken() {
        var carJson = $("#carMsg_p")[0].textContent;
        var car = JSON.parse(carJson);

        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/tokenController/addToken.car',
            data: car,
            dataType: 'json',
            async: false,
            success: function (result) {
                paid = true;
                $("#tokenAddingModal").modal('hide');

                if(result.code == 200){
                    alert(result.error);
                }else if (result.code == 100){
                    if (tokensShown){
                        var token = result.token;
                        var begin = new Date(token.beginTime);
                        var b = begin.getFullYear()+"-"+(begin.getMonth()+1)+"-"+begin.getDate();
                        var end = new Date(token.endTime);
                        var e = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate();
                        var tr = "<th>"+token.tokenNum+"</th><th>"+result.licenseNum+"</th><th>"+b+"</th><th>"+e+"</th>";
                        $("#tokens_body").append(tr);
                    }
                }

                $("#tokenAddingModal").on('hidden.bs.modal',function () {
                    modifyCar(car,result.code);
                    $("#carsTable").modal('hide');
                });
            }
        });
        tokenOrderPay();
    }
<!--这tm是个啥？-->
    function addTime() {
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/parkingTimeController/addTime'
        });
    }



<!--查询卡券-->
    function showTokens() {
        if(!tokensShown){
            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/tokenController/showTokens.driverId',
                data: {
                    "driverId":${sessionScope.user.driverId}
                },
                dataType: 'json',
                success: function (result) {
                    tokensShown = true;
                    for (var i = 0;i < result.length;i++){
                        var token = result[i];
                        var begin = new Date(token.beginTime);
                        var b = begin.getFullYear()+"-"+(begin.getMonth()+1)+"-"+begin.getDate();
                        var end = new Date(token.endTime);
                        var e = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate();
                        var tr = "<tr><th>"+token.tokenNum+"</th><th>"+token.licenseNum+"</th><th>"+b+"</th><th>"+e+"</th></tr>";
                        $("#tokens_body").append(tr);
                    }
                }
            })
        }
    }
<!--查询费用-->
    function showFare() {
        if (!faresShown){
            faresShown = true;
            var driverId = ${sessionScope.user.driverId};

            $.ajax({
                type: 'get',
                url: '${pageContext.request.contextPath}/fareController/showFares',
                data: {
                    "driverId": driverId
                },
                dataType: 'json',
                success: function (result) {
                    if(result != null){

                        for (var i = 0; i < result.length; i++) {
                            var fare = result[i];

                            var paid;
                            if(fare.paid == 0){
                                paid = "<th id='paid_th_"+fare.fareId+"'><a onclick='addFareId(this)' data-toggle='modal' data-target='#payModal'>未支付</a></th>";
                            }else {
                                paid = "<th id='paid_th_"+fare.fareId+"'>已支付</th>";
                            }

                            var begin = new Date(fare.beginTime);
                            var b = begin.getFullYear()+"-"+(begin.getMonth()+1)+"-"+begin.getDate()+" "+begin.getHours()+":"+begin.getMinutes()+":"+begin.getSeconds();

                            var end = new Date(fare.endTime);
                            var e = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate()+" "+end.getHours()+":"+end.getMinutes()+":"+end.getSeconds();
                            var tr = "<tr id='"+fare.fareId+"'><th>"+fare.licenseNum+"</th><th>"+b+"</th><th>"+e+"</th><th>"+fare.totalTime+"</th><th>"+fare.total+"</th>"+paid+"</tr>";
                            $("#faresTBody").append(tr);
                        }
                    }
                }
            })
        }
    }

    function addFareId(item) {
        var fareId = $(item).parents("tr")[0].id;
        $("h4[title='payModalTitle']").attr("id","payModal_"+fareId);
    }

    function hasPaid() {
        var fareId = $("h4[title='payModalTitle']").attr("id").substring(9);
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/fareController/pay',
            data: {
                "fareId": fareId
            }
        });
        $("#paid_th_"+fareId).empty();
        $("#paid_th_"+fareId).append("已支付");
        $("#payModal").modal("hide");
    }
    
    function showParking() {
        $("#parking_body").empty();
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/parkingController/showParkings',
            dataType:'json',
            success:function (result) {
                var red_icon = "<th><i class=\"fa fa-bus fa-2x\" aria-hidden=\"true\" style='color: red'> </i></th>";
                var grey_icon = "<th><i class=\"fa fa-bus fa-2x\" aria-hidden=\"true\" style='color: grey'> </i></th>";
                var tr0 = "<tr id='parking_0'></tr>";
                var tr1 = "<tr id='parking_1'></tr>";
                var tr2 = "<tr id='parking_2'></tr>";
                var tr3 = "<tr id='parking_3'></tr>";
                var tr4 = "<tr id='parking_4'></tr>";
                var tr5 = "<tr id='parking_5'></tr>";
                var tr6 = "<tr id='parking_6'></tr>";
                var tr7 = "<tr id='parking_7'></tr>";
                var tr8 = "<tr id='parking_8'></tr>";
                var tr9 = "<tr id='parking_9'></tr>";

                $("#parking_body").append(tr0,tr1,tr2,tr3,tr4,tr5,tr6,tr7,tr8,tr9);

                for(var i=0; i < result.length; i++){
                    var parking = result[i];

                    var j = i%10;
                    if (parking.occupied == 1){
                        $("#parking_"+j).append(red_icon);
                    }else {
                        $("#parking_"+j).append(grey_icon);
                    }
                }
            }
        });
    }



</script>
</html>