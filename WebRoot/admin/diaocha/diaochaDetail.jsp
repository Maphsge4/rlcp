<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        
        <script language="javascript">
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/diaocha?type=diaochajieguoAdd" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/img/wbg.gif" class='title'><span>参与调查</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td align="left">
						        <%=request.getParameter("name") %>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td align="left">
						        <input type="radio" name="daan" value="非常好" style="border: 0" checked="checked"/>非常好
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td align="left">
						        <input type="radio" name="daan" value="很好" style="border: 0"/>很好
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td align="left">
						        <input type="radio" name="daan" value="一般" style="border: 0"/>一般
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						    <td align="left">
						        <input type="radio" name="daan" value="很差" style="border: 0"/>很差
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" height="22">
						     <td align="left">
						       <input type="hidden" name="yuangong_id" value="${sessionScope.yuangong.id }"/>
						       <input type="hidden" name="diaocha_id" value="<%=request.getParameter("id") %>"/>
						       <input type="submit" value="提交"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
