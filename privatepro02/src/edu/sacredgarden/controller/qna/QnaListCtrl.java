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
import java.util.List;

@WebServlet("/QnaList.do")
public class QnaListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "QNA 목록을 출력합니다.");

        QnaDAO dao = new QnaDAO();
        List<Qna> qnaList = dao.getQnaList();

        request.setAttribute("qnaList", qnaList);
        RequestDispatcher view = request.getRequestDispatcher("/qna/qnaList.jsp");
        view.forward(request, response);
    }
}
