package com.util;

import java.sql.ResultSet;

import com.dao.DB;

public class yuangongService
{
	public static String getYuangongName(int yuangongId)
	{
		String yuangongName="";
		DB mydb=new DB();
		try
		{
			String sql="select * from  t_yuangong where id="+yuangongId;
			Object[] params={};
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			rs.next();
			yuangongName=rs.getString("name");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return yuangongName;
	}
}