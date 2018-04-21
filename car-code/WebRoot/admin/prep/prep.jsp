<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
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
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>

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
		
%>
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 
background=<%=basePath %><%=dir %>/images/MainBg.gif topMargin=0 scroll=yes 
marginheight="0" marginwidth="0">
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="15%" align="center">序号</td>
      <td width="35%" align="center">订单编号</td>
      <td  align="center">提交时间</td>
      <td  align="center">购买会员</td>
      <td  align="center">目前状态</td>
      <td  align="center">查看订单详细信息</td>
      <td  align="center">发货</td>
      <td  align="center">删除</td>
    </tr>
    <%
			List pagelist3=tb.getPost("未发货");
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
	  <td align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
      <td align="center" style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(1).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(2).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(4).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <a href="<%=basePath %>admin/prep/info.jsp?dnum=<%=pagelist2.get(1).toString()%>">查看订单详细信息</a></td>
       <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <a href="<%=basePath %>HzpAction.do?method=sendB&dnum=<%=pagelist2.get(1).toString()%>&member=<%=pagelist2.get(4).toString()%>">发货</a></td>
       <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <a href="<%=basePath %>HzpAction.do?method=admindelPrep2&dnum=<%=pagelist2.get(1).toString()%>">删除</a></td>
    </tr>
	
<%
	}}
%>  
	 </TABLE>
	</td>
	</tr>
  </TBODY>
</TABLE>
</BODY>
<%} %>
</HTML>
