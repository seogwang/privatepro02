package edu.sacredgarden.controller.admin;

import edu.sacredgarden.dto.Event;
import edu.sacredgarden.model.EventDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateEventPro.do")
public class UpdateEventProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Event event = new Event();
        event.setNo(Integer.parseInt(request.getParameter("no")));
        event.setImg(request.getParameter(request.getParameter("img")));
        event.setTitle(request.getParameter("title"));
        event.setContent(request.getParameter("content"));

        EventDAO dao = new EventDAO();
        int a = dao.updateEvent(event);

        PrintWriter out = response.getWriter();

        if(a>0){
            response.sendRedirect(request.getContextPath() + "/AdminEventList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
