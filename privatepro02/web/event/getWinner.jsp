<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
</head>
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
                            <th>글 번호</th>
                            <td>${winner.no }</td>
                        </tr>
                        <tr>
                            <th>글 제목</th>
                            <td>${winner.title }</td>
                        </tr>
                        <tr>
                            <th>글 내용</th>
                            <td>${winner.content }</td>
                        </tr>
                        <tr>
                            <th>등록일</th>
                            <td>${winner.resdate }</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="btn-group" style="float: right">
                    <a href="${path }/WinnerList.do" class="btn">목록으로</a>
                </div>
            </div>
        </div>
        <%@ include file="../footer.jsp" %>
    </div>
</div>
</body>
</html>
