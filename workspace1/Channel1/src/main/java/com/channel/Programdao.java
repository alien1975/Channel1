package com.channel;

import java.util.List;

public interface Programdao 
{
 public void insertProgram(Program pro);
 public List<Program> getProgramList();
 public List<Program> getProgramList1();
 public void addUser(Userlogin ulo);
 public void selectProgram(Programlist plo);

}
