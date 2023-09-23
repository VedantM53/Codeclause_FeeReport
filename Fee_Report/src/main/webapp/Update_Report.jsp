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
            color:black;
            margin: 0;
            padding: 0;
        }
       
        header {
            background-color:green;
            color: #fff;
            text-align: center;
            padding: 15px;
            margin-top:30px
        }
        .lable
        {
        text-color:black;
        }
        .table
        {
        margin-top:50px;
        color:white;
        
        }
        
       

        .container {
        font-color:black;
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input[type="number"],
        .form-group input[type="text"],
        .form-group input[type="email"] {
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
              
        }

        .btn-submit {
            background-color:green;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
          margin-left:39%;
        }

        .btn-submit:hover {
            background-color: blue;
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
<header>
        <h1>Update Student Data</h1>
    </header>
    <div class="container">
        <form action="update" method="post">
            <div class="form-group">
                <label for="id">ID:</label>
                <input type="number" id="id" name="id">
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="contact">Contact:</label>
                <input type="text" id="contact" name="contact">
            </div>
            <div class="form-group">
                <label for="courses">Courses:</label>
                <input type="text" id="courses" name="courses">
            </div>
            <div class="form-group">
                <label for="fee">Fee:</label>
                <input type="text" id="fee" name="fee">
            </div>
            <div class="form-group">
                <label for="paid">Paid:</label>
                <input type="text" id="paid" name="paid">
            </div>
            <div class="form-group">
                <label for="duefee">Due Fee:</label>
                <input type="text" id="duefee" name="duefee">
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address">
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city">
            </div>
            <div class="form-group">
                <button class="btn-submit" type="submit">Submit</button>
            </div>
        </form>
    </div>
 


</body>
</html>