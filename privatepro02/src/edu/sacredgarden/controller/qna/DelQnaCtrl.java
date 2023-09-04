package edu.sacredgarden.controller.qna;

import edu.sacredgarden.model.QnaDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DelQna.do")
public class DelQnaCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//2. 보내온 데이터 받기
        int qno = Integer.parseInt(request.getParameter("qno"));
        int lev = Integer.parseInt(request.getParameter("lev"));

        QnaDAO dao = new QnaDAO();
        int a = dao.deleteQna(qno, lev);

        PrintWriter out = response.getWriter();

        if(a>0){
            response.sendRedirect(request.getContextPath()+"/QnaList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
