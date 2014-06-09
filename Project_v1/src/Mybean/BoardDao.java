package Mybean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class BoardDao {
	private Connection con;
	private ResultSet rs;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	
	// DB connection
	public BoardDao(){
		try{
		pool=DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DB Connection Fail : " + err);
		}
	}

	// close method
	public void freeCon(){
		if(con != null) try{con.close();}catch(Exception err){}
		if(stmt != null) try{stmt.close();}catch(Exception err){}
		if(rs != null) try{rs.close();}catch(Exception err){}	
	}
	
	// ListBoard view
	public Vector ListBoard(){
		Vector list = new Vector();
		BoardDto dto = new BoardDto();
		String sql ="Select * from board order by num";
		try{
			con=pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				dto.setNum(rs.getInt("num"));
				dto.setAddr(rs.getString("addr"));
				dto.setCategory(rs.getString("category"));
				
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
			}			
		}catch(Exception err){
			System.out.println("ListBoard error : "+ err);
		}finally{
			freeCon();
		}		
		return list;
	}
	
	// Write
	public void WriteBoard(BoardDto dto){
		try{
	         String sql = "insert into board(title, content, regdate, addr, category, id) values(?,?,now(),?,?,?,?)";
	         stmt = con.prepareStatement(sql);
	         stmt.setString(1, dto.getTitle());
	         stmt.setString(2, dto.getContent());
	         stmt.setString(3, dto.getAddr());
	         stmt.setString(4, dto.getCategory());
	         stmt.setString(5, dto.getId());
	         
	         stmt.executeUpdate();
		}catch(Exception err){
			System.out.println("WriteBoard error : " + err);
		}finally{
			freeCon();
		}
	}
	
	// View
	public void ReadBoard(int num){
		 BoardDto dto = new BoardDto();
		 String sql="";
		 try{
	         sql = "Select * from Board where num =?";
	         stmt = con.prepareStatement(sql);
	         stmt.setInt(1, num);
	         rs = stmt.executeQuery();
	            if(rs.next()){
	               dto.setNum(rs.getInt("num"));
	               dto.setAddr(rs.getString("addr"));
	               
	               dto.setCategory(rs.getString("category"));
	               dto.setRegdate(rs.getString("regdate"));
	               dto.setContent(rs.getString("content"));
	            }	 
		 }catch(Exception err){
			 System.out.println("ReadBoard error : " + err);
		 }finally{
			freeCon(); 
		 }	 
	}

	// Delete
	public void DeleteBoard(int num){
		BoardDto dto = new BoardDto();
		try{
			String sql="delete from board where num=?"; 
	         
	        con=pool.getConnection();
	        stmt=con.prepareStatement(sql);
	        stmt.setInt(1, num);
	        stmt.execute();
		
		}catch(Exception err){
			System.out.println("DeleteBoard error : " + err);
		}finally{
			freeCon();			
		}
	}
	
	// Update
	public BoardDto UpdateBoard(BoardDto dto){
		try{
			 con = pool.getConnection();
		     String sql="update board set addr=?, category=?, content=?, where num=?";
		     stmt = con.prepareStatement(sql);
		       
		     
		     stmt.setString(2, dto.getAddr());
		     stmt.setString(3, dto.getCategory());
		     stmt.setString(4, dto.getContent());
		     stmt.setInt(5, dto.getNum());
		     stmt.executeUpdate();
		     
		}catch(Exception err){
			System.out.println("UpdateBoard error : " + err);
		}finally{
			freeCon();
		}
		return dto;
	}
}
