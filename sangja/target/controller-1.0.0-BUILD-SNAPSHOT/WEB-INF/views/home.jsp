<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>
<jsp:forward page="/today-visit"></jsp:forward>
	<P>The time on the server is ${serverTime}.</P>
	<P>The timeCST on the server is ${serverTimeCST}.</P>
	<P>Welcome ${sess_user.user_nm_f} ${sess_user.user_nm_l} </P>
	<p>
		<a href="/signout">로그아웃</a>
	</p>
	<p>
		<a href="user-list">상자 - 사용자 목록</a>
	</p>
	<p>
		<a href="/board/list">게시물 목록</a>
	</p>
	<p>
		<a href="/board/write">게시물 작성</a>
	</p>
	
	<p>
		<a  onclick="appLaunch('intent://printconnect/#Intent;scheme=db-50njtvheh9h0o56;package=com.zebra.printconnect;S.TEMPLATE_FILE_NAME=myTicket.prn;S.VARIABLE_DATA=%ticketNumber%=1234567;end');">인쇄</a>
	</p>

	Context : <%= request.getContextPath() %>

URL : <%= request.getRequestURL() %>

URI : <%= request.getRequestURI() %>

Path : <%= request.getServletPath() %>

<script>
            function isAndroid(){
                var bExist = (/android/i.test(navigator.userAgent.toLowerCase()));	 
                if (bExist) {
                    return true;
                } else {
                    return false;
                }
            }

            function appLaunch(app_url){
                if(isAndroid()){
                    location.href = app_url;
                }
            }
        </script>
</body>
</html>
