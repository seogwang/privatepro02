package edu.sacredgarden.controller.admin;

import edu.sacredgarden.dto.Delivery;
import edu.sacredgarden.model.DeliveryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AdminUpdateDeliveryPro.do")
public class AdminUpdateDeliveryProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");

        if(!sid.equals("admin") || sid==null){
            response.sendRedirect(request.getContextPath());
        }

        Delivery del = new Delivery();

        del.setDno(Integer.parseInt(request.getParameter("dno")));
        del.setPcom(request.getParameter("pcom"));
        del.setPtel(request.getParameter("ptel"));
        del.setSdate(request.getParameter("sdate"));
        del.setRdate(request.getParameter("rdate"));
        del.setBcode(request.getParameter("bcode"));

        DeliveryDAO dao = new DeliveryDAO();
        int cnt = dao.deliveryPro(del);

        PrintWriter out = response.getWriter();

        if(cnt>0){
            response.sendRedirect(request.getContextPath()+"/AdminDeliveryList.do?dno="+request.getParameter("dno"));
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
