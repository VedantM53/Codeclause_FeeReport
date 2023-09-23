<%@page import="java.io.PrintWriter"%>
<%@page import="Entity.Student"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String id1=request.getParameter("id1");
int id2=Integer.parseInt(id1);

EntityManagerFactory emf=Persistence.createEntityManagerFactory("feereport");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();

Student s= em.find(Student.class,id2);
et.begin();
em.remove(s);
et.commit();

PrintWriter pw=response.getWriter();
pw.write("Data Delete Succesfully");
RequestDispatcher rd=request.getRequestDispatcher("Edit_Report.jsp");
rd.include(request, response);

response.setContentType("text/html");






%>
</body>
</html>