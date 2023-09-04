<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../../common.jsp"%>
    <style>
        #tb1 { width:960px; margin:40px auto; }
        #tb1 th {
            width: 70px;
            color: black;
        }

        .th {
            text-align: center;
        }

        .btn {
            text-decoration: none;
            border-radius: 20px;
            margin: 15px;
            padding: 10px;
            float: right;
            background-color: #1D7151;
            border-color: #1D7151;
            color: #ffffff;
        }

        .title {
            line-height: 55px;
            margin-top: 55px;
            text-align: center;
        }

    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="../../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <h2 class="title"></h2>
        <div class="container">
            <div class="box_wrap">
                <table class="table" id="tb1">
                    <tbody>
                    <tr>
                        <th class="th">번호</th>
                        <td>${event.no }</td>
                    </tr>
                    <tr>
                        <th class="th"></th>
                        <td><img src=${path }/storage/${event.img}" alt="이벤트 이미지"></td>
                    </tr>
                    <tr>
                        <th class="th">제목</th>
                        <td>${event.title }</td>
                    </tr>
                    <tr>
                        <th class="th">내용</th>
                        <td>${event.content }</td>
                    </tr>
                    <tr>
                        <th class="th">등록일</th>
                        <td>${event.resdate }</td>
                    </tr>
                    </tbody>
                </table>

                <div class="group container">
                    <a href="${path }/AdminEventList.do" class="btn">목록</a>
                    <a href="${path }/UpdateEvent.do?no=${event.no }" class="btn">수정</a>
                    <a href="${path }/DeleteEvent.do?no=${event.no }" class="btn">삭제</a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>

</html>
