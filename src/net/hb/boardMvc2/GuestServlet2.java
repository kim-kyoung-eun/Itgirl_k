package net.hb.boardMvc2;

import java.io.IOException;




import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.hb.boardMvc2.Action2;


@WebServlet("/GuestServlet2")
public class GuestServlet2 extends HttpServlet {
	 private static final long serialVersionUID = 1L;

		public  void doGet(HttpServletRequest request,	HttpServletResponse response) throws ServletException, IOException {
			 String command = request.getParameter("command");
		 	System.out.println("GuestServlet2.java command=" + command);
		 	
		 	ActionFactory2 af=ActionFactory2.getInstance();
		 	Action2 action=af.getAction(command);
		   action.user(request, response);		
		}//end
	
		 public  void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		 	 doGet(request, response);
		}//end
}//class END
