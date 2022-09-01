<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
           function diaochaDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/diaocha?type=diaochaDel&id="+id;
               }
           }
           
           function diaochaAdd()
           {
                 var url="<%=path %>/admin/diaocha/diaochaAdd.jsp";
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="100" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="33%">调查项目名称</td>
					<td width="33%">发布时间</td>
					<td width="33%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.diaochaList}" var="diaocha">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${diaocha.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${diaocha.shijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<form action="<%=path %>/admin/diaocha/diaochaDetail.jsp" name="f" method="post">
						   <input type="hidden" name="name" value="${diaocha.name}"/>
						   <input type="hidden" name="id" value="${diaocha.id}"/>
						   <input type="submit" value="参与调查"/>
						</form>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
