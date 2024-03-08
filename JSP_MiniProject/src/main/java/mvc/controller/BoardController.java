package mvc.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;


public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5; 

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		if(request.getSession().getAttribute("sessionId") == null || request.getSession().getAttribute("sessionId").equals("null")) {
			String loginId = request.getParameter("loginId");
			request.getSession().setAttribute("sessionId", loginId);
		}
		
	
		if (command.equals("/BoardListAction.do")) {//��ϵ� �� ��� ������ ����ϱ�
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("/Board/boardMain.jsp");
			rd.forward(request, response);
		} else if (command.equals("/BoardWriteForm.do")) { // �� ��� ������ ����ϱ�
				requestLoginName(request);
				RequestDispatcher rd = request.getRequestDispatcher("/Board/writeForm.jsp");
				rd.forward(request, response);				
		} else if (command.equals("/BoardWriteAction.do")) {// ���ο� �� ����ϱ�
				requestBoardWrite(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
				rd.forward(request, response);						
		} else if (command.equals("/BoardViewAction.do")) {//���õ� �� �� ������ ��������
				requestBoardView(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardView.do");
				rd.forward(request, response);						
		} else if (command.equals("/BoardView.do")) { //�� �� ������ ����ϱ�
				RequestDispatcher rd = request.getRequestDispatcher("/Board/view.jsp");
				rd.forward(request, response);	
		} else if (command.equals("/BoardUpdateAction.do")) { //���õ� ���� ��ȸ�� �����ϱ�
				requestBoardUpdate(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
				rd.forward(request, response);
		}else if (command.equals("/BoardDeleteAction.do")) { //���õ� �� �����ϱ�
				requestBoardDelete(request);
				RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
				rd.forward(request, response);				
		} 
	}
	//��ϵ� �� ��� ��������	
	public void requestBoardList(HttpServletRequest request){
			
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		
	  	int pageNum=1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
				
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		int total_record=dao.getListCount(items, text);
		boardlist = dao.getBoardList(pageNum,limit, items, text); 
		
		int total_page;
		
		if (total_record % limit == 0){     
	     	total_page =total_record/limit;
	     	Math.floor(total_page);  
		}
		else{
		   total_page =total_record/limit;
		   Math.floor(total_page); 
		   total_page =  total_page + 1; 
		}		
   
   		request.setAttribute("pageNum", pageNum);		  
   		request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("boardlist", boardlist);								
	}
	//������ ����ڸ� ��������
	public void requestLoginName(HttpServletRequest request){
					
		String id = request.getParameter("id");
		
		BoardDAO  dao = BoardDAO.getInstance();
		
		String name = dao.getLoginNameById(id);		
		
		request.setAttribute("name", name);									
	}
	// ���ο� �� ����ϱ�
	public void requestBoardWrite(HttpServletRequest request){
					
		BoardDAO dao = BoardDAO.getInstance();		
		
		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));	
				
		board.setHit(0);
		
		dao.insertBoard(board);								
	}
	//���õ� �� �� ������ ��������
	public void requestBoardView(HttpServletRequest request){
					
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num, pageNum);		
		
		request.setAttribute("num", num);		 
   		request.setAttribute("page", pageNum); 
   		request.setAttribute("board", board);   									
	}
	//���õ� �� ���� �����ϱ�
	public void requestBoardUpdate(HttpServletRequest request){
					
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		BoardDAO dao = BoardDAO.getInstance();		
		
		BoardDTO board = new BoardDTO();		
		board.setNum(num);
		board.setId(request.getParameter("id"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));		
		
		 board.setHit(0);
		 board.setIp(request.getRemoteAddr());			
		
		 dao.updateBoard(board);								
	}
	//���õ� �� �����ϱ�
	public void requestBoardDelete(HttpServletRequest request){
					
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(num);							
	}	
	
}
