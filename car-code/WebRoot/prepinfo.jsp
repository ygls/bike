<%@ page language="java" import="java.util.*,com.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<LINK href="images/default.css" type=text/css rel=stylesheet>
<LINK href="images/css.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css>
.ycbt {
	BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-COLOR: #EAF2EF; BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px
}
.xsbt {
	BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-IMAGE: url(images/head1.gif); BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px
}
.xsnr {
	DISPLAY: block
}
.ycnr {
	DISPLAY: none
}
</STYLE>
<SCRIPT type=text/javascript>
function tb_xs(t,m,n){
for(var i=1;i<=m;i++){
if (i != n){
document.getElementById("tb"+t+ "_bt" + i).className= "ycbt";
document.getElementById("tb"+t+ "_nr" + i).className= "ycnr";}
else{
document.getElementById("tb"+t+ "_bt" + i).className= "xsbt";
document.getElementById("tb"+t+ "_nr" + i).className= "xsnr";}}}
</SCRIPT>
<SCRIPT language=JavaScript>
<!--//屏蔽出错代码
function killErr(){
	return true;
}
window.onerror=killErr;
//-->
</SCRIPT>
<SCRIPT language=JavaScript>
<!--//处理大分类一行两个小分类
function autoTable(div){
	fs=document.getElementById(div).getElementsByTagName("TABLE");
	for(var i=0;i<fs.length;i++){
		fs[i].style.width='49.5%';
		if(i%2==1){
			if (document.all) {
				fs[i].style.styleFloat="right";
			}else{
				fs[i].style.cssFloat="right;";
			}
		}else{
			if (document.all) {
				fs[i].style.styleFloat="left";
			}else{
				fs[i].style.cssFloat="left;";
			}
		}
	}
}
//-->
</SCRIPT>
<SCRIPT language=JavaScript src="images/inc.js"></SCRIPT>
<SCRIPT language=JavaScript src="images/default.js"></SCRIPT>
<SCRIPT language=JavaScript src="images/swfobject.js"></SCRIPT>
<META content="MSHTML 6.00.2900.3268" name=GENERATOR>
</HEAD>
<script type="text/javascript">
function f1()
{
 	if(document.form1.num.value=="")
 	{
 		alert("请填写购买数量！");
 		document.form1.num.focus();
 		return false;
 	}
 	if(isNaN(document.form1.num.value))
 	{
 		alert("购买数量只能为数字！");
 		document.form1.num.focus();
 		return false;
 	}
 	if (eval(form1.num.value) > eval(form1.sl.value))
 	{
 		alert("购买数量超过存货数量！");
 		document.form1.num.focus();
 		return false;
 	}
 form1.submit();
}
</script>
<%String member=(String)session.getAttribute("member"); 
if(member==null){response.sendRedirect("login.jsp");}else{ %>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
<SCRIPT language=JavaScript>
<!--//目的是为了做风格方便
document.write('<div class="wrap">');
//-->
</SCRIPT>
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head >
			<SPAN class=TAG>加入购物车</SPAN> 
			
		  </TD>
		</TR>
		<TR>
		<TD  class=middle align="center" >
		<form action="<%=basePath %>HzpAction.do?method=addprep" method="post" name="form1" >
         <TABLE   cellSpacing=0 cellPadding=0 width="100%" border=0>
         <TBODY>
                    
        <TR>
          <TD width=45% align=right>二手车名称：</TD><TD align=left><%=Common.toChineseAndTrim(request.getParameter("title")) %></TD>
		</TR>
		<TR>
          <TD width=45% align=right>存货数量：</TD><TD align=left><input type=text name=sl size="15" readonly value="<%=request.getParameter("sl")%>"></TD>
		</TR>
		<TR>
          <TD  align=right>购买数量：<input type=hidden name=sid value=<%=request.getParameter("id")%>></TD>
          <TD align=left><input type=text name=num size=15 ></TD>
		</TR>
		<TR>
          <TD  align=center colspan=2><br><input type=button onclick="f1()" value="提交数据"></TD>
		</TR>
				</TBODY>
			</TABLE>
			</form>			
			</TD>
		</TR>
        </TBODY>
	  </TABLE>

<SCRIPT language=JavaScript>
<!--//目的是为了做风格方便
document.write('</div>');
//-->
</SCRIPT>
<SCRIPT language=JavaScript>
<!--
clickEdit.init();
//-->
</SCRIPT>
</BODY>
<%} %>
</HTML>

<%@ include file="iframe/foot.jsp"%>