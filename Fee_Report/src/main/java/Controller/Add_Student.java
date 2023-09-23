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

import Entity.Student;

@WebServlet("/student")
public class Add_Student extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String id=req.getParameter("id");
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String conc=req.getParameter("contact");
		String course=req.getParameter("courses");
		String fee=req.getParameter("fee");
		String paid=req.getParameter("paid");
		String duefee=req.getParameter("duefee");
		String address=req.getParameter("address");
		String city=req.getParameter("city");
		
		int id1=Integer.parseInt(id);
		long conc1=Long.parseLong(conc);
		double fee1=Double.parseDouble(fee);
		double paid1=Double.parseDouble(paid);
		double duefee1=Double.parseDouble(duefee);
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("feereport");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Student student=new Student();
		student.setId(id1);
		student.setName(name);
		student.setEmail(email);
		student.setContact(conc1);
		student.setCourses(course);
		student.setFee(fee1);
		student.setPaid(paid1);
		student.setDuefee(duefee1);
		student.setAddress(address);
		student.setCity(city);
		
		et.begin();
		em.persist(student);
		et.commit();
		
		PrintWriter pw=resp.getWriter();
		pw.println("Student Added Succesfully..!");
		
		RequestDispatcher rd=req.getRequestDispatcher("Accoutant_Module.html");
		rd.include(req, resp);
	     resp.setContentType("text/html");
	}

}
