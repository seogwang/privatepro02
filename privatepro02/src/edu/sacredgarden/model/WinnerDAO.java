package edu.sacredgarden.model;

import edu.sacredgarden.dto.Winner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WinnerDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public List<Winner> getWinnerList(){
        List<Winner> winnerList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.WINNER_SELECT_ALL);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Winner winner = new Winner();
                winner.setNo(rs.getInt("no"));
                winner.setTitle(rs.getString("title"));
                winner.setContent(rs.getString("content"));
                winner.setResdate(rs.getString("resdate"));
                winnerList.add(winner);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return winnerList;
    }

    public Winner getWinner(int no){
        Winner winner = new Winner();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.WINNER_SELECT_ONE);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            if(rs.next()){
                winner.setNo(rs.getInt("no"));
                winner.setTitle(rs.getString("title"));
                winner.setContent(rs.getString("content"));
                winner.setResdate(rs.getString("resdate"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return winner;
    }

    public int addWinner(Winner winner){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.WINNER_INSERT);
            pstmt.setString(1, winner.getTitle());
            pstmt.setString(2, winner.getContent());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int updateWinner(Winner winner){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "update winner set title=?, content=? where no=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, winner.getTitle());
            pstmt.setString(2, winner.getContent());
            pstmt.setInt(3, winner.getNo());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int deleteWinner(int no){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "delete from winner where no=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }
}
