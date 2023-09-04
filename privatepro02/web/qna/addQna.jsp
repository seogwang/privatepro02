<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QNA 글등록</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
    <style>
    #tb1 { width:960px; margin:40px auto; }
    #tb1 th { background-color: darkblue; color:#fff; }
    .item1 { width:10%; }
    .item2 { width:70%; }
    .item3 { width:10%; }
    .item4 { width:10%; }
    #page-nation1 { width: 960px; margin:20px auto; }
    #tb1 td {
        background-color: #d1e7dd;
    }
    .group.container {
        padding: 10px 170px;
    }
    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">QNA</a></li>
                    <li class="breadcrumb-item active" aria-current="page">QNA 상세보기</li>
                </ol>
            </div>
        </nav>
        <c:if test="${lev == 0}">
            <h2 class="title">QNA 글 등록</h2>
        </c:if>
        <c:if test="${lev == 1}">
            <h2 class="title">답변 글 등록</h2>
        </c:if>
        <div class="container">
            <div class="box_wrap">
                <form action="${path }/AddQnaPro.do" method="post">
                    <table class="table table-secondary" id="tb1">
                        <tbody>
                        <tr>
                            <c:if test="${lev == 0}">
                                <th>QNA 제목</th>
                            </c:if>
                            <c:if test="${lev == 1}">
                                <th>답변 제목</th>
                            </c:if>
                            <td><input type="text" name="title" id="title" class="form-control">
                                <input type="hidden" name="lev" id="lev" value="${lev }">
                                <input type="hidden" name="par" id="par" value="${par }">
                                <input type="hidden" name="author" id="author" value="${sid }"></td>
                        </tr>
                        <tr>
                            <c:if test="${lev == 0}">
                                <th>QNA 내용</th>
                            </c:if>
                            <c:if test="${lev == 1}">
                                <th>답변 내용</th>
                            </c:if>
                            <td><textarea name="content" id="content" class="form-control"></textarea></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="group container">
                        <c:if test="${lev == 0}">
                            <input type="submit" value="QNA 등록" class="btn btn-primary"/>
                        </c:if>
                        <c:if test="${lev == 1}">
                            <input type="submit" value="답변 등록" class="btn btn-primary"/>
                        </c:if>
                        <a href="${path }/QnaList.do" class="btn btn-primary">QNA 목록</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
