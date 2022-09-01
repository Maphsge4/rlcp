package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.Yuangong;

public class yuangong_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("yuangongAdd"))
		{
			yuangongAdd(req, res);
		}
		if(type.endsWith("yuangongMana"))
		{
			yuangongMana(req, res);
		}
		if(type.endsWith("yuangongDel"))
		{
			yuangongDel(req, res);
		}
		if(type.endsWith("yuangongEdit"))
		{
			yuangongEdit(req, res);
		}
		if(type.endsWith("yuangongSearch"))
		{
			yuangongSearch(req, res);
		}
		if(type.endsWith("yuangongSearch_bianhao"))
		{
			yuangongSearch_bianhao(req, res);
		}
		if(type.endsWith("yuangongQuanxian"))
		{
			yuangongQuanxian(req, res);
		}
	}
	
	
	
	
	public void yuangongAdd(HttpServletRequest req,HttpServletResponse res)//员工添加
	{
		String bianhao=req.getParameter("bianhao");
		String name=req.getParameter("name");
		String sex=req.getParameter("sex");
		String age=req.getParameter("age");
		String tel=req.getParameter("tel");
		String address=req.getParameter("address");
		String zhiwei=req.getParameter("zhiwei");
		String card=req.getParameter("card");
		int ruzhinianfei=Integer.parseInt(req.getParameter("ruzhinianfei"));
		
		String sql="insert into t_yuangong(bianhao,name,sex,age,tel,address,zhiwei,card,ruzhinianfei,quanxian,loginName,loginPw,del) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params={bianhao,name,sex,age,tel,address,zhiwei,card,ruzhinianfei,0,"","","无"};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void yuangongDel(HttpServletRequest req,HttpServletResponse res)//员工删除
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		String sql="update t_yuangong set del=? where id=?";
		Object[] params={"yes",id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void yuangongMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{                                                //员工管理
		List yuangongList=new ArrayList();
		String sql="select * from t_yuangong where del='无'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Yuangong yuangong=new Yuangong();
				yuangong.setId(rs.getInt("id"));
				yuangong.setBianhao(rs.getString("bianhao"));
				yuangong.setName(rs.getString("name"));
				yuangong.setSex(rs.getString("sex"));
				yuangong.setAge(rs.getString("age"));
				yuangong.setTel(rs.getString("tel"));
				yuangong.setAddress(rs.getString("address"));
				yuangong.setZhiwei(rs.getString("zhiwei"));
				yuangong.setCard(rs.getString("card"));
				yuangong.setRuzhinianfei(rs.getInt("ruzhinianfei"));
				yuangong.setGongling(new Date().getYear()+1900-rs.getInt("ruzhinianfei"));
				yuangong.setQuanxian(rs.getInt("quanxian"));
				yuangong.setLoginName(rs.getString("loginName"));
				yuangong.setLoginPw(rs.getString("loginPw"));
				yuangongList.add(yuangong);
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yuangongList", yuangongList);
		req.getRequestDispatcher("admin/yuangong/yuangongMana.jsp").forward(req, res);
	}
	
	
	public void yuangongEdit(HttpServletRequest req,HttpServletResponse res)    
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		String sex=req.getParameter("sex");
		String age=req.getParameter("age");
		String tel=req.getParameter("tel");
		String address=req.getParameter("address");
		String zhiwei=req.getParameter("zhiwei");
		
		
		String sql="update t_yuangong set name=?,sex=?,age=?,tel=?,address=?,zhiwei=? where id="+id;
		Object[] params={name,sex,age,tel,address,zhiwei};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	
	public void yuangongSearch(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{                                                      //员工查询
		String name=req.getParameter("name");
		List yuangongList=new ArrayList();
		String sql="select * from t_yuangong where del='无' and name like '%"+name.trim()+"%'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Yuangong yuangong=new Yuangong();
				yuangong.setId(rs.getInt("id"));
				yuangong.setBianhao(rs.getString("bianhao"));
				yuangong.setName(rs.getString("name"));
				yuangong.setSex(rs.getString("sex"));
				yuangong.setAge(rs.getString("age"));
				yuangong.setTel(rs.getString("tel"));
				yuangong.setAddress(rs.getString("address"));
				yuangong.setZhiwei(rs.getString("zhiwei"));
				yuangong.setRuzhinianfei(rs.getInt("ruzhinianfei"));
				yuangong.setCard(rs.getString("card"));
				yuangong.setGongling(new Date().getYear()+1900-rs.getInt("ruzhinianfei"));
				yuangong.setQuanxian(rs.getInt("quanxian"));
				yuangong.setLoginName(rs.getString("loginName"));
				yuangong.setLoginPw(rs.getString("loginPw"));
				yuangongList.add(yuangong);
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yuangongList", yuangongList);
		req.getRequestDispatcher("admin/yuangong/yuangongMana.jsp").forward(req, res);
	}
	
	public void yuangongSearch_bianhao(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{                        //员工查询，按编号
		String bianhao=req.getParameter("bianhao");
		List yuangongList=new ArrayList();
		String sql="select * from t_yuangong where del='无' and bianhao like '%"+bianhao.trim()+"%'";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Yuangong yuangong=new Yuangong();
				yuangong.setId(rs.getInt("id"));
				yuangong.setBianhao(rs.getString("bianhao"));
				yuangong.setName(rs.getString("name"));
				yuangong.setSex(rs.getString("sex"));
				yuangong.setAge(rs.getString("age"));
				yuangong.setTel(rs.getString("tel"));
				yuangong.setAddress(rs.getString("address"));
				yuangong.setZhiwei(rs.getString("zhiwei"));
				yuangong.setRuzhinianfei(rs.getInt("ruzhinianfei"));
				yuangong.setCard(rs.getString("card"));
				yuangong.setGongling(new Date().getYear()+1900-rs.getInt("ruzhinianfei"));
				yuangong.setQuanxian(rs.getInt("quanxian"));
				yuangong.setLoginName(rs.getString("loginName"));
				yuangong.setLoginPw(rs.getString("loginPw"));
				yuangongList.add(yuangong);
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yuangongList", yuangongList);
		req.getRequestDispatcher("admin/yuangong/yuangongMana.jsp").forward(req, res);
	}
	
	public void yuangongQuanxian(HttpServletRequest req,HttpServletResponse res)
	{                                   //员工权限，分配账号
		int id=Integer.parseInt(req.getParameter("id"));
		int quanxian=Integer.parseInt(req.getParameter("quanxian"));
		String loginName=req.getParameter("loginName");
		String loginPw=req.getParameter("loginPw");
		
		String sql="update t_yuangong set quanxian=?,loginName=?,loginPw=? where id="+id;
		Object[] params={quanxian,loginName,loginPw};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "yuangong?type=yuangongMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
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
