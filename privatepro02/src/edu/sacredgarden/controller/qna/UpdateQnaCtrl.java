package edu.sacredgarden.controller.qna;

import edu.sacredgarden.dto.Qna;
import edu.sacredgarden.model.QnaDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/UpdateQna.do")
public class UpdateQnaCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "공지사항의 내용을 수정합니다.";
        int qno = Integer.parseInt(request.getParameter("qno"));
        int lev = Integer.parseInt(request.getParameter("lev"));

        QnaDAO dao = new QnaDAO();
        Qna qna = dao.getQna(qno);

        request.setAttribute("msg", msg);
        request.setAttribute("qna", qna);
        request.setAttribute("lev", lev);
        request.setAttribute("qno", qno);

        RequestDispatcher view = request.getRequestDispatcher("/qna/updateQna.jsp");
        view.forward(request,response);
    }
}
