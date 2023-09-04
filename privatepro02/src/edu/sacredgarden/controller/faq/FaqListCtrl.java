package edu.sacredgarden.controller.faq;

import edu.sacredgarden.dto.Faq;
import edu.sacredgarden.model.FaqDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/FaqList.do")
public class FaqListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "고객님들께서 가장 자주하시는 질문을 모두 모았습니다.");

        FaqDAO dao = new FaqDAO();
        List<Faq> faqList = dao.getFaqList();
        request.setAttribute("faqList", faqList);

        RequestDispatcher view = request.getRequestDispatcher("/faq/faqList.jsp");
        view.forward(request, response);
    }
}
