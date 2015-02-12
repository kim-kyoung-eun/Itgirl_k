package net.hb.boardMvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.boardMvc.Action;


@WebServlet("/GuestServlet")
public class GuestServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;

		public  void doGet(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
			 String command = request.getParameter("command");
		 	System.out.println("GuestServlet.java command=" + command);
		 	
		 	ActionFactory af=ActionFactory.getInstance();
		 	Action action=af.getAction(command);
		  action.user(request, response);		
		}//end
	
		 public  void doPost(HttpServletRequest request,		HttpServletResponse response) throws ServletException, IOException {
		 	 doGet(request, response);
		}//end
}//class END
