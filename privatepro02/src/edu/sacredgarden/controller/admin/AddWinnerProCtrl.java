package edu.sacredgarden.controller.admin;

import edu.sacredgarden.dto.Winner;
import edu.sacredgarden.model.WinnerDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddWinnerPro.do")
public class AddWinnerProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Winner winner = new Winner();
        winner.setTitle(request.getParameter("title"));
        winner.setContent(request.getParameter("content"));

        PrintWriter out = response.getWriter();

        WinnerDAO dao = new WinnerDAO();
        int a = dao.addWinner(winner);
        if(a>0) {
            response.sendRedirect(request.getContextPath() + "/AdminWinnerList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}