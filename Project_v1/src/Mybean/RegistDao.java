package Mybean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RegistDao {
	private Connection con;
	private ResultSet rs;
	private PreparedStatement stmt;
	private DBConnectionMgr pool;
	
	public RegistDao(){
		try{
		pool=DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}

	public void freeCon(){
		if(con != null) try{con.close();}catch(Exception err){}
		if(stmt != null) try{stmt.close();}catch(Exception err){}
		if(rs != null) try{rs.close();}catch(Exception err){}
	
	}

	public void insertBoard(RegistDto dto){
		String sql = "insert into member( name, id, pass, email,"
			+ " birth, gender,phone, phone_type)"
			+ " values(?,?,?,?,?,?,?,?)";

		try{
			con = pool.getConnection();		
			stmt = con.prepareStatement(sql);
			String birth = dto.getYear()+"/"+dto.getMonth()+"/"+dto.getDay();
			stmt.setString(1, dto.getName());
			stmt.setString(2, dto.getId());
			stmt.setString(3, dto.getPass());
			stmt.setString(4, dto.getEmail());
			stmt.setString(5, birth);
			stmt.setString(6, dto.getGender());
			stmt.setString(7, dto.getPhone());
			stmt.setString(8, dto.getPhone_type());
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("insertBoard : " + err);
		}
		finally{
			freeCon();
		}
	}
}
