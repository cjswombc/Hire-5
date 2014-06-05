package Mybean;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BasicBean {
	private MultipartRequest multi;
	
	private String path=null;
	private int max=0;
	private String encType;
	//GenericServlet의 생성이 불가능 하여 그 자식을 찾아가서 비슷한 조건으로 만들어준다.
	public void setPath(HttpServletRequest servlet, String path){
		try{
		this.path=servlet.getServletContext().getRealPath(path);
		}catch(Exception err){
			err.printStackTrace();
		}
	}
	
	public void setMax(int max){
		try{
		this.max=max;
		}catch(Exception err){
			err.printStackTrace();
		}
	}
	
	public void setEncType(String encType){
		try{
		this.encType=encType;
		}catch(Exception err){
			err.printStackTrace();
		}
	}
	
	public void setMulti(HttpServletRequest req){
		try {
			multi = new MultipartRequest(req, path, max, encType, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List getSaveFiles(){
		try{
		List<String> saveFiles = new ArrayList<String>();
		Enumeration em = multi.getFileNames();
		while(em.hasMoreElements()){
		String name = (String)em.nextElement();
		saveFiles.add(multi.getFilesystemName(name));
		}
		return saveFiles;
		}catch(Exception err){
			err.printStackTrace();
		}
		return null;
	}
	
	public String getUpFile(){
		try{
		String result ="";
		Enumeration em = multi.getParameterNames();
		while(em.hasMoreElements()){
			String name = (String)em.nextElement();
		}
			em = multi.getFileNames();
			while(em.hasMoreElements()){
				String name = (String)em.nextElement();
				result = multi.getOriginalFileName(name);
	
			}
			return result;
		}catch(Exception err){
			err.printStackTrace();
		}
		return null;
	}	
}
