package edu.sacredgarden.model;

import edu.sacredgarden.dto.Qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QnaDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public List<Qna> getQnaList(){
        List<Qna> QnaList = new ArrayList<>();
        DBConnect con = new MariaDBCon();

        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.QNA_SELECT_ALL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Qna qna = new Qna();
                qna.setQno(rs.getInt("qno"));
                qna.setTitle(rs.getString("title"));
                qna.setContent(rs.getString("content"));
                qna.setAuthor(rs.getString("author"));
                qna.setResdate(rs.getString("resdate"));
                qna.setCnt(rs.getInt("cnt"));
                qna.setLev(rs.getInt("lev"));
                qna.setPar(rs.getInt("par"));
                qna.setName(rs.getString("name"));
                QnaList.add(qna);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        finally {
            con.close(rs, pstmt, conn);
        }
        return QnaList;
    }
    public List<Qna> getQnaList(int qno){
        List<Qna> QnaList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.QNA_SELECT_RANGE);
            pstmt.setInt(1, qno);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Qna qna = new Qna();
                qna.setQno(rs.getInt("qno"));
                qna.setTitle(rs.getString("title"));
                qna.setContent(rs.getString("content"));
                qna.setResdate(rs.getString("resdate"));
                qna.setAuthor(rs.getString("author"));
                qna.setCnt(rs.getInt("cnt"));
                qna.setLev(rs.getInt("lev"));
                qna.setPar(rs.getInt("par"));
                QnaList.add(qna);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return QnaList;
    }

    public Qna getQna(int qno){
        Qna qna = new Qna();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.QNA_SELECT_ONE);
            pstmt.setInt(1, qno);
            rs = pstmt.executeQuery();

            if(rs.next()){
                qna.setQno(rs.getInt("qno"));
                qna.setTitle(rs.getString("title"));
                qna.setContent(rs.getString("content"));
                qna.setResdate(rs.getString("resdate"));
                qna.setAuthor(rs.getString("author"));
                qna.setQno(rs.getInt("lev"));
                qna.setQno(rs.getInt("par"));
                qna.setCnt(rs.getInt("cnt"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
       return qna;
    }

    public int addQna(Qna qna){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.QNA_INSERT);
            pstmt.setString(1, qna.getTitle());
            pstmt.setString(2, qna.getContent());
            pstmt.setString(3, qna.getAuthor());
            pstmt.setInt(4, qna.getLev());
            pstmt.setInt(5, qna.getPar());

            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        con = new MariaDBCon();
        conn = con.connect();
        if (qna.getLev() == 0) {
            String sql = "update qna set par=qno where par=0 and lev=0";
            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.executeUpdate();
                cnt++;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return cnt;
    }

    public int updateQna(Qna qna){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "update qna set title=?, content=?, author=? where qno=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, qna.getTitle());
            pstmt.setString(2, qna.getContent());
            pstmt.setString(3, qna.getAuthor());
            pstmt.setInt(4, qna.getQno());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int deleteQna(int qno, int lev){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "";
        if (lev == 0) {
            sql = "delete from qna where par=?";    //삭제 대상이 질문글 일때
        } else {
            sql = "delete from qna where qno=?";    //삭제 대상이 답변글 일때
        }
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, qno);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int getCount(){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.QNA_COUNT);
            rs = pstmt.executeQuery();
            if(rs.next()){
                cnt = rs.getInt("cnt");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return cnt;
    }

    public int getCount(String searchType, String kwd){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            if(searchType.equals("title")) {
                pstmt = conn.prepareStatement(DBConnect.QNA_COUNT_TITLE);
                pstmt.setString(1, "%" + kwd + "%");
            } else if(searchType.equals("content")){
                pstmt = conn.prepareStatement(DBConnect.QNA_COUNT_CONTENT);
                pstmt.setString(1, "%" + kwd + "%");
            } else {
                pstmt = conn.prepareStatement(DBConnect.QNA_COUNT_ALL);
                pstmt.setString(1, "%" + kwd + "%");
                pstmt.setString(2, "%" + kwd + "%");
            }
            rs = pstmt.executeQuery();
            if(rs.next()){
                cnt = rs.getInt("cnt");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return cnt;
    }

    public List<Qna> getQnaList(String searchType, String kwd, int qno) {
        List<Qna> qnaList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            if(searchType.equals("title")) {
                pstmt = conn.prepareStatement(DBConnect.QNA_SELECT_TITLE_RANGE);
                pstmt.setString(1, "%"+kwd+"%");
                pstmt.setInt(2, qno);
            } else if(searchType.equals("content")){
                pstmt = conn.prepareStatement(DBConnect.QNA_SELECT_CONTENT_RANGE);
                pstmt.setString(1, "%"+kwd+"%");
                pstmt.setInt(2, qno);
            } else {
                pstmt = conn.prepareStatement(DBConnect.QNA_SELECT_ALL_RANGE);
                pstmt.setString(1, "%"+kwd+"%");
                pstmt.setString(2, "%"+kwd+"%");
                pstmt.setInt(3, qno);
            }
            rs = pstmt.executeQuery();
            while(rs.next()){
                Qna qna = new Qna();
                qna.setQno(rs.getInt("qno"));
                qna.setTitle(rs.getString("title"));
                qna.setContent(rs.getString("content"));
                qna.setResdate(rs.getString("resdate"));
                qna.setCnt(rs.getInt("cnt"));
                qnaList.add(qna);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return qnaList;
    }

    public int getStartPost(String searchType, String kwd){
        int startPost = 0;
        return startPost;
    }

}
