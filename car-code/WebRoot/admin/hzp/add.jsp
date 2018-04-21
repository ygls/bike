<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<%@ page language="java" import="com.fredck.FCKeditor.*" %> 
<%@ taglib uri="/WEB-INF/FCKeditor.tld" prefix="FCK" %> 
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="tb" scope="page" class="com.bean.HzpBean" />
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
	if(document.form1.title.value.replace(/\s+$|^\s+/g,"").length<=0||document.form1.type.value=="请选择"
	||document.form1.pic.value.replace(/\s+$|^\s+/g,"").length<=0||document.form1.co.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.time.value.replace(/\s+$|^\s+/g,"").length<=0||document.form1.price.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.vipprice.value.replace(/\s+$|^\s+/g,"").length<=0||document.form1.num.value.replace(/\s+$|^\s+/g,"").length<=0
	||document.form1.sl.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("所有项目必须填写！");
		return false;
	}
	if(document.form1.pic.value.replace(/\s+$|^\s+/g,"").length>0)
	{
		var fileext=form1.pic.value.substring(form1.pic.value.length-4,form1.pic.value.length); 
		fileext=fileext.toLowerCase(); 
		if(!(fileext=='.jpg')&&!(fileext=='.gif')) 
		{
			alert("对不起，文件格式不对,必须为jpg或gif格式文件!"); 
			form1.pic.focus(); 
			return false; 
		} 
	}
	 
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
		String method=request.getParameter("method");
		if(method==null){
			method="addlvyou";
		}
		String title = "";	
		String type="请选择";
		String co="";
		String time="";
		String price="";
		String vipprice="";
		String content="";String num="";String sl="";String flag="新车上市";
		String id="";
		String s="如无缩略图请保持为空";
		if(method.equals("uplvyou")){
			id=request.getParameter("id").trim();
			List newsList=tb.getOneTrave(Integer.parseInt(id));
			title=newsList.get(1).toString();
			type=newsList.get(2).toString();
			co=newsList.get(4).toString();			
			time=newsList.get(5).toString();
			price=newsList.get(6).toString();
			vipprice=newsList.get(7).toString();
			content=newsList.get(8).toString();	flag=newsList.get(10).toString();	num=newsList.get(11).toString();sl=newsList.get(12).toString();
		}		

%>
<BODY onload="document.form1.infoContent.value=document.form1.content.value" >
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><form name="form1" action="<%=basePath %>News.do" method="post"  enctype="multipart/form-data" >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
 
	
  <tr bgcolor='#FFFFFF'> <input type="hidden" name="method" value="<%=method %>"> <input type="hidden" name="id" value="<%=id %>">
    <td width='30%'><div align="right">信息标题：</div></td>
    <td ><input name="title" type="text" id="title" size="40" maxlength="100" value="<%=title %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">所属分类：</div></td>
    <td ><select name="type" >
    <option value="<%=type %>"><%=type %></option>
    <%
    	List pagelist3=tb.getType();
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
     %>
     <option value="<%=pagelist2.get(1).toString() %>"><%=pagelist2.get(1).toString() %></option>
     <%}}%>
    </select></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">缩&nbsp;略&nbsp;图：</div></td>
    <td ><input name="pic" type="file"   size="40" maxlength="150" >&nbsp;<font color=red>300K以下gif或jpg格式图片<%=s %></font></td>
  </tr>
  <tr bgcolor='#FFFFFF'>  
    <td width='30%'><div align="right">制造商：</div></td>
    <td ><input name="co" type="text" id="co" size="40" maxlength="100" value="<%=co %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">新旧程度：</div></td>
    <td ><input name="time" type="text" id="time" size="40" maxlength="100" value="<%=time %>"></td>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">会员价格：</div></td>
    <td ><input name="price" type="text" id="price" size="15" maxlength="100" value="<%=price %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元 </TD>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">VIP价格：</div></td>
    <td ><input name="vipprice" type="text" id="vipprice" size="15" maxlength="100" value="<%=vipprice %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> 元 </TD>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">购买积分：</div></td>
    <td ><input name="num" type="text" id="num" size="15" maxlength="100" value="<%=num %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}">  </TD>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">汽车数量：</div></td>
    <td ><input name="sl" type="text" id="sl" size="15" maxlength="100" value="<%=sl %>" onkeyup="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}">  </TD>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td width='30%'><div align="right">发布类型：</div></td>
    <td ><select name=flag>
    <option value=<%=flag %>><%=flag %></option>
    <option value=新车上市>新车上市</option>
    <option value=畅销汽车>畅销汽车</option>
    </select> </TD>
  </tr>
  <tr bgcolor='#FFFFFF'> 
    <td colspan="2" valign="top" align=center><TEXTAREA style="display:none" NAME="content" ROWS="20" COLS="70"><%=content %></TEXTAREA>	
	  <FCK:editor id="infoContent" basePath="/esc/FCKeditor/"
              width="550"
              height="400"
              skinPath="/esc/FCKeditor/editor/skins/silver/"
              defaultLanguage="zh-cn"
              tabSpaces="8"
              imageBrowserURL="/esc/FCKeditor/editor/filemanager/browser/default/browser.html?Type=Image&Connector=connectors/jsp/connector"
              linkBrowserURL="/esc/FCKeditor/editor/filemanager/browser/default/browser.html?Connector=connectors/jsp/connector"
              flashBrowserURL="/esc/FCKeditor/editor/filemanager/browser/default/browser.html?Type=Flash&Connector=connectors/jsp/connector"
              imageUploadURL="/esc/FCKeditor/editor/filemanager/upload/simpleuploader?Type=Image"
              linkUploadURL="/esc/FCKeditor/editor/filemanager/upload/simpleuploader?Type=File"
              flashUploadURL="/esc/FCKeditor/editor/filemanager/upload/simpleuploader?Type=Flash">
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
