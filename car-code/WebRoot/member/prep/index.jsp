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
		List pagelist3=tb.getMemberPrep(member);
%>
<BODY >
<TABLE  cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top >
    <form action="<%=basePath %>HzpAction.do?method=scdDan" method="post" name="pageform">
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
     <tr class="head"> 
      <td width="10%" align="center">购车编号</td>
      <td  align="center">汽车名称</td>
      <td  align="center">价格（元）</td>
      <td  align="center">VIP价格（元）</td>
      <td  align="center">购买数量</td>
      <td  align="center">总价格（元）</td>
      <td  align="center">修改</td>
      <td  align="center">删除</td>
      <td  align="center">选择</td>
    </tr>
    <script type="text/JavaScript">
	function allch()
	{
		for(i=0;i<<%=pagelist3.size()%>;i++)
		{
			document.pageform.checkit(i).checked=document.pageform.checkall.checked;
		}
	}
	</script>
    <%
    		String str="普通会员";int num=tb.getNum(member);if(num>=500)str="VIP会员";
			
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
			%> 
	<tr  class="trA" onMouseOver="this.className='trB'" onMouseOut="this.className='trA'"> 
      <td width='10%' align="center" style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(4).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath %>hinfo.jsp?id=<%=pagelist2.get(5).toString()%>" target="_blank"><%=pagelist2.get(1).toString() %></a> </td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(2).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(3).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><%=pagelist2.get(6).toString() %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <%if(str.equals("VIP会员")){out.println(Float.parseFloat(pagelist2.get(3).toString())*Integer.parseInt(pagelist2.get(6).toString()));}else{out.println(Float.parseFloat(pagelist2.get(2).toString())*Integer.parseInt(pagelist2.get(6).toString()));} %></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;">
      <a href="<%=basePath %>member/prep/up.jsp?id=<%=pagelist2.get(4).toString()%>&num=<%=pagelist2.get(6).toString()%>&sid=<%=pagelist2.get(0).toString()%>&snum=<%=pagelist2.get(9).toString()%>">修改</a></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><a href="<%=basePath %>HzpAction.do?method=memberdelPrep&id=<%=pagelist2.get(4).toString()%>">删除</a></td>
      <td align="center" bgcolor="#FFFFFF"  style="border-bottom:1px dotted #ccc;"><input type="checkbox" name="checkit" value="<%=pagelist2.get(4).toString()%>"></td>
    </tr>
	
<%
	}} 
%>  
<TR align="right" >
			 <TD colspan="10" id=map>
			 <input type="checkbox" name="checkall" onClick="allch()" >&nbsp;全选&nbsp;&nbsp;&nbsp;&nbsp;
			 </TD>
			 </TR>
	 </TABLE></form>
	</td>
	</tr>
  </TBODY>
</TABLE>
<TABLE  align="center" vAlign=top width="100%" border=0 align="center" cellPadding=3 cellSpacing=1>
		     <TBODY>
		     <TR align="center"  >
			 <TD >
			 支付方式：
			 </TD>
			 </TR>
		     <TR align="center"  >
			 <TD >
			 <input type=radio name=bank checked> <img src="<%=basePath %>bank/1a.jpg" width=100 height=30 border=0>
			 <input type=radio name=bank> <img src="<%=basePath %>bank/2a.jpg" width=100 height=30 border=0>
			 <input type=radio name=bank> <img src="<%=basePath %>bank/3a.jpg" width=100 height=30 border=0>
			 <input type=radio name=bank> <img src="<%=basePath %>bank/4a.jpg" width=100 height=30 border=0>
			 </TD>
			 </TR>
			 <TR align="center"  >
			 <TD >
			 <input type=radio name=bank> <img src="<%=basePath %>bank/5a.jpg" width=100 height=30 border=0>
			 <input type=radio name=bank> <img src="<%=basePath %>bank/6a.jpg" width=100 height=30 border=0>
			 <input type=radio name=bank> <img src="<%=basePath %>bank/7a.jpg" width=100 height=30 border=0>
			 <input type=radio name=bank> <img src="<%=basePath %>bank/8a.jpg" width=100 height=30 border=0>
			 </TD>
			 </TR>
			 </TBODY>
			 </TABLE>
<TABLE  align="center" vAlign=top width="100%" border=0 align="center" cellPadding=3 cellSpacing=1>
		     <TBODY>
		     <TR align="center"  >
			 <TD >
			 <input type="button" name="button" value="提交订单并在线支付" onClick="del()" >
			 </TD>
			 </TR>
			 </TBODY>
			 </TABLE>
<p align=center><font color=red><strong>尊敬的会员：<%=member %> 您的身份：<%=str %>，购物享受<%=str%>价格</strong></font>
</BODY>
<%} %>
</HTML>
