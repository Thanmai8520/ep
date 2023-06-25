package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.*;

public class RegisterService extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		try {
		manager lm = new manager();
		String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String accno = request.getParameter("accno");
        String acctype = request.getParameter("acctype");
        registerpage l = new registerpage();
        l.setFullname(fullname);
        l.setUsername(username);
        l.setEmail(email);
        l.setPassword(password);
        l.setAccno(accno);
        l.setAcctype(acctype);
        String ack=lm.saveData(l);
		pw.print(ack);
		}
		catch(Exception e)
		{
			pw.print(e.getMessage());
		}
		response.sendRedirect("index.jsp");

           
     
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
