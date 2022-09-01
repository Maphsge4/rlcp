<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
	<script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
	<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
	<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
	<script language="javascript">
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
               DWRUtil.addOptions("yuangong_id",data,"id","name");
           }
           
           
           function check1()
           {
               if(document.formAdd.yuangong_id.value==0)
               {
                   alert("请选择员工");
                   return false;
               }
               if(document.formAdd.yuefen.value=="")
               {
                   alert("请输入月份");
                   return false;
               }
               document.formAdd.submit();
           }
        </script>
  </head>
  
  <body>
       <form action="<%=path %>/yuedukaohe?type=yuedukaoheAdd" name="formAdd" method="post">
		   <fieldset style="width:600px; margin-left:20px;"><legend class="fieldtitle">基本信息</legend>
		    <table class="bill" width="97%">   
		        <tr>
				    <td width="100">
			            员工：&nbsp;&nbsp;
			        </td>
				    <td width="500" align="left">
				        <table border="0">
				           <tr> 
				               <td>  
				                  <select name="yuangong_id" id="yuangong_id" onclick="yuangongSelect()">
						              <option value="0">请选择员工</option>
						          </select>
				               </td>
				               <td><img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/></td>
				           </tr>
				        </table>
				    </td>
				</tr>
				<tr>
				    <td width="100">
			            考核月份：&nbsp;&nbsp;
			        </td>
				    <td width="500" align="left">
				        <input name="yuefen" readonly="readonly" class="Wdate"  type="text" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM'})"/>
				    </td>
				</tr>
		    </table>
		   </fieldset>
           <fieldset style="width:600px; margin-left:20px;"><legend class="fieldtitle">工作能力</legend>
			<table class="bill" width="97%">
			    <tr>
			       <td width="100">
			            专业技术能力：&nbsp;&nbsp;
			       </td>
			       <td width="500" align="left">
			          <select name="nenglijishu111" style="width: 80px;">
			             <option value="10">10分</option>
			             <option value="8">8分</option>
			             <option value="7">7分</option>
			             <option value="6">6分</option>
			             <option value="4">4分</option>
			          </select>
			       </td>
			    </tr>
			    <tr>
			       <td width="100">
			            综合能力：&nbsp;&nbsp;
			       </td>
			       <td width="500" align="left">
			          <select name="nenglizonghe12" style="width: 80px;">
			             <option value="10">10分</option>
			             <option value="8">8分</option>
			             <option value="7">7分</option>
			             <option value="6">6分</option>
			             <option value="4">4分</option>
			          </select>
			       </td>
			    </tr>
			</table>
		</fieldset>
		
		
		<fieldset style="width:600px; margin-left:20px;"><legend class="fieldtitle">工作能力</legend>
			<table class="bill" width="97%">
			    <tr>
			       <td width="100">
			            工作主动性：&nbsp;&nbsp;
			       </td>
			       <td width="500" align="left">
			          <select name="taiduzhudongxing21" style="width: 80px;">
			             <option value="10">10分</option>
			             <option value="8">8分</option>
			             <option value="7">7分</option>
			             <option value="6">6分</option>
			             <option value="4">4分</option>
			          </select>
			       </td>
			    </tr>
			    <tr>
			       <td width="100">
			            工作责任感：&nbsp;&nbsp;
			       </td>
			       <td width="500" align="left">
			          <select name="taiduzerengan22" style="width: 80px;">
			             <option value="10">10分</option>
			             <option value="8">8分</option>
			             <option value="7">7分</option>
			             <option value="6">6分</option>
			             <option value="4">4分</option>
			          </select>
			       </td>
			    </tr>
			    <tr>
			       <td width="100">
			            工作纪律性：&nbsp;&nbsp;
			       </td>
			       <td width="500" align="left">
			          <select name="taidujiluxing23" style="width: 80px;">
			             <option value="10">10分</option>
			             <option value="8">8分</option>
			             <option value="7">7分</option>
			             <option value="6">6分</option>
			             <option value="4">4分</option>
			          </select>
			       </td>
			    </tr>
			    <tr>
			       <td width="100">
			            协作性：&nbsp;&nbsp;
			       </td>
			       <td width="500" align="left">
			          <select name="taiduxiezuoxing24" style="width: 80px;">
			             <option value="10">10分</option>
			             <option value="8">8分</option>
			             <option value="7">7分</option>
			             <option value="6">6分</option>
			             <option value="4">4分</option>
			          </select>
			       </td>
			    </tr>
			</table>
		</fieldset>
		<input type="button" value="提交" onclick="return check1()"/>&nbsp; 
       </form>
  </body>
</html>
