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
           function jixiaoDel(jixiao_id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/jixiao?type=jixiaoDel&jixiao_id="+jixiao_id;
               }
           }
           
           function jixiaoAdd()
           {
                 var url="<%=path %>/admin/jixiao/jixiaoAdd.jsp";
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
					<td width="20%">考核月份</td>
					<td width="20%">员工</td>
					<td width="20%">迟到次数</td>
					<td width="20%">绩效奖金</td>
					<td width="20%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.jixiaoList}" var="jixiao">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${jixiao.jixiao_yufen}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${jixiao.jixiao_yuangong_Name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${jixiao.jixiao_yaungong_chidao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${jixiao.jixiao_jiangjin}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="jixiaoDel(${jixiao.jixiao_id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="jixiaoAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
