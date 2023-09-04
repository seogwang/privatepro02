<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FAQ</title>
  <c:set var="path" value="<%=request.getContextPath() %>" />
  <%@ include file="../common.jsp"%>
  <style>
    .accordion-item { margin: 10px auto; }
    .accordion {
        /*--bs-accordion-border-color: #1D7151;*/
        --bs-accordion-btn-focus-box-shadow: #1D7151;
    }
    .accordion-button::after {
        display: none;
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
    <h2 class="title">자주하는 질문</h2>
    <p class="msg">${msg }</p>
    <div class="container">
        <div class="accordion">
            <c:forEach var="faq" items="${faqList}" varStatus="status">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#<c:out value='${faq.fno}'/>" aria-expanded="false"
                                style="background-color: #1D7151; color: #ffffff;" >
                            <c:out value="[${status.count}] ${faq.question}"/>
                        </button>
                    </h2>
                    <div id="<c:out value='${faq.fno}'/>" class="accordion-collapse collapse">
                        <div class="accordion-body">
                            <c:out value="${faq.answer}"/>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
  </div>
  <%@ include file="../footer.jsp" %>
</div>
</body>
</html>