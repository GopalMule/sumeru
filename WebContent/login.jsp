<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>

<%
	Statement st=null;
	Connection con=null;
	ResultSet rs=null;

 
   // JDBC driver name and database URL
   	 final String DB_URL  = "jdbc:mysql://127.0.0.1:3306/society";
	//  Database credentials
      final String DB_USER = "root";
      final String DB_PASS = "P@ssw0rd0091";
	
	String user = request.getParameter("username");
	String pass = request.getParameter("password");

	try{
 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASS);
	st = con.createStatement();

	String QueryString = "select uname,password from users where uname='"+user+"' and password = '"+pass+"'";
	rs = st.executeQuery(QueryString);
	if(rs.next()){
	
		response.sendRedirect("societymembers.jsp");
	
	}
	else
	out.print("Username or password are not Valid");
	
	
	
	}
		
	catch (Exception e){
  out.print(e);
	}
	finally{
	st.close();
	rs.close();
	con.close();
	}
%>