package com.util;

import java.sql.ResultSet;

import com.dao.DB;

public class jixiaoService
{
	public static boolean shifoulurujixiao(int yuangongId,String yuefen)
	{
		boolean b=false;
		DB mydb=new DB();
		try
		{
			String sql="select * from t_jixiao where jixiao_yuangong_id=? and jixiao_yufen=? and del='no'";
			Object[] params={yuangongId,yuefen};
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			boolean dd=rs.next();
			if(dd==true)
			{
				b=true;
			}
			if(dd==false)
			{
				b=false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return b;
	}
	
	
	public static int getJixiaoJiangji(int yuangongId,String yuefen)
	{
		int jixiaojiangjing=0;
		DB mydb=new DB();
		try
		{
			String sql="select * from t_jixiao where jixiao_yuangong_id=? and jixiao_yufen=? and del='no'";
			Object[] params={yuangongId,yuefen};
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			jixiaojiangjing=rs.getInt("jixiao_jiangjin");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return jixiaojiangjing;
	}
}