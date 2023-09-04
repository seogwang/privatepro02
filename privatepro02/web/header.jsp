<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<style>
    #nav-header {
    }
    .nav-item {
        float: right;
    }
    #menu-bar {
        top: 56px;
        z-index: 1500;
        background-color: white;
    }
    #gnb {
        z-index: 2000;
        background-color: white;
    }
    #gnb .nav-link {
        color: darkblue;
        padding-top: 7px;
    }
    #gnb .nav-link:hover {
        color: white;
        background-color: darkblue;
    }
    .fixed-top {
        padding: 5px 20px;
    }
    #gnb .dropdown {
        z-index: 2000;

    }
    .dropdown:hover {
        color: darkblue;
        background-color: white;
        z-index: 2000;
    }
    .dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 0;
        color: darkblue;
        background-color: white;
    }
    #gnb .dropdown-menu {
        min-width: 6rem;
        z-index: 2000;
        background-color: white;
    }
    #gnb .dropdown-menu:hover {
        color: darkblue;
        background-color: white;
    }
    #menu-bar.dropdown-menu {
        width: 20rem;
        margin: 0 3rem;
        text-align: center;
        background-color: white;
    }
    #menu-bar .dropdown-menu:hover {
        color: darkblue;
        background-color: white;
    }
    #menu-bar .nav-link {
        color: darkblue;
        padding-top: 14px;
        font-weight: 700;
    }
    #menu-bar .nav-link:hover {
        color: darkblue;
        padding-top: 14px;
    }
    .navbar-brand {
        color: darkblue;
        font-size: 30px;
        font-weight: 900;
    }
    .navbar-brand:hover {
        color: darkblue;
    }
    .divider {
        margin-top: -2px;
        /* margin-bottom: 1rem; */
        font-size: 23px;
    }
    #menu-bar .dropdown-item {
        text-align: center;
        padding: 8px 12px;
        width: 13rem;
        background-color: white;
    }
    .dropdown-item:hover {
        color: darkblue;
        background-color: white;
        font-weight: 700;
        font-size: 1rem;
    }
    .contents {
        margin-top: 100px;
    }
    .section {
        margin-top: 100px;
    }
    .btn-primary {
        background-color: darkblue;
        border-color: darkblue;
    }
    .btn-primary:hover {
        background-color: darkblue;
        border-color: darkblue;
    }
</style>
<header>
    <!-- Nav Bar 오른쪽 정렬 -->
    <nav class="navbar navbar-expand-sm  fixed-top" id="gnb">
        <div class="container-fluid">
            <a class="navbar-brand" href="${path1 }">SacredGarden</a>
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <c:if test="${empty sid }">
                        <li class="nav-item">
                            <a class="nav-link h-nav" href="${path1 }/CartList.do">장바구니</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link h-nav" href="${path1 }/Login.do">로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link h-nav" href="${path1 }/Term.do">회원가입</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link h-nav" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">고객만족센터</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${path1 }/NoticeList.do">공지사항</a></li>
                                <li><a class="dropdown-item" href="${path1 }/QnaList.do">QNA</a></li>
                                <li><a class="dropdown-item" href="${path1 }/FaqList.do">FAQ</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${sid eq 'admin' }">
                        <%--<li class="nav-item"><a href="${path1 }/Admin.do" class="nav-link">관리자 페이지</a></li>--%>
                        <li class="nav-item dropdown">
                            <a href="${path1 }/Admin.do" class="nav-link">관리자 페이지</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${path1 }/ProList.do">상품목록</a></li>
                                <li><a class="dropdown-item" href="${path1 }/AddProduct.do">상품등록</a></li>
                                <li><a class="dropdown-item" href="${path1 }/AddReceive.do">상품입고</a></li>
                                <li><a class="dropdown-item" href="${path1 }/AdminDeliveryList.do">배송목록</a></li>
                                <li><a class="dropdown-item" href="${path1 }/AdminNoticeList.do">공지사항목록</a></li>
                                <li><a class="dropdown-item" href="${path1 }/AdminEventList.do">이벤트목록</a></li>
                            </ul>
                        </li>

                        <li class="nav-item"><a href="${path1 }/Mypage.do" class="nav-link">마이페이지</a></li>
                        <li class="nav-item"><a href="${path1 }/Logout.do" class="nav-link">로그아웃</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link h-nav" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">고객만족센터</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${path1 }/NoticeList.do">공지사항</a></li>
                                <li><a class="dropdown-item" href="${path1 }/QnaList.do">QNA</a></li>
                                <li><a class="dropdown-item" href="${path1 }/FaqList.do">FAQ</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${!empty sid && sid ne 'admin'}">
                        <li class="nav-item"><a href="${path1 }/CartList.do" class="nav-link">장바구니</a></li>
                        <li class="nav-item"><a href="${path1 }/PaymentList.do" class="nav-link">주문내역</a></li>
                        <li class="nav-item"><a href="${path1 }/Mypage.do" class="nav-link">마이페이지</a></li>
                        <li class="nav-item"><a href="${path1 }/Logout.do" class="nav-link">로그아웃</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                고객만족센터
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${path1 }/NoticeList.do">공지사항</a></li>
                                <li><a class="dropdown-item" href="${path1 }/QnaList.do">QNA</a></li>
                                <li><a class="dropdown-item" href="${path1 }/FaqList.do">FAQ</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
    <nav class="nav nav-pills nav-justified fixed-top" id="menu-bar" >
        <%--        <a class="nav-link active" aria-current="page" href="#">Active</a>--%>
        <li class="nav-item dropdown">
            <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">유ㆍ초등</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${path1 }/CateProList.do?cate=A">유아 동화책</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="${path1 }/CateProList.do?cate=B">초등 교과서</a></li>
                <li><a class="dropdown-item" href="${path1 }/CateProList.do?cate=C">초등 참고서</a></li>
            </ul>
        </li>
        <p class="divider">|</p>
        <li class="nav-item dropdown">
            <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">중등</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${path1 }/CateProList.do?cate=D">중등 교과서</a></li>
                <li><a class="dropdown-item" href="${path1 }/CateProList.do?cate=E">중등 참고서</a></li>
            </ul>
        </li>
        <p class="divider">|</p>
        <li class="nav-item dropdown">
            <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">고등</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${path1 }/CateProList.do?cate=F">고등 교과서</a></li>
                <li><a class="dropdown-item" href="${path1 }/CateProList.do?cate=G">고등 참고서</a></li>
            </ul>
        </li>
        <p class="divider">|</p>
        <li class="nav-item dropdown">
            <a class="nav-link" href="${path1 }/ProList.do" role="button" aria-expanded="false">전체 상품보기</a>
        </li>
        <p class="divider">|</p>
        <li class="nav-item dropdown">
            <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">이벤트</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${path1 }/EventList.do">진행 중인 이벤트</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="${path1 }/WinnerList.do">당첨자 발표</a></li>
            </ul>
        </li>
    </nav>
</header>

