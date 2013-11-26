package com.channel;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class ChannelController 
{
    @Autowired
    Programdao pdo;
    
    @RequestMapping("/channel")	    
      public ModelAndView channelProgram()
    {
    	ModelAndView prc = new ModelAndView("channel");
    	prc.addObject("pro", new Program());
        return prc;
    }
    
    
    @RequestMapping("/channelProgram.do")
    public String insertProgram(Model model,@ModelAttribute ("pro")Program channelProgram,BindingResult rs)
    {
        
        	 pdo.insertProgram(channelProgram);
             return "redirect:/getList";
    
              }
        

    @RequestMapping("/getList")  
    public ModelAndView getProgramList() 
    {  
     List<Program> programlist = pdo.getProgramList();  
     return new ModelAndView("programlist", "programlist", programlist);  
    }
    
    @RequestMapping ("/user")
    public ModelAndView userProgram()
   {
	   ModelAndView pru = new ModelAndView("user");
	   pru.addObject("ulo", new Userlogin());
	   return pru;
	   
   }
    @RequestMapping("/userProgram.do")
   public String addUser(@ModelAttribute("ulo") Userlogin userProgram,BindingResult rs)
  {
	  pdo.addUser(userProgram);
	  return "redirect:/getList1";
	  
  }     
    @RequestMapping("/getList1")
    public ModelAndView getProgramList1()
    {
    	
    	 List<Program> programlist1 = pdo.getProgramList1();  
    	 ModelAndView programListModel = new ModelAndView("programlist1", "programlistItems", programlist1);
    	 programListModel.addObject("plo", new Programlist());
         return programListModel;
    }
    
    
    @RequestMapping("/getProgramList1.do")
    public String selectProgram(Model model,@ModelAttribute("plo")Programlist getProgramList1,BindingResult rs)
    {
    	System.out.println(model.asMap().keySet().toString());
    //System.out.println(((Programlist)model.asMap().get("plo")).getProgramlist1().toString());
    	pdo.selectProgram(getProgramList1);
    	 
    	 return "sucess";
    }
}