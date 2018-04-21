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
<script type="text/javascript">
function del()
{
	pageform.submit();
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
	String member=(String)session.getAttribute("member");
	if(member==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String dnum=request.getParameter("dnum");
%>
<BODY>

  <p align=center><font color=red><strong>订单编号为<%=dnum %>的汽车信息</strong></font>
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="15%" align="center">序号</td>
      <td  align="center">汽车名称</td>
      <td  align="center">汽车价格</td>
      <td  align="center">购买数量</td>
      <td  align="center">总价格</td>
    </tr>
<%		List pagelist3=tb.getPostInfo(dnum,member);
		float sum=0;
    		if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
					String p=pagelist2.get(2).toString();
					int num=tb.getNum(member);if(num>=500)p=pagelist2.get(3).toString();
					float f=Integer.parseInt(pagelist2.get(5).toString())*Float.parseFloat(p);
					sum+=f;
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
	  <td align="center" style="border-bottom:1px dotted #ccc;"><%=i+1 %></td>
      <td align="center" style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(1).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=p %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(5).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=f %></td>
    </tr>
	
<%}}%>  
    <tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
 	  <td align="right" style="border-bottom:1px dotted #ccc;" colspan=5>本订单总购物金额为：<%=sum %> 元</td>
    </tr>
 
</TABLE>
 
 
</BODY>
<%} %>
</HTML>
