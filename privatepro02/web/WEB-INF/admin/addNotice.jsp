<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글쓰기</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../../common.jsp"%>
    <style>
        #tb1 { width:960px; margin:40px auto; }
        #tb1 th { background-color: #1D7151;
                color:#fff;
                line-height: 60px;
                text-align: center;
                width: 90px;
        }
        .item1 { width:10%; }
        .item2 { width:70%; }
        .item3 { width:10%; }
        #page-nation1 { width: 960px; margin:20px auto; }
    </style>

    <style>
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

        .msg {
            line-height: 12px;
            text-align: center;
        }

        .title {
            line-height: 55px;
            margin-top: 55px;
            text-align: center;
        }

        .form-control1 {
            width: 865px;
            height: 100px;
        }

        .form-control2 {
            width: 865px;
            height: 323px;
        }


    </style>
</head>


<body>
<div class="container-fluid">
    <%@ include file="../../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <h2 class="title">공지사항 등록</h2>
        <p class="msg">관리자만 이용가능합니다.</p>
        <div class="container">
            <div class="box_wrap">
                <form action="${path }/AddNoticePro.do" method="post">
                    <table class="table" id="tb1">
                        <tbody>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" id="title" class="form-control1">
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content" id="content" class="form-control2">
                                </textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="group container">
                        <input type="submit" value="글 등록" class="btn"/>
                        <a href="${path }/AdminNoticeList.do" class="btn">목록</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>
