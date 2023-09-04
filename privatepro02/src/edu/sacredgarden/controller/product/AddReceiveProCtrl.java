package edu.sacredgarden.controller.product;

import edu.sacredgarden.dto.Receive;
import edu.sacredgarden.dto.Serve;
import edu.sacredgarden.model.PaymentDAO;
import edu.sacredgarden.model.ProductDAO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddReceivePro.do")
public class AddReceiveProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext application = request.getServletContext();
        String home = application.getContextPath();
        Receive rec = new Receive();
        rec.setPno(Integer.parseInt(request.getParameter("pno")));
        rec.setAmount(Integer.parseInt(request.getParameter("amount")));
        rec.setRprice(Integer.parseInt(request.getParameter("rprice")));
        ProductDAO dao = new ProductDAO();
        int cnt = dao.addReceive(rec);
        //출고 처리(PaymentDAO.addServe(serv))
        PaymentDAO payDAO = new PaymentDAO();
        Serve serv = new Serve();
        serv.setPno(Integer.parseInt(request.getParameter("pno")));
        serv.setAmount(0);
        int sprice = (int) Double.parseDouble(request.getParameter("rprice"));
        serv.setSprice(sprice);
        int cnt2 = payDAO.addServe2(serv);
        if (cnt > 0 && cnt2 > 0) {
            response.sendRedirect(home + "/ProList.do");
        } else {
            response.sendRedirect(home + "/AddReceive.do");
        }
    }
}