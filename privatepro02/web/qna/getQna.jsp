<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QNA 상세보기</title>
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
    .btn-group {
        margin: 0px 166px;
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
                    <li class="breadcrumb-item active" aria-current="page">Detail</li>
                </ol>
            </div>
        </nav>
        <c:if test="${lev == 0}">
            <h2 class="title">QNA 상세보기</h2>
        </c:if>
        <c:if test="${lev == 1}">
            <h2 class="title">답변 상세보기</h2>
        </c:if>
        <div class="container">
            <div class="box_wrap">
                <table class="table table-secondary" id="tb1">
                    <tbody>
                    <tr>
                        <th>글 번호</th>
                        <td>${qna.qno }</td>
                    </tr>
                    <tr>
                        <th>글 제목</th>
                        <td>${qna.title }</td>
                    </tr>
                    <tr>
                        <th>글 내용</th>
                        <td>${qna.content }</td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>${qna.author }</td>
                    </tr>
                    <tr>
                        <th>작성일시</th>
                        <td>${qna.resdate }</td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn-group">
                    <a href="${path }/QnaList.do" class="btn btn-primary" style="background-color: darkblue">QNA 목록</a>
                    <c:if test="${!empty sid && lev == 0}">
                        <a href="${path }/AddQna.do?lev=1&par=${qna.qno }" class="btn btn-primary" style="background-color: darkblue">답변 등록</a>
                    </c:if>
                    <c:if test="${!empty sid}">
                        <a href="${path }/UpdateQna.do?lev=${qna.lev }&qno=${qna.qno }" class="btn btn-primary" style="background-color: darkblue">수정</a>
                        <a href="${path }/DelQna.do?lev=${qna.lev }&qno=${qna.qno }" class="btn btn-primary" style="background-color: darkblue">삭제</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>

</body>
</html>
