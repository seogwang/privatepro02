<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
    <style>
        #tb1 { width:960px; margin:40px auto; }
        #tb1 th { background-color: darkblue; color:#fff; }
        #tb1 td { background-color: #cff4fc }
        .btn-group { float: right; }
        .title { text-align: center; padding-top: 50px; padding-bottom: 100px; background-color: darkblue; color: white;
            border-radius: 25px; margin-top: 10px; margin-bottom: 60px; }
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
                    <li class="breadcrumb-item"><a href="#">Custom</a></li>
                    <li class="breadcrumb-item active" aria-current="page">MyInfo Edit</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">내 정보수정</h2>
        <div class="container">
            <div class="box_wrap">
                <form action="${path }/MyInfoUpdatePro.do" name="frm1" id="frm1" method="post" onsubmit="return updateCheck(this)">
                    <table class="table table-success" id="tb1">
                        <tbody>
                        <tr>
                            <th>아이디</th>
                            <td colspan="2">${cus.id }</td>
                            <input type="hidden" name="id" id="id" value="${cus.id }">
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td>${cus.pw }</td>
                            <td>
                                <input type="password" name="re_pw" id="re_pw" placeholder="비밀번호 변경" class="form-control"
                                       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" />
                                <input type="hidden" name="pw" id="pw" value="${cus.pw }">
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td>${cus.pw }</td>
                            <td>
                                <input type="password" name="re_pw2" id="re_pw2" placeholder="비밀번호 변경 확인" class="form-control"
                                       pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" />
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td colspan="2">${cus.name }</td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td colspan="2">${cus.birth }</td>
                        </tr>
                        <tr>
                            <th>가입일시</th>
                            <td colspan="2">${cus.regdate }</td>
                        </tr>
                        <tr>
                            <th>가입구분</th>
                            <td colspan="2">
                                <c:if test="${cus.job == 0}">
                                    학생
                                </c:if>
                                <c:if test="${cus.job == 1}">
                                    부모님
                                </c:if>
                                <c:if test="${cus.job == 2}">
                                    선생님
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                ${cus.email }
                            </td>
                            <td>
                                <input type="email" name="re_email" id="re_email" placeholder="이메일 변경" class="form-control">
                                <input type="hidden" name="email" id="email" value="${cus.email }">
                            </td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td>${cus.tel }</td>
                            <td>
                                <input type="tel" name="re_tel" id="re_tel" maxlength="11" placeholder="전화번호 변경 숫자만 입력 00000000000" class="form-control">
                                <input type="hidden" name="tel" id="tel" value="${cus.tel }">
                            </td>
                        </tr>
                        <tr>
                            <th>포인트</th>
                            <td colspan="2">${cus.point }</td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>${cus.addr }</td>
                            <td>
                                <button type="button" id="post_btn" onclick="findAddr()" class="btn btn-primary">변경 우편번호 검색</button>
                                <input type="text" name="re_address1" id="re_address1" placeholder="기본 주소 변경" class="form-control" /><br>
                                <input type="text" name="re_address2" id="re_address2" placeholder="상세 주소 변경" class="form-control" /><br>
                                <input type="text" name="re_postcode" id="re_postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호 변경" class="form-control">
                                <input type="hidden" name="addr" id="addr" value="${cus.addr }">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn-group">
                        <input type="submit" name="submit-btn" class="btn btn-outline-primary" value="수정확인">
                        <a href="${path }" class="btn btn-outline-primary">메인으로</a>
                    </div>
                </form>
                <script>
                    function updateCheck(f){
                        if(f.re_pw.value!=f.re_pw2.value){
                            alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                            f.re_pw.focus();
                            return false;
                        }
                    }
                    function findAddr(){
                        new daum.Postcode({
                            oncomplete:function(data){
                                console.log(data);
                                var roadAddr = data.roadAddress;
                                var jibunAddr = data.jibunAddress;
                                document.getElementById("re_postcode").value = data.zonecode;
                                if(roadAddr !== ''){
                                    document.getElementById("re_address1").value = roadAddr;
                                } else if(jibunAddr !== ''){
                                    document.getElementById("re_address1").value = jibunAddr;
                                }
                                document.getElementById("re_address2").focus();
                            }
                        }).open();
                    }
                </script>
                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</body>
</html>
