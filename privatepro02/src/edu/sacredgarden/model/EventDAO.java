package edu.sacredgarden.model;

import edu.sacredgarden.dto.Event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public List<Event> getEventList(){
        List<Event> eventList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.EVENT_SELECT_ALL);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Event event = new Event();
                event.setImg(rs.getString("img"));
                event.setNo(rs.getInt("no"));
                event.setTitle(rs.getString("title"));
                event.setContent(rs.getString("content"));
                event.setResdate(rs.getString("resdate"));
                eventList.add(event);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return eventList;
    }

    public Event getEvent(int no){
        Event event = new Event();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.EVENT_SELECT_ONE);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            if(rs.next()){
                event.setImg(rs.getString("img"));
                event.setNo(rs.getInt("no"));
                event.setTitle(rs.getString("title"));
                event.setContent(rs.getString("content"));
                event.setResdate(rs.getString("resdate"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return event;
    }

    public int addEvent(Event event){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.EVENT_INSERT);
            pstmt.setString(1, event.getTitle());
            pstmt.setString(2, event.getContent());
            pstmt.setString(3, event.getImg());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int updateEvent(Event event){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "update event set img=?, title=?, content=? where no=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, event.getImg());
            pstmt.setString(2, event.getTitle());
            pstmt.setString(3, event.getContent());
            pstmt.setInt(4, event.getNo());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int deleteEvent(int no){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "delete from event where no=?";
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
