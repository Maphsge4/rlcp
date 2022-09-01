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
           function yuangongDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/yuangong?type=yuangongDel&id="+id;
               }
           }
           function yuangongQuanxian(id)
           {
                   window.location.href="<%=path %>/admin/yuangong/yuangongQuanxian.jsp?id="+id;
           }
           
           function yuangongAdd()
           {
                 var url="<%=path %>/admin/yuangong/yuangongAdd.jsp";
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
				    <td width="5%">编号</td>
					<td width="7%">姓名</td>
					<td width="4%">性别</td>
					<td width="4%">年龄</td>
					
					<td width="7%">电话</td>
					<td width="7%">住址</td>
					<td width="7%">职位</td>
					<td width="7%">工行卡号</td>
					
					<td width="7%">入职时间</td>
					<td width="4%">工龄</td>
					<td width="7%">账号</td>
					<td width="7%">密码</td>
					<td width="9%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.yuangongList}" var="yuangong">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.bianhao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.sex}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yuangong.age}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.tel}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.address}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yuangong.zhiwei}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yuangong.card}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yuangong.ruzhinianfei}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yuangong.gongling}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuangong.loginName}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${yuangong.loginPw}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="yuangongDel(${yuangong.id})" class="pn-loperator">删除</a>
						<a href="#" onclick="yuangongQuanxian(${yuangong.id})" class="pn-loperator">分配账号</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="yuangongAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
