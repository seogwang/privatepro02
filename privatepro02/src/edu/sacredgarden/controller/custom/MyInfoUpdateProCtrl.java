package edu.sacredgarden.controller.custom;

import edu.sacredgarden.dto.Custom;
import edu.sacredgarden.model.CustomDAO;
import edu.sacredgarden.util.AES256;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/MyInfoUpdatePro.do")
public class MyInfoUpdateProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String re_pw = request.getParameter("re_pw");
        String email = request.getParameter("email");
        String re_email = request.getParameter("re_email");
        String tel = request.getParameter("tel");
        String re_tel = request.getParameter("re_tel");
        String addr = request.getParameter("addr");
        String re_addr1 = request.getParameter("re_address1");
        String re_addr2 = request.getParameter("re_address2");
        String re_postcode = request.getParameter("re_postcode");

        boolean result = false;
        int suc = 0;

        if(re_pw!="") {
            pw=re_pw;
        }

        if(re_email!="") {
            email=re_email;
        }

        if(re_tel!="") {
            tel=re_tel;
        }
        System.out.println("addr값 : "+addr);
        if(re_addr1!="" && re_addr2!="" && re_postcode!="") {
            addr=re_addr1+"<br>"+re_addr2+"("+re_postcode+")";
        }
        System.out.println("변경된 addr값 : "+addr);
        String key = "%02x";
        String encrypted = "";
        try {
            encrypted = AES256.encryptAES256(pw, key);
            System.out.println("비밀번호 암호화 : "+encrypted);
        } catch (Exception e) {
            e.printStackTrace();
        }

        CustomDAO dao = new CustomDAO();
        Custom user = new Custom();

        user.setId(id);
        user.setPw(encrypted);
        user.setTel(tel);
        user.setEmail(email);
        user.setAddr(addr);
        suc = dao.updateCustom(user);

        if(suc>0){
            response.sendRedirect(request.getContextPath()+"/Mypage.do?id="+id);
        } else {
            response.sendRedirect("/MyInfoUpdate.do?id="+id);
        }
    }
}
