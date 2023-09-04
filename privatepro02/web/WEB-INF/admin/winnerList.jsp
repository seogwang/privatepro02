<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>당첨자 발표 목록</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../../common.jsp"%>

    <style>

        .title {
            line-height: 55px;
            margin-top: 135px;
            text-align: center;
        }

        .box_wrap {
            position: relative;
            max-width: 1280px;
            min-height: 450px;
            margin: 50px auto 150px;
        }

        .notice-list th:nth-child(1) {
            width: 12%;
        }

        .box_wrap {
            border-top: 2px solid #666;
        }

        .box_wrap thead th {
            padding: 15px 5px;
            border-bottom: 1px solid #d0cfd5;
            text-align: center;
        }


        .box_wrap tbody td {
            padding: 15px 5px;
            border-bottom: 1px solid #d0cfd5;
            text-align: center;
        }

        .item2 .al{
            text-decoration-line: none;
            color: black;
            display: block;
            text-overflow: ellipsis;
            max-height: 2.8em;
            line-height: 1.4em;
            word-wrap: break-word;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            word-break: keep-all;
        }

        .paginate {
            list-style-type: none;
            width: 100%;
            margin-top: 40px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .paginate .page-item {
            margin: 0 5px;
        }

        .paginate .page-link {
            display: inline-block;
            width: 34px;
            height: 34px;
            border: 1px solid #ddd;
            background-color: #f8f9fa;
            color: #333;
            font-size: 14px;
            line-height: 32px;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }

        .paginate .page-link:hover {
            background-color: #333;
            color: #fff;
            cursor: pointer;
        }

        .item1, .item2, .item3 {
            font-size: 18px;
        }

        .msg {
            line-height: 12px;
            text-align: center;
        }

        .btn {
            border-radius: 20px;
            margin: 30px;
            padding: 10px;
            float: right;
            background-color: #1D7151;
            border-color: #1D7151;
            color: #ffffff;
        }


        #tb1 { width:960px; margin:40px auto; }
        #tb1 th { background-color: #1D7151; color:#fff; }
        .item1 { width:10%; }
        .item2 { width:70%; }
        .item3 { width:10%; }
        #page-nation1 { width: 960px; margin:20px auto; }
    </style>

</head>
<body>
<div class="container-fluid">
    <%@ include file="../../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <h2 class="title">당첨자 발표</h2>
        <p class="msg">관리자만 이용가능합니다.</p>
        <div class="container">
            <div class="box_wrap">
                <table class="table" id="tb1">
                    <thead>
                    <tr>
                        <th class="item1">번호</th>
                        <th class="item2">제목</th>
                        <th class="item3">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="winner" items="${winnerList }" varStatus="status">
                        <tr>
                            <td class="item1">${status.count }</td>
                            <td class="item2">
                                <a href="${path }/AdminWinner.do?no=${winner.no }" class="al">${winner.title }</a>
                            </td>
                            <td class="item3">${winner.resdate }</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="group container">
                    <a href="${path }/AddWinner.do" class="btn">글 등록</a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>