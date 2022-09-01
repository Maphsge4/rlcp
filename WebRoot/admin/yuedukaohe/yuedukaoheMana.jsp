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
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
		<script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
		
        <script language="javascript">
           function yuedukaoheDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/yuedukaohe?type=yuedukaoheDel&id="+id;
               }
           }
           
           function yuedukaoheAdd()
           {
                 var url="<%=path %>/admin/yuedukaohe/yuedukaoheAdd.jsp";
				 window.location.href=url;
           }
           
           var i=0;
           function yuangongSelect()
           {
               if(i==0)
               {
                   document.getElementById("indicator").style.display="block";
                   loginService.yuangongSelect(callback);
                   i=1;
               }
               
           }
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("yuangongId",data,"id","name");
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="100" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="8%">员工</td>
					<td width="8%">月份</td>
					<td width="8%">专业技术能力</td>
					<td width="8%">综合能力</td>
					<td width="8%">工作主动性</td>
					
					<td width="8%">工作责任感</td>
					<td width="8%">工作纪律性</td>
					<td width="8%">协作性</td>
					<td width="8%">总分数</td>
					<td width="8%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.yuedukaoheList}" var="yuedukaohe">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${yuedukaohe.yuangong_name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuedukaohe.yuefen}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuedukaohe.nenglijishu111}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuedukaohe.nenglizonghe12}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuedukaohe.taiduzhudongxing21}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuedukaohe.taiduzerengan22}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuedukaohe.taidujiluxing23}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuedukaohe.taiduxiezuoxing24}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${yuedukaohe.nengli1+yuedukaohe.taidu2}
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
						<form action="<%=path %>/admin/yuedukaohe/yuedukaoheEditPre.jsp" name="form1" method="post">
						    <input type="button" value="删除" onclick="yuedukaoheDel(${yuedukaohe.id})"/>
						</form>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='88%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="yuedukaoheAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
