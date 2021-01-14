<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="notice.NoticeDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
     <jsp:useBean id="notice" class="notice.NoticeBeans" scope="page"/>
     <jsp:setProperty name="notice" property="title"/>
     <jsp:setProperty name="notice" property="content"/>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID =(String)session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		
	}else{	if(notice.getTitle()==null||notice.getContent()==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('값을 입력해주세요.')");
		script.println("history.back()");
		script.println("</script>");
		
	}else{
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = noticeDAO.write(notice.getTitle(),userID,notice.getContent());
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패하였습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'notice.jsp'");
		script.println("</script>");
	}
	
		
	}
	}
	%>
</body>
</html>