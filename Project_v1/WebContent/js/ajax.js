/**
*	ajax 모듈 파일
*/

var httpRequest = null;

function getXMLHttpRequest(){
	if(window.ActiveXObject){
		try{
			return new ActiveXObject("MSXML2.XMLHTTP");
		}catch(e){
			return new ActiveXObject("Microsoft.XMLHTTTP");
		}
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else{
		return null;
	}	
}

function sendRequest(url, param, callback, method){
	httpRequest = getXMLHttpRequest();
	var httpMethod = (method!=null) ? method : "GET";
	if(httpMethod !="GET"&&httpMethod !="POST"){
		httpMethod="GET";
	}
	
	var httpParams = (param==null||param=="") ? null : param;
	var httpURL = url;
	if(httpMethod=="GET"&& httpParams !=null){
		httpURL = httpURL+"?"+httpParams;
	}
	httpRequest.open(httpMethod, httpURL, true);
	httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");//post방식일 경우
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod=="POST" ? httpParams : null);
}
