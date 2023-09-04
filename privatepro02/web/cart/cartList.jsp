<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니 목록</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
    <style>
        #tb1 { width:960px; margin:40px auto; }
        #tb1 th { background-color: darkblue; color:#fff; }
        .item1 { width:10%; }
        .item2 { width:60%; }
        .item3 { width:10%; }
        .item4 { width:20%; }
        #page-nation1 { width: 960px; margin:20px auto; }

        #tb1 td {
            background-color: #d1e7dd;
        }
        .btn-primary {
            width: 100px;
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
                    <li class="breadcrumb-item"><a href="#">Cart</a></li>
                    <li class="breadcrumb-item active" aria-current="page">List</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">장바구니 목록</h2>
        <p class="msg">${msg }</p>
        <div class="container">
            <div class="box_wrap">
                <form action="${path }/DelCart.do" method="post">
                    <table class="table table-secondary" id="tb1">
                        <thead>
                        <tr>
                            <th class="item1">번호</th>
                            <th class="item2">상품명</th>
                            <th class="item3">수량</th>
                            <th class="item4">구매</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cart" items="${cartList }" varStatus="status">
                            <tr>
                                <td class="item1">
                                    <input type="checkbox" name="cartno" id="cartno+${status.count}" value="${cart.cartno }">
                                    ${status.count }
                                </td>
                                <td class="item2">
                                    <span title="${cart.pno}">${cart.pname }</span>
                                </td>
                                <td class="item3">
                                    ${cart.amount }
                                </td>
                                <td class="item4">
                                    <a href="${path }/AddPayment.do?pno=${cart.pno }&from=cart" class="btn btn-primary">구매하기</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty cartList}">
                            <tr>
                                <td colspan="3">장바구니 목록이 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                    <c:if test="${!empty cartList}">
                    <div class="container">
                        <input type="submit" value="선택삭제" class="btn btn-primary">
                    </div>
                    </c:if>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>