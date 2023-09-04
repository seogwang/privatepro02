package edu.sacredgarden.controller.admin;

import edu.sacredgarden.dto.Event;
import edu.sacredgarden.model.EventDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateEvent.do")
public class UpdateEventCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "이벤트의 내용을 수정합니다.";
        int no = Integer.parseInt(request.getParameter("no"));

        EventDAO dao = new EventDAO();
        Event event = dao.getEvent(no);

        request.setAttribute("msg", msg);
        request.setAttribute("event", event);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/updateEvent.jsp");
        view.forward(request,response);
    }
}
