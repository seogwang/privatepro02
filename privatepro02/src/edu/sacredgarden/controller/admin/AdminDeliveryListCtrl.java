package edu.sacredgarden.controller.admin;

import edu.sacredgarden.dto.Delivery;
import edu.sacredgarden.model.DeliveryDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminDeliveryList.do")
public class AdminDeliveryListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");

        if(!sid.equals("admin") || sid==null){
            response.sendRedirect(request.getContextPath());
        }

        DeliveryDAO dao = new DeliveryDAO();
        List<Delivery> deliveryList = dao.getDeliveryList();

        request.setAttribute("deliveryList", deliveryList);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/adminDeliveryList.jsp");
        view.forward(request, response);
    }
}
