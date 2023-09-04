package edu.sacredgarden.controller.qna;

import edu.sacredgarden.dto.Qna;
import edu.sacredgarden.model.QnaDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateQnaPro.do")
public class UpdateQnaProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Qna qna = new Qna();
        qna.setQno(Integer.parseInt(request.getParameter("qno")));
        qna.setTitle(request.getParameter("title"));
        qna.setContent(request.getParameter("content"));
        qna.setAuthor(request.getParameter("author"));

        QnaDAO dao = new QnaDAO();
        int a = dao.updateQna(qna);

        PrintWriter out = response.getWriter();

        if(a>0){
            response.sendRedirect(request.getContextPath()+"/QnaList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
