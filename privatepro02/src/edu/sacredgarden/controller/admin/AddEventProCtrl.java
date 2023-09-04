package edu.sacredgarden.controller.admin;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import edu.sacredgarden.dto.Event;
import edu.sacredgarden.model.EventDAO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

@WebServlet("/AddEventPro.do")
public class AddEventProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String msg = "";
        ServletContext application = request.getServletContext();

        try {
            String saveDirectory = application.getRealPath("/storage");//실제 저장 경로
            int maxSize = 1024 * 1024 * 10;
            String encoding = "UTF-8";

            MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
            Event event = new Event();
            event.setTitle(mr.getParameter("title"));

            System.out.println(event.getTitle());

            event.setContent(mr.getParameter("content"));
            System.out.println(event.getContent());

            Enumeration files = mr.getFileNames();
            String item = (String) files.nextElement();

            File upfile = mr.getFile(item);
            if (upfile.exists()) {
                msg = "파일 업로드 성공";
                event.setImg(upfile.getName());
                System.out.println(event.getImg());
                EventDAO dao = new EventDAO();
                int cnt = dao.addEvent(event);
                response.sendRedirect(request.getContextPath() + "/AdminEventList.do");
            } else {
                msg = "파일 업로드 실패";
                PrintWriter out = response.getWriter();
                out.println("<script>history.go(-1);</script>");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            msg = "파일 업로드 실패";
            PrintWriter out = response.getWriter();
            out.println("<script>history.go(-1);</script>");
        }
    }
}
