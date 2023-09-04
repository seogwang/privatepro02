<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QNA</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
    <style>
    #tb1 { width:960px; margin:40px auto; }
    #tb1 th { background-color: darkblue; color:#fff; }
    .item1 { width:10%; }
    .item2 { width:55%; }
    .item3 { width:10%; }
    .item4 { width:25%; }
    #page-nation1 { width: 960px; margin:20px auto; }
    #tb1 td {
        background-color: #ffffff;
    }
    td a {
        text-decoration-line: none;
    }
    .input-group {
        margin: 95px 95px 0px 95px;
    }

    </style>
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
        .btn-primary {
            margin: 0px 159px;
        }
    </style>
    <style>
        .title {
            margin-top: 55px;
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
                    <li class="breadcrumb-item active" aria-current="page">List</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">QNA 목록</h2>
        <div class="container">
            <div class="box_wrap">
                <div class="form-wrap">
                    <form action="${path }/KwdQnaList.do" method="post">
                        <fieldset class="input-group">
                            <select name="searchType" id="searchType" class="form-select" style="max-width:200px;">
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                                <option value="all">제목+내용</option>
                            </select>
                            <span style="display: inline-block; width:8px;"></span>
                            <input type="text" name="kwd" id="kwd" class="form-control" placeholder="검색어 입력" required>
                            <input type="submit" value="검색" class="btn btn-primary" style="background-color: darkblue">
                        </fieldset>
                    </form>
                </div>
                <table class="notice-list" id="tb1">
                    <thead>
                    <tr>
                        <th class="item1">번호</th>
                        <th class="item2">제목</th>
                        <th class="item3">작성자</th>
                        <th class="item4">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="qna" items="${qnaList }" varStatus="status">
                        <c:set var="num" value="${num+1 }" />
                    <tr>
                        <td class="item1">${num }</td>
                        <td class="item2">
                            <c:if test="${qna.lev == 0}">
                                <a href="${path }/Qna.do?qno=${qna.qno }&lev=${qna.lev }" class="al">${qna.title }</a>
                            </c:if>
                            <c:if test="${qna.lev == 1}">
                                <a href="${path }/Qna.do?qno=${qna.qno }&lev=${qna.lev }" class="al">
                                    <img src="${path }/images/icon_reply.png" alt="[답변]">${qna.title }
                                </a>
                            </c:if>
                        </td>
                        <td class="item3">${qna.author }</td>
                        <td class="item4">
                            <fmt:parseDate value="${qna.resdate }}" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate}" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <nav aria-label="Page navigation example" id="page-nation1">
                    <c:if test="${empty kwd }">
                    <ul class="pagination">
                        <c:if test="${ curPageNum > 5 }">
                            <li lass="page-item"><a href="${path }/QnaList.do?page=${ blockStartNum - 1 }" class="page-link">◀</a></li>
                        </c:if>
                        <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
                            <c:choose>
                                <c:when test="${ i == curPageNum }">
                                    <li class="page-item" style="width:35px;height:38px;line-height:38px;text-align:center;"><strong>${ i }</strong></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a href="${path }/QnaList.do?page=${ i }" class="page-link">${ i }</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${ blockLastNum < totalPageCount }">
                            <li class="page-item"><a href="${path }/QnaList.do?page=${ blockLastNum + 1 }" class="page-link">▶</a></li>
                        </c:if>
                    </ul>
                    </c:if>
                    <c:if test="${!empty kwd }">
                        <ul class="pagination">
                            <c:if test="${ curPageNum > 5 }">
                                <li lass="page-item"><a href="${path }/KwdQnaList.do?page=${ blockStartNum - 1 }&{kwd }&searchType=${searchType}" class="page-link">◀</a></li>
                            </c:if>
                            <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
                                <c:choose>
                                    <c:when test="${ i == curPageNum }">
                                        <li class="page-item" style="width:35px;height:38px;line-height:38px;text-align:center;"><strong>${ i }</strong></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a href="${path }/KwdQnaList.do?page=${ i }&kwd=${kwd }&searchType=${searchType}" class="page-link">${ i }</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${ blockLastNum < totalPageCount }">
                                <li class="page-item"><a href="${path }/KwdQnaList.do?page=${ blockLastNum + 1 }&kwd=${kwd }&searchType=${searchType}" class="page-link">▶</a></li>
                            </c:if>
                        </ul>
                    </c:if>
                </nav>
                <hr>
                <c:if test="${!empty sid}">
                <div class="container">
                    <a href="${path }/AddQna.do?lev=0&par=0" class="btn btn-primary" style="background-color: darkblue">QNA 등록</a>
                </div>
                </c:if>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
