<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try{
			String sql = "select id, passwd from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				String rId = rs.getString("id");
				String rPasswd = rs.getString("passwd");
				
				if(id.equals(rId) && passwd.equals(rPasswd)){
					sql = "delete from member where id=? and passwd = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.setString(2, passwd);
					pstmt.executeUpdate();
					out.println("Member 테이블 삭제");
				}else{
					out.println("비밀번호가 일치하지 않음");
				}
			}else{
				out.println("Member 테이블에 일치하는 아이디가 없음");
			}
		}catch(SQLException ex){
			out.println("SQLException: " + ex.getMessage());
		}finally{
			if(rs != null){
				rs.close();
			}
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
	%>
</body>
</html>