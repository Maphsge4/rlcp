<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<jsp:directive.page import="java.text.SimpleDateFormat"/> 

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
               DWRUtil.addOptions("yuangongId",data,"id","name");
           }
           
           function jixiao()
           {
                document.getElementById("jixiaojiangji").value=0;
                
                var yuangongId=document.formAdd.yuangongId.value;
                if(yuangongId==0)
                {
                    alert("请选择员工");
                    return ;
                }
                var yuefen=document.formAdd.yuefen.value;
                if(yuefen=="")
                {
                    alert("请选择月份");
                    return ;
                }
                
                var url="<%=path %>/jixiao?type=jixiaoChaxunByYuangong_yuefen&yuangongId="+yuangongId+"&yuefen="+yuefen;
                //alert(url);
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
           }
           function check()
           {
                var yuangongId=document.formAdd.yuangongId.value;
                if(yuangongId==0)
                {
                    alert("请选择员工");
                    return false;
                }
                var yuefen=document.formAdd.yuefen.value;
                if(yuefen=="")
                {
                    alert("请输入月份");
                    return false;
                }
               return true;
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/xinchou?type=xinchouAdd" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="100" background="<%=path %>/img/tbg.gif">&nbsp;&nbsp;</td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        员工：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <table border="0">
						           <tr> 
						               <td>  
						                  <select name="yuangongId" id="yuangongId" onclick="yuangongSelect()" style="width: 128px;">
								              <option value="0">请选择员工</option>
								          </select>
						               </td>
						               <td><img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/></td>
						           </tr>
						        </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         月份：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input name="yuefen" type="text" value="<%=new SimpleDateFormat("yyyy-MM").format(new Date()) %>"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        基本工资：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" value="3000" name="jibengongzi" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       岗位工资：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" value="500" name="gangweigongzi" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        车补：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" value="100" name="chebu" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       餐补：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						         <input type="text" value="100" name="canbu" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       业绩奖金：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" value="100" name="yejijiangjin" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        绩效奖金：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" readonly="readonly" value="0" name="jixiaojiangji" id="jixiaojiangji" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						        <input type="button" value="查询该员工的绩效考核奖金" onclick="jixiao()"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
