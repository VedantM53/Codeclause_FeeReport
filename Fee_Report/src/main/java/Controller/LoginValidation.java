package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Accountant;

@WebServlet("/Login")
public class LoginValidation extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		String email=req.getParameter("Email");
		String pswd=req.getParameter("Password");
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("feereport");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Query query=em.createQuery(" select a from Accountant a where a.email=?1 and a.password=?2");
		query.setParameter(1, email);
    	query.setParameter(2, pswd);
		List<Accountant> account=query.getResultList();
		if(account.size()>0)
		{
			Accountant accountant=account.get(0);
			PrintWriter pw=resp.getWriter();
			pw.println("Login Succesfull !");
			
			RequestDispatcher rd=req.getRequestDispatcher("Accoutant_Module.html");
			rd.include(req, resp);
			resp.setContentType("text/html");
		}
		else
		{
			PrintWriter pw=resp.getWriter();
			pw.println("Invalid Credential");
			
			RequestDispatcher rd=req.getRequestDispatcher("Login_Accountant.html");
			rd.include(req, resp);
			resp.setContentType("text/html");
		}
		
	}

}
