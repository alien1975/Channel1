package com.channel;



import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;

public class Programdaoimpl implements Programdao
{
	private JdbcTemplate jdbcTemplate ;
	   
	 @Autowired
	    @Qualifier("dataSource")
	    public void setJdbcTemplate(DataSource dataSource) {
	     
	        this.jdbcTemplate = new JdbcTemplate(dataSource);

	    }
	    public void insertProgram(Program pro)
	    {
	    	String sql = "insert into channel values(?,?)";
	    	jdbcTemplate.update(sql, new Object[]{pro.getProgramname(),pro.getTime()});  
	    }
       
		
		
		public List<Program> getProgramList()
        {
			
			List<Program> programlist = new ArrayList<Program>();  
			  
			  String sql = "select * from channel";  
			  programlist = jdbcTemplate.query(sql, new ProgramRowMapper());  
			  return programlist; 
			}

          public void addUser(Userlogin ulo)
          {
        	  String sql="insert into user values(?,?,?,?)";
        	  jdbcTemplate.update(sql, new Object[] 
        			  {ulo.getName(),ulo.getAge(),ulo.getUsername(),ulo.getPassword()});
        	  
          }
          public void selectProgram(Programlist plo)
          {
        	  System.out.println("string printed here");
     System.out.println(plo.getProgramlist1());
        	  
        	  String sql = "insert into booked(programname,time) values(?,?)";
        	  jdbcTemplate.update(sql, new Object[]{plo.getProgramlist1().get(0).getProgramname(),plo.getProgramlist1().get(0).getTime()});
        }

          public List<Program> getProgramList1()
          {
        	  List<Program> programlist1 ;
        	  
        	  String sql = "select * from channel"; 
        	  programlist1 = jdbcTemplate.query(sql, new ProgramRowMapper());
              return programlist1;
          }


}
