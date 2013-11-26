package com.channel;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ProgramRowMapper implements RowMapper<Program> 
{

	public Program mapRow(ResultSet rs, int line) throws SQLException 
	{  
		  ProgramExtractor programExtractor = new ProgramExtractor();  
		  return programExtractor.extractData(rs);  

}
}