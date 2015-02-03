package net.hb.boardMvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public void user(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
}//interface end
