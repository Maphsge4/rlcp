<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<STYLE type=text/css> 
		{
			FONT-SIZE: 12px
		}
		#menuTree A {
			COLOR: #566984; TEXT-DECORATION: none
		}
		</STYLE>

		<SCRIPT src="<%=path%>/js/TreeNode.js" type=text/javascript></SCRIPT>
		<SCRIPT src="<%=path%>/js/Tree.js" type=text/javascript></SCRIPT>
	</head>

	<BODY style="BACKGROUND-POSITION-Y: -120px;  BACKGROUND-REPEAT: repeat-x" topmargin="5">
		<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%">
				<TR>
					<TD width=10 height=29>
						<IMG src="<%=path %>/img/bg_left_tl.gif">
					</TD>
					<TD
						style="FONT-SIZE: 18px; BACKGROUND-IMAGE: url(<%=path %>/img/bg_left_tc.gif); COLOR: white; FONT-FAMILY: system">
						Main Menu
					</TD>
					<TD width=10>
						<IMG src="<%=path %>/img/bg_left_tr.gif">
					</TD>
				</TR>
				<TR>
					<TD style="BACKGROUND-IMAGE: url(<%=path %>/img/bg_left_ls.gif)"></TD>
					<TD id=menuTree
						style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; HEIGHT: 100%; BACKGROUND-COLOR: white"
						vAlign=top></TD>
					<TD style="BACKGROUND-IMAGE: url(<%=path %>/img/bg_left_rs.gif)"></TD>
				</TR>
		</TABLE>
		<SCRIPT type=text/javascript>
            var tree = null;
	            var root = new TreeNode('系统菜单');
	            
	            <c:if test="${sessionScope.userType==0}">
	            var fun2 = new TreeNode('修改个人密码');
	            var fun21 = new TreeNode('修改个人密码', '<%=path %>/admin/userinfo/userPw.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun2.add(fun21);
	            root.add(fun2);
	            
	            
	            
	            var fun4 = new TreeNode('员工信息管理');
	            var fun41 = new TreeNode('员工信息管理', '<%=path %>/yuangong?type=yuangongMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun42 = new TreeNode('员工信息添加', '<%=path %>/admin/yuangong/yuangongAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun43 = new TreeNode('员工信息查询', '<%=path %>/admin/yuangong/yuangongSearch.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun4.add(fun41);
	            fun4.add(fun42);
	            fun4.add(fun43); 
	            root.add(fun4);
	            
	            
	            var fun5 = new TreeNode('绩效考核管理');
	            var fun51 = new TreeNode('绩效考核管理', '<%=path %>/jixiao?type=jixiaoMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun52 = new TreeNode('绩效考核添加', '<%=path %>/admin/jixiao/jixiaoAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun5.add(fun51);
	            fun5.add(fun52);
	            root.add(fun5);
	            
	            
	            var fun6 = new TreeNode('薪酬福利管理');
	            var fun61 = new TreeNode('薪酬福利管理', '<%=path %>/xinchou?type=xinchouMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun62 = new TreeNode('薪酬福利添加', '<%=path %>/admin/xinchou/xinchouAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun6.add(fun61);
	            fun6.add(fun62);
	            root.add(fun6);
	            
	            
	            var fun7 = new TreeNode('调查项目管理');
	            var fun71 = new TreeNode('调查项目管理', '<%=path %>/diaocha?type=diaochaMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun72 = new TreeNode('调查项目添加', '<%=path %>/admin/diaocha/diaochaAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun7.add(fun71);
	            fun7.add(fun72);
	            root.add(fun7);
	            
	            var fun8 = new TreeNode('月度考核管理');
	            var fun81 = new TreeNode('月度考核管理', '<%=path %>/yuedukaohe?type=yuedukaoheMana', 'tree_node.gif', null, 'tree_node.gif', null);
	            var fun82 = new TreeNode('月度考核添加', '<%=path %>/admin/yuedukaohe/yuedukaoheAdd.jsp', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun8.add(fun81);
	            fun8.add(fun82);
	            root.add(fun8);
	            </c:if>
	            
	            <c:if test="${sessionScope.userType==1}">
	            var fun100 = new TreeNode('我的薪酬查询');
	            var fun1001 = new TreeNode('我的薪酬查询', '<%=path %>/xinchou?type=xinchouMy&yuangongId=${sessionScope.yuangong.id}', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun100.add(fun1001);
	            root.add(fun100);
	            
	            var fun7 = new TreeNode('参与公司调查');
	            var fun71 = new TreeNode('参与公司调查', '<%=path %>/diaocha?type=diaochaAll', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun7.add(fun71);
	            root.add(fun7);
	            
	            
	            var fun8 = new TreeNode('我的月度考核');
	            var fun81 = new TreeNode('我的月度考核', '<%=path %>/yuedukaohe?type=yuedukaoheMana_yuangong&yuangong_id=${sessionScope.yuangong.id}', 'tree_node.gif', null, 'tree_node.gif', null);
	            fun8.add(fun81);
	            root.add(fun8);
	            </c:if>
	            tree = new Tree(root);
	            tree.show('menuTree')
        </SCRIPT>
	</BODY>
</html>
