<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%@ page language="java" import="com.fredck.FCKeditor.*" %> 
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="FCK" %> 
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
%>
<HTML><HEAD><TITLE>后台操作区</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="<%=path %>FCKeditor/fckeditor.js"></script> 
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>
<script type="text/javascript">
function sub()
{
 
	 
	form1.submit();
}
</script>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		 
		 String content=cb.getString("select content from kf ");
%>
<BODY onload="document.form1.infoContent.value=document.form1.content.value" >
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form name="form1" action="<%=basePath %>ComServlet?method=KF" method="post"  >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
 
	
 
   
  <tr bgcolor='#FFFFFF'> 
    <td colspan="2" valign="top" align=center><TEXTAREA style="display:none" NAME="content" ROWS="20" COLS="70"><%=content %></TEXTAREA>	
	  <FCK:editor id="infoContent" basePath="/qc/FCKeditor/"
              width="550"
              height="400"
              skinPath="/qc/FCKeditor/editor/skins/silver/"
              defaultLanguage="zh-cn"
              tabSpaces="8"
              imageBrowserURL="/qc/FCKeditor/editor/filemanager/browser/default/browser.html?Type=Image&Connector=connectors/jsp/connector"
              linkBrowserURL="/qc/FCKeditor/editor/filemanager/browser/default/browser.html?Connector=connectors/jsp/connector"
              flashBrowserURL="/qc/FCKeditor/editor/filemanager/browser/default/browser.html?Type=Flash&Connector=connectors/jsp/connector"
              imageUploadURL="/qc/FCKeditor/editor/filemanager/upload/simpleuploader?Type=Image"
              linkUploadURL="/qc/FCKeditor/editor/filemanager/upload/simpleuploader?Type=File"
              flashUploadURL="/qc/FCKeditor/editor/filemanager/upload/simpleuploader?Type=Flash">
      </FCK:editor>	
     </td>
    </tr>
  <tr bgcolor='#FFFFFF'> 
      <td colspan="2" align="center"> 
        <input class=mmcinb type='button' name='button' value='提交数据' onclick='sub()'>
      </td>
    </tr>
	
</table></form>
   </TD>
	</TR>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
