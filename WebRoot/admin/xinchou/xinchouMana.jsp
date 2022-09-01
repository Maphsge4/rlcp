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
           function xinchouDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/xinchou?type=xinchouDel&id="+id;
               }
           }
           
           function xinchouAdd()
           {
                 var url="<%=path %>/admin/xinchou/xinchouAdd.jsp";
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
	        <%--<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			        <form action="<%=path %>/xinchou?type=xinchouSearch" name="formSearch" method="post">
			               <select name="yuangongId" id="yuangongId" onclick="yuangongSelect()">
				               <option value="0">请选择员工</option>
				           </select>
				           <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
				             月份：
				           <input name="yuefen" readonly="readonly" class="Wdate"  type="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM'})"/>
			           <input type="submit" value="查询"/>
			        </form>
			    </td>
			  </tr>
		    </table>--%>
	        
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="100" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="8%">员工</td>
					<td width="8%">月份</td>
					<td width="8%">基本工资</td>
					<td width="8%">岗位工资</td>
					
					<td width="8%">车补</td>
					<td width="8%">餐补</td>
					<td width="8%">公司业绩奖金</td>
					<td width="8%">绩效奖金</td>
					
					<td width="8%">总工资</td>
					<td width="8%">扣除个人所得税</td>
					<td width="8%">实发工资</td>
					<td width="5%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.xinchouList}" var="xinchou">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${xinchou.yuangongName}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xinchou.yuefen}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xinchou.jibengongzi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xinchou.gangweigongzi}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xinchou.chebu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xinchou.canbu}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xinchou.yejijiangjin}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xinchou.jixiaojiangji}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xinchou.xinchouall}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xinchou.gerenshui}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${xinchou.xinchouall-xinchou.gerenshui}
					</td>
					
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="xinchouDel(${xinchou.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table width='88%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="xinchouAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
