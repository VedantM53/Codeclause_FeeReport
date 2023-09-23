<%@page import="java.io.PrintWriter"%>
<%@page import="Entity.Student"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
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
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: black;
            color:white;
            margin: 0;
            padding: 0;
        }

        header {
            background-color:green;
            color: #fff;
            text-align: center;
            padding: 15px;
        }
        .table
        {
        margin-top:50px;
        
        }
        </style>
</head>
<body>
 <header>
        <h1>Report</h1>
 </header>
 <%
 
 
    EntityManagerFactory emf=Persistence.createEntityManagerFactory("feereport");
    EntityManager em=emf.createEntityManager();
    EntityTransaction et=em.getTransaction();
    Query query=em.createQuery(" select a from Student a");
    List<Student> student=query.getResultList();
    if(student.size()>0)
    {
    	
 %>
 <table cellpadding="20" align="center" border="4" class="table">
<th>ID</th> 
<th>NAME</th> 
<th>EMAIL</th> 
<th>CONTACT</th> 
<th>COURSES</th> 
<th>FEE</th> 
<th>PAID</th>
<th>DUE FEE</th>
<th>ADDRESS</th>
<th>CITY</th>  
  
<%
 for(Student s:student) {
%>
 <tr>
 <td><%=s.getId()%></td>
 <td><%=s.getName() %></td>
 <td><%=s.getEmail() %></td>
 <td><%=s.getContact() %></td>
 <td><%=s.getCourses() %></td>
 <td><%=s.getFee() %></td>
 <td><%=s.getPaid() %></td>
 <td><%=s.getDuefee() %></td>
 <td><%=s.getAddress() %></td>
 <td><%=s.getCity() %></td>
 
 </tr>
 <%}%>
 
</table>
<% } else {

PrintWriter pw=response.getWriter();
out.print("No Student is Added");

RequestDispatcher rd=request.getRequestDispatcher("Accoutant_Module.html");
rd.include(request, response);

}%>
 
 
 
 
 
 
 
 
 

</body>
</html>