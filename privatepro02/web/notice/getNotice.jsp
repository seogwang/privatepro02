<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세보기</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
</head>

<style>
    .th {
        text-align: center;
    }
</style>

<body>
<div>
    <div class="container-fluid" style="min-height:100vh;">
        <%@ include file="../header.jsp"%>
        <div class="contents">
            <h2 class="title"></h2>
            <div class="container">
                <div class="box_wrap">
                    <table class="table" id="tb1">
                        <tbody>
                        <tr>
                            <th class="th">번호</th>
                            <td>${noti.no }</td>
                        </tr>
                        <tr>
                            <th class="th">제목</th>
                            <td>${noti.title }</td>
                        </tr>
                        <tr>
                            <th class="th">내용</th>
                            <td>${noti.content }</td>
                        </tr>
                        <tr>
                            <th class="th">등록일</th>
                            <td>${noti.resdate }</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="btn-group" style="float: right">
                    <a href="${path }/NoticeList.do" class="btn">목록으로</a>
                </div>
            </div>
        </div>
        <%@ include file="../footer.jsp" %>
    </div>
</div>
</body>
</html>
