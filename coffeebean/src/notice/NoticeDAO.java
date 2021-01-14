package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class NoticeDAO {
	private Connection conn;
	private PreparedStatement pstm;
	private ResultSet rs;
	
	
	public NoticeDAO() {
		try {
//			String driver = ;
			 String url = "jdbc:oracle:thin:@localhost:1521:XE";
			 String user = "shop";
			 String pwd = "1234";
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 conn = DriverManager.getConnection(url,user,pwd);
			
		}catch(Exception e) {
			System.out.println("접속오류");
			e.printStackTrace();
		}	
	}
	public int getNext() {
		String SQL = "SELECT num FROM notice ORDER BY num DESC";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL);
			rs = pstm.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
				
			}
			return 1; //첫번째 게시물인경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	
	public int write(String title,String userID,String content) {
		String SQL = "INSERT INTO notice VALUES (?,?,?,?,?)";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL);
			pstm.setInt(1, getNext());
			pstm.setString(2, title);
			pstm.setString(3, userID);
			pstm.setString(4, content);
			pstm.setInt(5, 1);
			
			return pstm.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<NoticeBeans> getList(int pageNum){
		String SQL = "SELECT * FROM (SELECT * FROM notice WHERE num < ? AND bbs = 1 ORDER BY num DESC) WHERE ROWNUM <= 10";
		ArrayList<NoticeBeans> list = new ArrayList<NoticeBeans>();
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL);
			pstm.setInt(1, getNext() - (pageNum -1) * 10);
			
			rs=pstm.executeQuery();
			while(rs.next()) {
				NoticeBeans nb = new NoticeBeans();
				nb.setNum(rs.getInt(1));
				nb.setTitle(rs.getString(2));
				nb.setUserID(rs.getString(3));
				nb.setContent(rs.getString(4));
				nb.setBbs(rs.getInt(5));
				list.add(nb);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}	
	public boolean nextPage(int pageNum) {
		String SQL = "SELECT * FROM notice WHERE num <? AND bbs = 1 ";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL);
			pstm.setInt(1, getNext() - (pageNum -1) * 10);
			rs = pstm.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public NoticeBeans getBbs(int num) {
		String SQL = "SELECT * FROM notice WHERE num = ? ";
		try {
			PreparedStatement pstm = conn.prepareStatement(SQL);
			pstm.setInt(1, num);
			rs = pstm.executeQuery();
			if(rs.next()) {
				NoticeBeans nb = new NoticeBeans();
				nb.setNum(rs.getInt(1));
				nb.setTitle(rs.getString(2));
				nb.setUserID(rs.getString(3));
				nb.setContent(rs.getString(4));
				nb.setBbs(rs.getInt(5));				
				return nb;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}

