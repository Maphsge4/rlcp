package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB
{
	private Connection con;

	private PreparedStatement pstm;

	private String user = "maphsge7";//数据库的连接名

	private String password = "myroot@123";//数据库的连接密码

	private String className = "com.mysql.cj.jdbc.Driver";

	private String url = "jdbc:mysql://rm-2ze4l01u0xqle8drn6o.mysql.rds.aliyuncs.com:3306/test";

	public DB()
	{
		try
		{
			Class.forName(className);
		} catch (ClassNotFoundException e)
		{
			System.out.println("加载数据库驱动失败！");
			e.printStackTrace();
		}
	}

	/** 创建数据库连接 */
	public Connection getCon()
	{
		try
		{
			con = DriverManager.getConnection(url, user, password);
			System.out.println("创建数据库连接成功！");
		} catch (SQLException e)
		{
			System.out.println("创建数据库连接失败！");
			con = null;
			e.printStackTrace();
		}
		return con;
	}

	public void doPstm(String sql, Object[] params) //对数据库进行操作
	{
		if (sql != null && !sql.equals(""))
		{
			if (params == null)
				params = new Object[0];

			getCon(); //创建数据库连接
			if (con != null)
			{
				try
				{
//					System.out.println(sql);
					pstm = con.prepareStatement(sql,
							ResultSet.TYPE_SCROLL_INSENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
					for (int i = 0; i < params.length; i++)
					{
						pstm.setObject(i + 1, params[i]);// 原来是+1
					}
					pstm.execute();
				} catch (SQLException e)
				{
					System.out.println("doPstm()方法出错！");
					e.printStackTrace();
				}
			}
		}
	}

	public ResultSet getRs() throws SQLException
	{
		return pstm.getResultSet();
	}

	public int getCount() throws SQLException
	{
		return pstm.getUpdateCount();
	}

	public void closed()
	{
		try
		{
			if (pstm != null)
				pstm.close();
		} catch (SQLException e)
		{
			System.out.println("关闭pstm对象失败！");
			e.printStackTrace();
		}
		try
		{
			if (con != null)
			{
				con.close();
			}
		} catch (SQLException e)
		{
			System.out.println("关闭con对象失败！");
			e.printStackTrace();
		}
	}
}
