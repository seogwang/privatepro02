package edu.sacredgarden.controller.qna;

import edu.sacredgarden.dto.Qna;
import edu.sacredgarden.model.QnaDAO;
import edu.sacredgarden.util.Page;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/KwdQnaList.do")
public class KwdQnaListCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "Qna 목록을 출력합니다.");

        String searchType = request.getParameter("searchType");
        String kwd = request.getParameter("kwd");

        QnaDAO dao = new QnaDAO();
        List<Qna> qnaList = dao.getQnaList(searchType, kwd, 0);
        Page pg = new Page();
        int total = dao.getCount(searchType, kwd);
        pg.makeBlock(1);
        pg.makeLastPageNum();
        pg.makePostStart(1);

        int curPageNum = 1;
        if(request.getParameter("page")!=null){
            curPageNum = Integer.parseInt(request.getParameter("page"));
            pg.makeBlock(curPageNum, searchType, kwd);
            pg.makeLastPageNum(searchType, kwd);
            pg.makePostStart(curPageNum, searchType, kwd);
            qnaList = dao.getQnaList(searchType, kwd,pg.getPostStart()-1);
        }

        request.setAttribute("searchType", searchType);
        request.setAttribute("kwd", kwd);
        request.setAttribute("totalPageCount", pg.getTotalPageCount());
        request.setAttribute("pageBlockNum", pg.getPageBlockNum());
        request.setAttribute("totalBlockNum", pg.getTotalBlockNum());
        request.setAttribute("curPageNum", curPageNum);
        request.setAttribute("blockStartNum", pg.getBlockStartNum());
        request.setAttribute("blockLastNum", pg.getBlockLastNum());
        request.setAttribute("lastPageNum", pg.getLastPageNum());
        request.setAttribute("qnaList", qnaList);
        RequestDispatcher view = request.getRequestDispatcher("/qna/qnaList.jsp");
        view.forward(request, response);
    }
}
