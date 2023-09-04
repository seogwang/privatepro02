package edu.sacredgarden.controller.admin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/AddQna.do")
public class AddQnaCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int lev = Integer.parseInt(request.getParameter("lev"));
        int par = Integer.parseInt(request.getParameter("par"));


        String msg = "관리자의 QNA 글 등록폼이 로딩되었습니다.";

        request.setAttribute("msg", msg);
        request.setAttribute("lev", lev);
        request.setAttribute("par", par);


        RequestDispatcher view = request.getRequestDispatcher("/qna/addQna.jsp");
        view.forward(request, response);
    }
}
