package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Accountant;

@WebServlet("/Admin")
public class AddAccountant extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{	
	try 
	{
		String id= req.getParameter("id");
		String name= req.getParameter("name");
		String email= req.getParameter("email");
		String pswd= req.getParameter("password");
		
		int id1=Integer.parseInt(id);
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("feereport");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Accountant account=new Accountant();
		account.setId(id1);
		account.setName(name);
		account.setEmail(email);
		account.setPassword(pswd);
		
		et.begin();
		em.persist(account);
        et.commit();
        
       PrintWriter pw=resp.getWriter();
       pw.println("Added...");
        
        RequestDispatcher rd=req.getRequestDispatcher("Login_Accountant.html");
        rd.include(req, resp);
        resp.setContentType("text/html");
        
		
	} catch (Exception e)
	{
		// TODO: handle exception
	}
		
	}

}
