<%@ page import="edu.sacredgarden.model.ProductDAO" %>
<%@ page import="edu.sacredgarden.dto.Product" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    ProductDAO dao = new ProductDAO();
    Product bestPro = dao.getBestProduct();
    request.setAttribute("bestPro",bestPro);

    Product newPro = dao.getNewProduct();
    request.setAttribute("newPro",newPro);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>신의정원</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <script src="js/jquery-1.10.0.js"></script>
    <link rel="stylesheet" href="vdo.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <style>
        .contents {
            min-height: 100vh;
            padding-top: 100px;
        }
        .book-section {
            clear: both;
            min-width: 1200px;
            min-height: 500px;
            text-align: center;
        }
        .book {
            max-height: 300px;
            max-width: 230px;
        }
        .img {
            padding: 20px 100px 0px 100px;
            top: 20px;
        }
        .book-section section {
            display: inline-flex;
            flex-direction: column;
            height: 400px;
        }
        .book-section span {
            font-size:26px; text-align: center;  color: #000000; font-weight: 900;
        }
        .book-section span:nth-child(3) {
            font-size:26px; text-align: center;  color: darkblue; font-weight: 900;
        }
        .book-section p {
            font-size:26px; text-align: center;  color: #000000; font-weight: 900;
        }
        .book-section p:first-child {
            font-size:26px; text-align: center;  color: darkblue; font-weight: 900;
        }
    </style>
</head>
<body>
<%@ include file="/header.jsp"%>
<div class="container-fluid">
    <div class="contents">
        <div class="book-section">
            <p>BEST BOOK</p>
            <p>Best Book 강좌</p>
            <section class="img"><img src="${path }/storage/${bestPro.imgSrc1 }" alt="베스트셀러" class="book"></section>
            <section class="player">
                <div class="vdo_fr">
                    <video id="video">
                        <source src="${path }/images/mv2.mp4" type="video/mp4" />
                        <source src="${path }/images/mv2.ogv" type="video/ogg" />
                        <source src="${path }/images/mv2.webm" type="video/webm" />
                    </video>
                </div>
                <div id="timebar">
                    <span id="currentTime"></span>
                </div>
                <div id="buttonbar">
                    <button id="restart" class="player_btn"></button>
                    <button id="rew" class="player_btn"></button>
                    <button id="play" class="player_btn"></button>
                    <button id="pause" class="player_btn"></button>
                    <button id="stop" class="player_btn"></button>
                    <button id="fastFwd" class="player_btn"></button>
                    <button id="mute" class="player_btn"></button>
                    <button id="unmute" class="player_btn"></button>
                    <input id="vol" type="range" value="500" min="0" max="1000">
                    <button id="vmup" class="player_btn"></button>
                    <button id="vmdown" class="player_btn"></button>
                    <button id="volTxt">100%</button>
                    <button id="sizeup" class="player_btn"></button>
                    <button id="sizedown" class="player_btn"></button>
                    <button id="full" class="player_btn"></button>
                    <button id="original" class="player_btn"></button>
                </div>
                <div id="progress">
                    <div id="progressBar"></div>
                </div>
            </section>
            <script src="js/vdo.js"></script>
        </div>
        <div class="book-section">
            <p><br><br><br><br><br>NEW BOOK</p>
            <p>New book 강좌</p>
            <section class="img"><img src="${path }/storage/${newPro.imgSrc1 }" alt="뉴북" class="book" ></section>
            <section class="player2">
                <div class="vdo_fr2">
                    <video id="video2">
                        <source src="${path }/images/mv1.mp4" type="video/mp4" />
                        <source src="${path }/images/mv1.ogv" type="video/ogg" />
                        <source src="${path }/images/mv1.webm" type="video/webm" />
                    </video>
                </div>
                <div id="timebar2">
                    <span id="currentTime2"></span>
                </div>
                <div id="buttonbar2">
                    <button id="restart2" class="player_btn2"></button>
                    <button id="rew2" class="player_btn2"></button>
                    <button id="play2" class="player_btn2"></button>
                    <button id="pause2" class="player_btn2"></button>
                    <button id="stop2" class="player_btn2"></button>
                    <button id="fastFwd2" class="player_btn2"></button>
                    <button id="mute2" class="player_btn2"></button>
                    <button id="unmute2" class="player_btn2"></button>
                    <input id="vol2" type="range" value="500" min="0" max="1000">
                    <button id="vmup2" class="player_btn2"></button>
                    <button id="vmdown2" class="player_btn2"></button>
                    <button id="volTxt2">100%</button>
                    <button id="sizeup2" class="player_btn2"></button>
                    <button id="sizedown2" class="player_btn2"></button>
                    <button id="full2" class="player_btn2"></button>
                    <button id="original2" class="player_btn2"></button>
                </div>
                <div id="progress2">
                    <div id="progressBar2"></div>
                </div>
            </section>
            <script src="js/vdo2.js"></script>
        </div>
    </div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>
