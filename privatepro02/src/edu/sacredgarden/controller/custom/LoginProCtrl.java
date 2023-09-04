package edu.sacredgarden.controller.custom;

import edu.sacredgarden.model.CustomDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/LoginPro.do")
public class LoginProCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(":::::::::::::::LoginPro.do 도착");
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String msg = "로그인 메시지";

        CustomDAO dao = new CustomDAO();
        boolean pass = false;
        try {
            pass = dao.login(id, pw);
        } catch (Exception e){
            System.out.println(e.getMessage());
        }

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        RequestDispatcher view;

        if(pass){
            msg = "로그인 성공";
            session.setAttribute("sid", id);
            request.setAttribute("msg", msg);
            response.sendRedirect(request.getContextPath());
            //response.sendRedirect("/");
            //view = request.getRequestDispatcher("/pro02");
            //view.forward(request, response);
        } else {
            msg = "로그인 실패";
            response.sendRedirect("/Login.do?msg="+msg);
            //out.println("<script>history.go(-1);</script>");
        }
    }
}