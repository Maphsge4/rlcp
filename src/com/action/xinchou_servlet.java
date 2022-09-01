package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.TAdmin;
import com.orm.Xinchou;
import com.util.yuangongService;
public class xinchou_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("xinchouMana"))
		{
			xinchouMana(req, res);
		}
		if(type.endsWith("xinchouAdd"))
		{
			xinchouAdd(req, res);
		}
		if(type.endsWith("xinchouDel"))
		{
			xinchouDel(req, res);
		}
		if(type.endsWith("xinchouEdit"))
		{
			xinchouEdit(req, res);
		}
		if(type.endsWith("xinchouMy"))
		{
			xinchouMy(req, res);
		}
	}
	
	public void xinchouAdd(HttpServletRequest req,HttpServletResponse res)//薪酬福利添加
	{
		int yuangongId=Integer.parseInt(req.getParameter("yuangongId"));
		String yuefen=req.getParameter("yuefen");
		int jibengongzi=Integer.parseInt(req.getParameter("jibengongzi"));
		int gangweigongzi=Integer.parseInt(req.getParameter("gangweigongzi"));
		int chebu=Integer.parseInt(req.getParameter("chebu"));
		int canbu=Integer.parseInt(req.getParameter("canbu"));
		int yejijiangjin=Integer.parseInt(req.getParameter("yejijiangjin"));
		int jixiaojiangji=Integer.parseInt(req.getParameter("jixiaojiangji"));
		int xinchouall=jibengongzi+gangweigongzi+chebu+canbu+yejijiangjin+jixiaojiangji;
		int gerenshui=0;
		if(xinchouall>2000)
		{
			gerenshui=(int)(xinchouall*0.2);
		}
		String del="3400";
		
		String sql="insert into t_xinchou(yuangongId,yuefen,jibengongzi,gangweigongzi,chebu,canbu,yejijiangjin,jixiaojiangji,gerenshui,xinchouall,del) values(?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params={yuangongId,yuefen,jibengongzi,gangweigongzi,chebu,canbu,yejijiangjin,jixiaojiangji,gerenshui,xinchouall,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "xinchou?type=xinchouMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void xinchouDel(HttpServletRequest req,HttpServletResponse res)//薪酬福利删除
	{
		String sql="delete from t_xinchou where id="+Integer.parseInt(req.getParameter("id"));
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "xinchou?type=xinchouMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	
	public void xinchouMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{                                                      //薪酬福利管理
		List xinchouList=new ArrayList();
		String sql="select * from t_xinchou where del='3400'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Xinchou xinchou=new Xinchou();
				xinchou.setId(rs.getInt("id"));
				xinchou.setYuangongId(rs.getInt("yuangongId"));
				xinchou.setYuefen(rs.getString("yuefen"));
				xinchou.setJibengongzi(rs.getInt("jibengongzi"));
				xinchou.setGangweigongzi(rs.getInt("gangweigongzi"));
				xinchou.setChebu(rs.getInt("chebu"));
				xinchou.setCanbu(rs.getInt("canbu"));
				xinchou.setYejijiangjin(rs.getInt("yejijiangjin"));
				xinchou.setJixiaojiangji(rs.getInt("jixiaojiangji"));
				xinchou.setXinchouall(rs.getInt("xinchouall"));
				xinchou.setGerenshui(rs.getInt("gerenshui"));
				xinchou.setYuangongName(yuangongService.getYuangongName(rs.getInt("yuangongId")));
				xinchouList.add(xinchou);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("xinchouList", xinchouList);
		req.getRequestDispatcher("admin/xinchou/xinchouMana.jsp").forward(req, res);
	}
	
	
	public void xinchouEdit(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		int yuangongId=Integer.parseInt(req.getParameter("yuangongId"));
		String yuefen=req.getParameter("yuefen");
		int jibengongzi=Integer.parseInt(req.getParameter("jibengongzi"));
		int gangweigongzi=Integer.parseInt(req.getParameter("gangweigongzi"));
		int chebu=Integer.parseInt(req.getParameter("chebu"));
		int canbu=Integer.parseInt(req.getParameter("canbu"));
		int yejijiangjin=Integer.parseInt(req.getParameter("yejijiangjin"));
		int jixiaojiangji=Integer.parseInt(req.getParameter("jixiaojiangji"));
		
		int xinchouall=jibengongzi+gangweigongzi+chebu+canbu+yejijiangjin+jixiaojiangji;
		int gerenshui=0;
		if(xinchouall>2000)
		{
			gerenshui=(int)(xinchouall*0.2);
		}
		
		String sql="update t_xinchou set yuangongId=?,yuefen=?,jibengongzi=?," +
				                         "gangweigongzi=?,chebu=?,canbu=?," +
				                         "yejijiangjin=?,jixiaojiangji=?,gerenshui=?,xinchouall=? where id="+id;
		Object[] params={yuangongId,yuefen,jibengongzi,gangweigongzi,chebu,canbu,yejijiangjin,jixiaojiangji,gerenshui,xinchouall};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "xinchou?type=xinchouMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void xinchouMy(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{                                                             //我的薪酬福利查询
		List xinchouList=new ArrayList();
		String sql="select * from t_xinchou where del='3400' and yuangongId="+Integer.parseInt(req.getParameter("yuangongId"));
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Xinchou xinchou=new Xinchou();
				xinchou.setId(rs.getInt("id"));
				xinchou.setYuangongId(rs.getInt("yuangongId"));
				xinchou.setYuefen(rs.getString("yuefen"));
				xinchou.setJibengongzi(rs.getInt("jibengongzi"));
				xinchou.setGangweigongzi(rs.getInt("gangweigongzi"));
				xinchou.setChebu(rs.getInt("chebu"));
				xinchou.setCanbu(rs.getInt("canbu"));
				xinchou.setYejijiangjin(rs.getInt("yejijiangjin"));
				xinchou.setJixiaojiangji(rs.getInt("jixiaojiangji"));
				xinchou.setXinchouall(rs.getInt("xinchouall"));
				xinchou.setGerenshui(rs.getInt("gerenshui"));
				xinchou.setYuangongName(yuangongService.getYuangongName(rs.getInt("yuangongId")));
				xinchouList.add(xinchou);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("xinchouList", xinchouList);
		req.getRequestDispatcher("admin/xinchou/xinchouMy.jsp").forward(req, res);
	}
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response) 
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try 
		{
		    dispatch.forward(request, response);
		    return;
		} 
		catch (ServletException e) 
		{
                    e.printStackTrace();
		} 
		catch (IOException e) 
		{
			
		    e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}
	
	public void destroy() 
	{
		
	}
}
