package edu.sacredgarden.controller.admin;

import edu.sacredgarden.model.EventDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DeleteEvent.do")
public class DeleteEventCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int no = Integer.parseInt(request.getParameter("no"));

        EventDAO dao = new EventDAO();
        int a = dao.deleteEvent(no);

        PrintWriter out = response.getWriter();

        if(a>0){
            response.sendRedirect(request.getContextPath() + "/AdminEventList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
