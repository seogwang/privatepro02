package edu.sacredgarden.controller.admin;

import edu.sacredgarden.dto.Qna;
import edu.sacredgarden.model.QnaDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddQnaPro.do")

public class AddQnaProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String author = request.getParameter("author");


        System.out.println(request.getParameter("lev"));
        System.out.println(request.getParameter("lev"));

        int lev = Integer.parseInt(request.getParameter("lev"));
        int par = Integer.parseInt(request.getParameter("par"));

        Qna qna = new Qna();
        qna.setTitle(title);
        qna.setContent(content);
        qna.setAuthor(author);
        qna.setLev(lev);
        qna.setPar(par);


        PrintWriter out = response.getWriter();

        QnaDAO dao = new QnaDAO();
        int a = dao.addQna(qna);
        if(a>0) {
            response.sendRedirect(request.getContextPath()+"/QnaList.do");
        } else {
            //request.sendRedirect("/AddNotice.do");
            out.println("<script>history.go(-1);</script>");
        }
    }
}
