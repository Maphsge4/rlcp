package com.orm;

public class Tdiaochajieguo
{
	private int id;
	private int diaocha_id;
	private int yuangong_id;
	private String daan;
	private String shijian;
	
	
	public String getDaan()
	{
		return daan;
	}
	public void setDaan(String daan)
	{
		this.daan = daan;
	}
	public int getDiaocha_id()
	{
		return diaocha_id;
	}
	public void setDiaocha_id(int diaocha_id)
	{
		this.diaocha_id = diaocha_id;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getShijian()
	{
		return shijian;
	}
	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}
	public int getYuangong_id()
	{
		return yuangong_id;
	}
	public void setYuangong_id(int yuangong_id)
	{
		this.yuangong_id = yuangong_id;
	}

}
