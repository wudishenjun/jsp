package com.lol.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lol.model.Hero;
import com.lol.model.HeroManager;



/**
 * Servlet implementation class HeroServlet
 */
@WebServlet("/HeroServlet")
public class HeroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HeroServlet() {
    	super();
    }

	/**
	 * 显示某一个英雄
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HeroManager manager=new HeroManager();
		
		int id=Integer.parseInt(request.getParameter("id"));
		String isChange=request.getParameter("is_change");
		 String directPage="";
		 Hero hero=manager.findOne(id);
		 request.setAttribute("hero", hero);
		 
		if(isChange!=null){
			directPage="/lolView/update.jsp";
		}else{
			directPage="/lolView/hero.jsp";
		}
		RequestDispatcher dis=request.getRequestDispatcher(directPage);
		dis.forward(request, response);
	}

	/**
	 * 修改、添加某一个英雄
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//转码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");;
		
		String idStr=request.getParameter("id");
		HeroManager manager=new HeroManager();
		Hero hero=new Hero();
		
		hero.setName(request.getParameter("name"));
		hero.setNickname(request.getParameter("nickName"));
		hero.setAvatar(request.getParameter("avatar"));
		hero.setImage(request.getParameter("image"));
		hero.setDesc(request.getParameter("desc"));
		
		String info;
		
		if(idStr==null){
			manager.add(hero);
			info="英雄已成功添加";
		}else{
			int id=Integer.parseInt(idStr);
			hero.setId(id);
			manager.modify(hero);
			info="英雄已成功修改";
		}
		request.setAttribute("info", info);
		request.setAttribute("hero", hero);
		
		RequestDispatcher dis=request.getRequestDispatcher("/lolView/hero.jsp");
		dis.forward(request,response);
	}

}
