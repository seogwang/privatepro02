/* 버튼 선택자 */
var video2 = document.getElementById("video2");
var restart2 = document.getElementById("restart2");
var play2 = document.getElementById("play2");
var pause2 = document.getElementById("pause2");
var stop2 = document.getElementById("stop2");
var currentTime2 = document.getElementById("currentTime2");
var rew2 = document.getElementById("rew2");
var fastFwd2 = document.getElementById("fastFwd2");
var mute2 = document.getElementById("mute2");
var unmute2 = document.getElementById("unmute2");
var vol2 = document.getElementById("vol2");
var vmup2 = document.getElementById("vmup2");
var vmdown2 = document.getElementById("vmdown2");
var full2 = document.getElementById("full2");
var sizeup2 = document.getElementById("sizeup2");
var sizedown2 = document.getElementById("sizedown2");
var progress2 = document.getElementById("progress2");
var progressBar2 = document.getElementById("progressBar2");
var volTxt2 = document.getElementById("volTxt2");
video2.load();  //비디오 로딩
video2.setAttribute("loop", "5"); //비디오 반복 횟수 지정
video2.volume = 1;   //비디오의 볼륨값 초기화

/* 동영상 재생 제어 처리부 */
//재시작
restart2.addEventListener("click", function () { restartPlay2(); });
//10초 뒤로 가기
rew2.addEventListener("click", function () { skip2(-10); });
//10초 앞으로 가기
fastFwd2.addEventListener("click", function () { skip2(10); });
//재생 함수 호출
play2.addEventListener("click", function () { playPause2(); });
//일시정지 함수 호출
pause2.addEventListener("click", function () { playPause2(); });
//정지 함수 호출
stop2.addEventListener("click", function () { stopPlayer2(); });
//음소거 함수 호출
mute2.addEventListener("click", function () { mutePlayer2("mute"); });
//음삽입 함수 호출
unmute2.addEventListener("click", function () { mutePlayer2("unmute"); });
//볼륨 조절바 기능 정의 및 호출
vol2.addEventListener("change", function () {
    video2.volume = this.value / 1000;
    volTxt2.innerText = parseInt(video2.volume * 100) + "%";
});
vmup2.addEventListener("click", function () { volumeUpDown2("up"); });//볼륨업
vmdown2.addEventListener("click", function () { volumeUpDown2("down"); });//볼륨다운
full2.addEventListener("click", function () { fullScreen2(); });//풀스크린
var w = 640;
video2.width = w;
sizeup2.addEventListener("click", function () { video2.width += 200; }); //사이즈업
sizedown2.addEventListener("click", function () { video2.width -= 200; }); //사이즈 다운

//처음부터 다시 재생
function restartPlay2() { video2.currentTime = 0;  video2.play();}
//앞으로, 뒤로 가기 함수
function skip2(value) { video2.currentTime += value; }
//재생일시정지 함수
function playPause2() {
    if (video2.paused) {
        video2.play(); play2.style.display = "none"; pause2.style.display = "inline-block";
    } else {
        video2.pause(); play2.style.display = "inline-block"; pause2.style.display = "none";
    }
}
//정지함수
function stopPlayer2() { video2.pause(); video2.currentTime = 0; }
/* 음량 제어 처리부 */
function mutePlayer2(state) { //음소거토글함수
    if (state == "mute") {
        video2.volume = 0; mute2.style.display = "none";
        unmute2.style.display = "inline-block"; volTxt2.innerText = "0%";
    } else if (state == "unmute") {
        video2.volume = 1; mute2.style.display = "inline-block";
        unmute2.style.display = "none"; volTxt2.innerText = "100%";
    }
}
function volumeUpDown2(dir) { //볼륨updown
    if (dir == "up") {
        if (video2.volume == 1) { return false; }
        var change = video2.volume + 0.1; change = change.toFixed(1);
        video2.volume = parseFloat(change);
    } else if (dir == "down") {
        if (video2.volume == 0) {
            mute2.style.display = "none";
            unmute2.style.display = "inline-block"; return false;
        }
        var change = video2.volume - 0.1; change = change.toFixed(1);
        video2.volume = parseFloat(change);
    }
    volTxt2.innerText = parseInt(video2.volume * 100) + "%";
}

//동영상 크기제어 처리부
function fullScreen2() { //전체화면 만들기
    if (video2.requestFullscreen) { video2.requestFullscreen(); }
    else if (video2.mozRequestFullScreen) { video2.mozRequestFullScreen(); }
    else if (video2.webkitRequestFullscreen) { video2.webkitRequestFullscreen(); }
    else if (video2.msRequestFullscreen) { video2.msRequestFullscreen(); }
}

//재생시간 표시 처리부
playTime2();  //재생시간 표시 함수
progressPlayer2();  //프로그레스바 늘리기 함수
var current2, currentmin2, currentsec2, currentTotal2;
function playTime2() {
    video2.addEventListener("timeupdate", function () {          //현재재생시간
        if (video2.duration == video2.currentTime) {
            play2.style.display = "inline-block"; pause2.style.display = "none";
        }
        current2 = video2.currentTime;
        currentmin2 = Math.floor(current2 / 60);
        currentsec2 = Math.floor(current2 - (currentmin2 * 60));
        if (currentmin2 < 10) { currentmin2 = "0" + currentmin2; }
        if (currentsec2 < 10) { currentsec2 = "0" + currentsec2; }
        currentTotal2 = currentmin2 + ":" + currentsec2;
        currentTime2.innerHTML = currentTotal2;
    });
}
//프로그레스바
function progressPlayer2() {
    video2.addEventListener("timeupdate", function () {
        var max = Math.floor(video2.duration);
        var current = Math.floor(video2.currentTime);
        var percent = 100 * (current / max);
        progressBar2.style.width = percent + "%";
    });
}

//프로그레스바 seek
function seek2(event) {
    var seekTotal = parseInt(progress2.style.width);
    var seekX = event.offsetX;
    var seekPercent = 100 * (seekX / seekTotal);
    progressBar2.style.width = seekPercent + "%";
    var seekMove = (seekPercent / 100) * Math.floor(video2.duration);
    video2.currentTime = seekMove;
}
/* 파이어폭스 이벤트 크로스브라우징코드 */
if (navigator.userAgent.indexOf("Firefox") >= 0) {
    var eventNames = ["mousedown", "mouseover", "mouseout", "mousemove", "mousedrag", "click", "dbclick", "keydown", "keypress", "keyup"];
    for (var i = 0; i < eventNames.length; i++) {
        window.addEventListener(eventNames[i], function (e) {
            window.event = e;
        }, true);
    }
}
progress2.addEventListener("click", function (event) {
    seek2(event);
});//seek