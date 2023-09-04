<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
</head>
<style>
    .divider:after,
    .divider:before {
        content: "";
        flex: 1;
        height: 1px;
        background: #eee;
    }
    .h-custom {
        height: calc(100% - 73px);
    }
    @media (max-width: 450px) {
        .h-custom {
            height: 100%;
        }
    }

    .btn {
        color: white;
        background-color: darkblue;
        border-color: darkblue;
    }

    .small {
        font-size: 16px;
    }

    .img-fluid {
        border-radius: 100px;
        overflow: hidden;
    }


    .img {
        height: 175px;
        width: 500px;
    }

</style>
<body>
<section class="vh-100">
    <div class="container-fluid h-custom">
        <jsp:include page="../header.jsp" />
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                <form action="${path }/LoginPro.do">
                    <div class="divider d-flex align-items-center my-4">
                        <p class="text-center fw-bold mx-3 mb-0"></p>
                    </div>

                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <input type="text" id="id" name="id" class="form-control form-control-lg"
                               placeholder="아이디를 입력해주세요." />
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-3">
                        <input type="password" id="pw" name="pw" class="form-control form-control-lg"
                               placeholder="비밀번호를 입력해주세요." />
                    </div>
                    <div class="text-center text-lg-start mt-4 pt-2">
                        <button type="submit" class="btn btn-primary">로그인하기</button>
                        <p class="small fw-bold mt-2 pt-1 mb-0">계정이 없으신가요? <a href="${path }/Term.do" class="link-danger">회원가입</a></p>
                    </div>

                </form>
            </div>
        </div>
    </div>
</section>
<%@ include file="../footer.jsp" %>
</body>
</html>
