package Mybean;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardDto {
	private int num;
	private String regdate;
	private String content;
	private String category;
	private String addr;
	private String image;
	private MultipartRequest multi;
	private String path;
	private int max = 0;
	private String encType;
	private String saveFiles;
	private String oriFile;
	
	
	
	// GenericServlet의 생성이 불가능 하여 그 자식을 찾아가서 비슷한 조건으로 만들어준다.
		public void setPath(HttpServletRequest servlet, String path) {
			this.path = servlet.getServletContext().getRealPath(path);
			System.out.println(path);
		}
		
		public void setMax(int max) {
			this.max = max;
		}

		public void setEncType(String encType) {
			this.encType = encType;
		}

		public void setMulti(HttpServletRequest req) {
			try {
				multi = new MultipartRequest(req, path, max, encType,
						new DefaultFileRenamePolicy());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		public void setRealPath(String realPath) {	
			System.out.println(path+"1");
			System.out.println(realPath+"2");
			path = realPath;
		}
		public String getRealPath(){
			
			return path;
		}
	public int getNum() {
		try {
			if (multi.getParameter("num") != null) {
				num = Integer.parseInt(multi.getParameter("num"));
			}
		} catch (Exception err) {

		}
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getRegdate() {
		try{
			if(multi.getParameter("regdate")!= null){
				regdate = multi.getParameter("regdate");
			}
		} catch(Exception err){}
		
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		try{
			if(multi.getParameter("content")!=null){
				content = multi.getParameter("content");
			}
		}catch(Exception err){
			
		}
		
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		try{
			if(multi.getParameter("category")!=null){
				category = multi.getParameter("category");
			}
		}catch(Exception err){
			
		}
		
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAddr() {
		try{
			if(multi.getParameter("addr")!=null){
				addr = multi.getParameter("addr");
			}
		}catch(Exception err){
			
		}
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getSaveFiles() {
		try{
			if(multi.getFilesystemName("filePath")!=null){
		saveFiles = "";
		Enumeration em = multi.getParameterNames();
		while (em.hasMoreElements()) {
			String name = (String) em.nextElement();
		}
		em = multi.getFileNames();
		while (em.hasMoreElements()) {
			String name = (String) em.nextElement();
			saveFiles = multi.getFilesystemName(name);
		}
		}
		}catch(Exception err){
			
		}
		return saveFiles;
	}
	public void setSaveFiles(String saveFiles) {
		this.saveFiles = saveFiles;
	}
	public String getOriFile() {
		try{
			if(multi.getOriginalFileName("filePath")!=null){
		oriFile = "";
		Enumeration em = multi.getParameterNames();
		while (em.hasMoreElements()) {
			String name = (String) em.nextElement();
		}
		em = multi.getFileNames();
		while (em.hasMoreElements()) {
			String name = (String) em.nextElement();
			oriFile = multi.getOriginalFileName(name);
		}
		}
		}catch(Exception err){
			
		}
		return oriFile;
	}
	public void setOriFile(String oriFile) {
		this.oriFile = oriFile;
	}
}
