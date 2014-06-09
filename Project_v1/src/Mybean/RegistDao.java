package Mybean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

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
	
	// 글 리스트 받아오기
	public Vector getBoard(){
		Vector v = new Vector();
		RegistDto dto = new RegistDto();
		String sql ="Select * from member";
		try{
			con = pool.getConnection();		
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setPhone_type(rs.getString("phone_type"));
				dto.setGender(rs.getString("gender"));
				dto.setName(rs.getString("name"));
				v.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getBoard : " + err);
		}
		finally{
			freeCon();
		}
		return v;
	}
	
	// 아이디 받아오기
	public Vector ReadId(){
		RegistDto dto = new RegistDto();
		Vector list = new Vector(); 
		try{
		String sql = "select id from member";
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				dto.setId(rs.getString("id"));
				list.add(dto);
				System.out.println(list.get(0));
			}
		}catch(Exception err){
			System.out.println("ReadId error : "+ err);
		}finally{
			freeCon();
		}
		return list;
	}
	// 이메일 받아오기
	
	public Vector ReadEmail(){
		RegistDto dto = new RegistDto();
		Vector list = new Vector();
		try{
		String sql = "select email from member";
			con = pool.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()){
				dto.setId(rs.getString("email"));
				list.add(dto);
			}
		}catch(Exception err){
			System.out.println("ReadEmail error : "+ err);
		}finally{
			freeCon();
		}
		return list;
	}
}

