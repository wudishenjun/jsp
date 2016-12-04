package message;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import message.MessageBean;
/**
 * Servlet implementation class AddMessageServlet
 */
@WebServlet("/AddMessageServlet")
public class AddMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddMessageServlet(){
		
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String author=request.getParameter("author");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today=format.format(new Date());
		MessageBean mm=new MessageBean();
		mm.setAuthor(author);
		mm.setTitle(title);
		mm.setContent(content);
		mm.setTime(today);
		HttpSession session=request.getSession();
		ServletContext scx=session.getServletContext();
		
		@SuppressWarnings("unchecked")
		ArrayList<MessageBean> wordlist=(ArrayList<MessageBean>)scx.getAttribute("wordlist");
		if(wordlist==null){
			wordlist=new ArrayList<MessageBean>();
		}
		wordlist.add(mm);
			scx.setAttribute("wordlist", wordlist);
			response.sendRedirect("showMessage.jsp");
	}

}
