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

@WebServlet("/Qna.do")
public class QnaCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int qno = Integer.parseInt(request.getParameter("qno"));
        QnaDAO dao = new QnaDAO();
        Qna qna = dao.getQna(qno);
        request.setAttribute("qna", qna);
        RequestDispatcher view = request.getRequestDispatcher("/qna/getQna.jsp");
        view.forward(request, response);
    }
}
