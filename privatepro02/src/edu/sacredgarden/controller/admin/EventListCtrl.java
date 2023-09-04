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
import java.util.List;

@WebServlet("/AdminEventList.do")
public class EventListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "이벤트 목록을 출력합니다.");

        EventDAO dao = new EventDAO();
        List<Event> eventList = dao.getEventList();
        request.setAttribute("eventList", eventList);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/eventList.jsp");
        view.forward(request, response);
    }
}


