package com.channel;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

public class ProgramExtractor implements ResultSetExtractor<Program> 
{
   public Program extractData(ResultSet rs)throws SQLException,DataAccessException
   {
	   Program pro = new Program();
	   pro.setProgramname(rs.getString(1));
	   pro.setTime(rs.getString(2));
	   
	   return pro;
   }
}
