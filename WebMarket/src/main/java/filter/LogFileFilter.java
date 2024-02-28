package filter;

import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;

public class LogFileFilter implements Filter{
	PrintWriter writer;
	
	public void init(FilterConfig config) throws ServletException{
		String filename = config.getInitParameter("filename");
		
		if(filename == null) 
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		try {
			
		}
		
	}
}
