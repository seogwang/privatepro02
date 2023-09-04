<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <script src="./js/jquery-1.10.0.js"></script>
    <link rel="stylesheet" href="./vdo.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <style>

        .btn {
            line-height: 27px;
            padding: 30px;
            width: 126px;
            height: 120px;
            text-decoration: none;
            border-radius: 20px;
            margin: 15px;
            color: #ffffff;
        }

        .box_wrap {
            margin-right: -70px;
        }


        #tb1 { width:960px; margin:40px auto; }
        .title { text-align: center; padding-top: 50px; padding-bottom: 20px; border-radius: 25px; margin-top: 10px; margin-bottom: 60px; }


    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="../../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <h2 class="title">관리자 페이지</h2>
        <div class="container">
            <div class="box_wrap">
                <table class="table" id="tb1">
                    <tbody>
                    <tr>
                        <td><a href="${path }/ProList.do" class="btn" style="background: #1D7151">상품<br>목록</a></td>

                        <td><a href="${path }/AddProduct.do" class="btn" style="background:  #2E8B57">상품<br>등록</a></td>

                        <td><a href="${path }/AddReceive.do" class="btn" style="background: #3F9D61">상품<br>입고</a></td>

                        <td><a href="${path }/AdminDeliveryList.do" class="btn" style="background: #50AF6B">배송<br>목록</a></td>
                    </tr>
                    <tr>
                        <td><a href="${path }/AdminNoticeList.do" class="btn" style="background:#50AF6B">공지사항<br>목록</a></td>

                        <td><a href="${path }/AdminEventList.do" class="btn" style="background: #3F9D61">이벤트<br>목록</a></td>

                        <td><a href="${path }/AdminWinnerList.do" class="btn" style="background:  #2E8B57">당첨자<br>목록</a></td>

                        <td><a href="${path }" class="btn" style="background: #1D7151">메인<br>으로</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>