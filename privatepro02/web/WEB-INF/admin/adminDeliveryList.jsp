<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송 관리 리스트</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../../common.jsp"%>
    <style>
        #tb1 { width:960px; margin:40px auto; }
        #tb1 th { background-color: darkblue; color:#fff; }
        .item1 { width:10%; }
        .item2 { width:15%; }
        .item3 { width:30%; }
        .item4 { width:30%; }
        .item5 { width:15%; }
        #page-nation1 { width: 960px; margin:20px auto; }
        .btn btn-primary {
            background-color: darkblue;
            border-color: darkblue;
        }
        #tb1 td {
            background-color: #d1e7dd;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <%@ include file="../../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="${path }/Admin.do">관리자페이지</a></li>
                    <li class="breadcrumb-item active" aria-current="page">배송 관리 리스트</li>
                </ol>
            </div>
        </nav>
        <div class="container-fluid">
            <h2 class="title">배송 관리 리스트</h2>
            <article class="col-9">
<%--                <form name="frm1" id="frm1" action="${path }/AddProductPro.do" method="post" enctype="multipart/form-data">--%>
<%--                    <table class="table">--%>
<%--                        <tbody>--%>
<%--                        <tr>--%>
<%--                            <th>카테고리</th>--%>
<%--                            <td>--%>
<%--                                <div class="form-row">--%>
<%--                                    <select name="cate" id="cate" class="form-control">--%>
<%--                                        <option value="A">선택안함</option>--%>
<%--                                        <c:forEach var="cate" items="${cateList }" varStatus="status">--%>
<%--                                            <option value="${cate.cno }">${cate.cname }</option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th><label for="pname">상품명</label></th>--%>
<%--                            <td>--%>
<%--                                <input type="text" name="pname" id="pname" placeholder="상품명 입력" class="form-control" maxlength="90" required />--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th><label for="pcomment">상품설명</label></th>--%>
<%--                            <td><textarea rows="10" cols="100" name="pcomment" id="pcomment" placeholder="상품의 자세한 정보를 입력하세요" class="form-control" maxlength="1990" required></textarea></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th><label for="plist">상품목차</label></th>--%>
<%--                            <td><textarea rows="10" cols="100" name="plist" id="plist" placeholder="도서 상품의 목차를 입력하세요" class="form-control" maxlength="1990" required></textarea></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th><label for="price">가격</label></th>--%>
<%--                            <td><input type="number" name="price" id="price" placeholder="상품 가격 입력" class="form-control" value="1000" min="1000" step="100" required></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th><label for="imgsrc1">상품 이미지(메인 이미지)</label></th>--%>
<%--                            <td><input type="file" name="imgsrc1" id="imgsrc1" placeholder="상품 메인이미지" class="form-control" required></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th><label for="imgsrc2">상품 이미지(서브 이미지)</label></th>--%>
<%--                            <td><input type="file" name="imgsrc2" id="imgsrc2" placeholder="상품 서브이미지" class="form-control" required></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th><label for="imgsrc3">상품 이미지(서브 이미지2)</label></th>--%>
<%--                            <td><input type="file" name="imgsrc3" id="imgsrc3" placeholder="상품 서브이미지2" class="form-control" required></td>--%>
<%--                        </tr>--%>
<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                    <div class="btn-group">--%>
<%--                        <input type="submit" name="submit-btn" class="btn btn-primary" value="상품등록">--%>
<%--                        <input type="reset" name="reset-btn" class="btn btn-primary" value="취소">--%>
<%--                        <a href="${path }/ProList.do" class="btn btn-primary">상품목록</a>--%>
<%--                    </div>--%>
<%--                </form>--%>
            </article>
            <div class="container">
                <div class="box_wrap">
                    <table class="table table-secondary" id="tb1">
                        <thead>
                        <tr>
                            <th class="item1">배송 번호</th>
                            <th class="item2">구매자</th>
                            <th class="item3">주문일</th>
                            <th class="item4">연락처</th>
                            <th class="item5">배송 관리</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="del" items="${deliveryList }" varStatus="status">
                            <tr>
                                    <td class="item1">${del.dno }</td>
                                    <td class="item2">${del.cid }</td>
                                    <td class="item3">${del.sdate }</td>
                                    <td class="item4">${del.custel }</td>
                                    <td class="item5">
                                        <a href="${path }/AdminGetDelivery.do?dno=${del.dno }" class="btn btn-primary">배송 관리</a>
                                    </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty deliveryList}">
                            <tr>
                                <td colspan="4">배송 관리 내역이 존재하지 않습니다.</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../../footer.jsp" %>
</div>
</body>
</html>