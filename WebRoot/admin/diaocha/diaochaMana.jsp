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
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
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
           
            function diaochajieguoMana(id)
		    {
		        var url="<%=path %>/diaocha?type=diaochajieguoMana&diaocha_id="+id;
		        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:500,height:300});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","");
	            pop.build();
	            pop.show();
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
						<input type="button" value="删除" onclick="diaochaDel(${diaocha.id})"/>
						<input type="button" value="查看调查结果" onclick="diaochajieguoMana(${diaocha.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="diaochaAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
