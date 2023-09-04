package edu.sacredgarden.controller.delivery;

import edu.sacredgarden.dto.Delivery;
import edu.sacredgarden.model.DeliveryDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Delivery.do")
public class DeliveryCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sno = Integer.parseInt(request.getParameter("sno"));

        DeliveryDAO dao = new DeliveryDAO();
        Delivery del = dao.getBySnoDelivery(sno);

        request.setAttribute("del", del);
        RequestDispatcher view = request.getRequestDispatcher("/custom/delivery.jsp");
        view.forward(request, response);
    }
}
