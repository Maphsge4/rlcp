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
import com.orm.Tyuedukaohe;
import com.orm.Xinchou;
import com.util.yuangongService;
public class yuedukaohe_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		if(type.endsWith("yuedukaoheMana"))
		{
			yuedukaoheMana(req, res);
		}
		if(type.endsWith("yuedukaoheAdd"))
		{
			yuedukaoheAdd(req, res);
		}
		if(type.endsWith("yuedukaoheDel"))
		{
			yuedukaoheDel(req, res);
		}
		
		
		if(type.endsWith("yuedukaoheMana_yuangong"))
		{
			yuedukaoheMana_yuangong(req, res);
		}
	}
	
	public void yuedukaoheMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{                                                   //月度考核管理
		List yuedukaoheList=new ArrayList();
		String sql="select * from t_yuedukaohe where del='无' order by yuefen";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tyuedukaohe yuedukaohe=new Tyuedukaohe();
				
				yuedukaohe.setId(rs.getInt("id"));
				yuedukaohe.setYuefen(rs.getString("yuefen"));
				yuedukaohe.setYuangong_id(rs.getInt("yuangong_id"));
				yuedukaohe.setNengli1(rs.getInt("nengli1"));
				yuedukaohe.setNenglijishu111(rs.getInt("nenglijishu111"));
				yuedukaohe.setNenglizonghe12(rs.getInt("nenglizonghe12"));
				
				yuedukaohe.setTaidu2(rs.getInt("taidu2"));
				yuedukaohe.setTaiduzhudongxing21(rs.getInt("taiduzhudongxing21"));
				yuedukaohe.setTaiduzerengan22(rs.getInt("taiduzerengan22"));
				yuedukaohe.setTaidujiluxing23(rs.getInt("taidujiluxing23"));
				
				yuedukaohe.setTaiduxiezuoxing24(rs.getInt("taiduxiezuoxing24"));
				
				yuedukaohe.setYuangong_name(yuangongService.getYuangongName(rs.getInt("yuangong_id")));
				yuedukaoheList.add(yuedukaohe);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yuedukaoheList", yuedukaoheList);
		req.getRequestDispatcher("admin/yuedukaohe/yuedukaoheMana.jsp").forward(req, res);
	}

	public void yuedukaoheAdd(HttpServletRequest req,HttpServletResponse res) //月度考核添加
	{         
		String yuefen=req.getParameter("yuefen");
		int yuangong_id=Integer.parseInt(req.getParameter("yuangong_id"));
		int nengli1=Integer.parseInt(req.getParameter("nenglijishu111"))+
		            Integer.parseInt(req.getParameter("nenglizonghe12"));
		int nenglijishu111=Integer.parseInt(req.getParameter("nenglijishu111"));
		int nenglizonghe12=Integer.parseInt(req.getParameter("nenglizonghe12"));
		
		int taidu2=Integer.parseInt(req.getParameter("taiduzhudongxing21"))+
		           Integer.parseInt(req.getParameter("taiduzerengan22"))+
		           Integer.parseInt(req.getParameter("taidujiluxing23"))+
		           Integer.parseInt(req.getParameter("taiduxiezuoxing24"));
		int taiduzhudongxing21=Integer.parseInt(req.getParameter("taiduzhudongxing21"));
		int taiduzerengan22=Integer.parseInt(req.getParameter("taiduzerengan22"));
		int taidujiluxing23=Integer.parseInt(req.getParameter("taidujiluxing23"));
		int taiduxiezuoxing24=Integer.parseInt(req.getParameter("taiduxiezuoxing24"));
		
		
		String del="无";
		
		String sql="insert into t_yuedukaohe(yuefen,yuangong_id,nengli1,nenglijishu111,nenglizonghe12,taidu2,taiduzhudongxing21,taiduzerengan22,taidujiluxing23,taiduxiezuoxing24,del) values(?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params={yuefen,yuangong_id,nengli1,nenglijishu111,nenglizonghe12,taidu2,taiduzhudongxing21,taiduzerengan22,taidujiluxing23,taiduxiezuoxing24,del};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "yuedukaohe?type=yuedukaoheMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	
	public void yuedukaoheDel(HttpServletRequest req,HttpServletResponse res)  //月度考核删除
	{
		String sql="delete from t_yuedukaohe where id="+Integer.parseInt(req.getParameter("id"));
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "yuedukaohe?type=yuedukaoheMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	
	public void diaochaAdd(HttpServletRequest req,HttpServletResponse res)   //调查项目添加
	{
		List yuedukaoheList=new ArrayList();
		String name=req.getParameter("name");
		String shijian=req.getParameter("shijian");
		String del="无";
		DB mydb=new DB();
		try{
		String sql="insert into t_diaocha(name,shijian,del) values(?,?,?)";
		Object[] params={name,shijian,del};
		
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "diaocha?type=diaochaMana");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		mydb.closed();
		
		req.setAttribute("yuedukaoheList", yuedukaoheList);
		try {
			req.getRequestDispatcher("admin/yuedukaohe/yuedukaoheMana.jsp").forward(req, res);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void yuedukaoheMana_yuangong(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{                                           //我的月度考核查询
		List yuedukaoheList=new ArrayList();
		String sql="select * from t_yuedukaohe where del='无' and yuangong_id=? order by yuefen";
		Object[] params={Integer.parseInt(req.getParameter("yuangong_id"))};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tyuedukaohe yuedukaohe=new Tyuedukaohe();
				
				yuedukaohe.setId(rs.getInt("id"));
				yuedukaohe.setYuefen(rs.getString("yuefen"));
				yuedukaohe.setYuangong_id(rs.getInt("yuangong_id"));
				yuedukaohe.setNengli1(rs.getInt("nengli1"));
				yuedukaohe.setNenglijishu111(rs.getInt("nenglijishu111"));
				yuedukaohe.setNenglizonghe12(rs.getInt("nenglizonghe12"));
				
				yuedukaohe.setTaidu2(rs.getInt("taidu2"));
				yuedukaohe.setTaiduzhudongxing21(rs.getInt("taiduzhudongxing21"));
				yuedukaohe.setTaiduzerengan22(rs.getInt("taiduzerengan22"));
				yuedukaohe.setTaidujiluxing23(rs.getInt("taidujiluxing23"));
				
				yuedukaohe.setTaiduxiezuoxing24(rs.getInt("taiduxiezuoxing24"));
				
				yuedukaohe.setYuangong_name(yuangongService.getYuangongName(rs.getInt("yuangong_id")));
				yuedukaoheList.add(yuedukaohe);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("yuedukaoheList", yuedukaoheList);
		req.getRequestDispatcher("admin/yuedukaohe/yuedukaoheMana_yuangong.jsp").forward(req, res);
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
