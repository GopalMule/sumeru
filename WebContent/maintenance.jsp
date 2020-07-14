<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.time.LocalDate" %> 
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Arrays" %>
<%@page import="com.itextpdf.*" %>
<%@page import="com.itextpdf.layout.*" %>
<%@page import="com.itextpdf.text.BaseColor" %>
<%@page import="com.itextpdf.text.pdf.PdfPTable" %>
<%@page import="com.itextpdf.text.pdf.PdfPCell" %>
<%@page import="com.itextpdf.text.Image" %>

 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>	
<!DOCTYPE html>
<html>
<head>
<title>Maintenance</title>

<meta charset="UTF-8">

<style>
  h1 {color: red;}
  p {color: blue;}

* {
  box-sizing:border-box;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
  border: 1px solid #555;
}

li a {
  display: block;
  color: #000;
  padding: 8px 16px;
  text-decoration: none;
  
  
}

li {
  text-align: left;
  border-bottom: 1px solid #555;
}

li:last-child {
  border-bottom: none;
}

li a.active {
  background-color: #4CAF50;
  color: white;
}

li a:hover:not(.active) {
  background-color: #555;
  color: white;
}

.left {
  padding:1px;
  float:left;
  width:25%; /* The width is 20%, by default */
  

  
}

.main {
  background-color:#f1f1f1;
  padding:20px;
  float:left;
  width:60%; /* The width is 60%, by default */
}

.right {
  background-color:#4CAF50;
  padding:20px;
  float:left;
  width:20%; /* The width is 20%, by default */
}

/* Use a media query to add a break point at 800px: */
@media screen and (max-width:800px) {
  .left, .main, .right {
    width:100%; /* The width is 100%, when the viewport is 800px or smaller */
  }
}
</style>
</head>
<body>
<div class="left">
<img src="images/sumeru.jpg" style="width:150px"><br><br><br>

<ul>
  <li><a href="societymembers.jsp">Society Members</a></li>
  <li><a class="active" href="maintenance.html">Maintenance</a></li>
  <li><a href="#comittee">Committee</a></li>
  <li><a href="#contact">Contact</a></li>
</ul>
</div>
<div class="main" style="text-align:center">
<h1>Sumeru Residency</h1><br><br>
<h2>Maintenance</h2>

<%
    Statement st=null;
	Connection con=null;
	ResultSet rs=null;

 
   // JDBC driver name and database URL
   	 final String DB_URL  = "jdbc:mysql://127.0.0.1:3306/society";
	//  Database credentials
      final String DB_USER = "root";
      final String DB_PASS = "P@ssw0rd0091";
      
    String flatno = request.getParameter("flatno");
    
    String[] flatnos = flatno.split(",");
   
	for (int i=0; i<flatnos.length;i++)
	{
			
	String month_year = request.getParameter("month_year");
	String path = "/home/gopal/Documents/AllReceipt/";
	String FILE_NAME = path + flatnos[i]+ "-"+ month_year+".pdf";
	Date date = Calendar.getInstance().getTime();
	DateFormat formatter = new SimpleDateFormat("EEEE, dd MMMM yyyy, hh:mm:ss.a");
    String today = formatter.format(date);
	try{
 
		//response.setContentType("application/pdf");
		Document document = new Document();

	   
	     
		PdfWriter.getInstance(document, new FileOutputStream(new File(FILE_NAME)));
		//PdfWriter writer=PdfWriter.getInstance(document, response.getOutputStream());
		document.open();
		Paragraph p = new Paragraph();
		//Set Header Path
		document.add(Image.getInstance("/home/gopal/eclipse-workspace/sumeru/WebContent/images/header.jpg"));
		p.setAlignment(Element.ALIGN_CENTER);
		//Font red = new Font(FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.RED);
		Font f = new Font();
		//Font f= new Font();
		f.setStyle(Font.BOLD);
		f.setSize(16);
		//f.setColor(BaseColor.RED);
		
		document.add(new Paragraph("                                      Maintenance Receipt\n\n",f));
		
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASS);
	st = con.createStatement();
	String QueryString = "select flat_no, flat_type, owner_name from flat where flat_no='"+flatnos[i]+"'";
	rs=st.executeQuery(QueryString);
	Paragraph p2=null;
	
	while(rs.next()){
	
	String flat_type=rs.getString("flat_type").toString();
	if(flat_type.equalsIgnoreCase("rental"))
	{
		
	PdfPTable table = new PdfPTable(2);

    PdfPCell cell1 = new PdfPCell(new Paragraph("Flat No: "));
    PdfPCell cell2 = new PdfPCell(new Paragraph(rs.getString("flat_no")));
    PdfPCell cell3 = new PdfPCell(new Paragraph("Name:"));
    PdfPCell cell4 = new PdfPCell(new Paragraph(rs.getString("owner_name")));
    PdfPCell cell5 = new PdfPCell(new Paragraph("For Month:"));
    PdfPCell cell6 = new PdfPCell(new Paragraph(month_year));
 	PdfPCell cell7 = new PdfPCell(new Paragraph("Receipt Date:"));
 	PdfPCell cell8 = new PdfPCell(new Paragraph(today));
 	PdfPCell cell9 = new PdfPCell(new Paragraph("Amount:"));
 	PdfPCell cell10 = new PdfPCell(new Paragraph("R.S. 1300/- Received."));
 
 	// Add cells in table
    table.addCell(cell1);
    table.addCell(cell2);
    table.addCell(cell3);
    table.addCell(cell4);
    table.addCell(cell5);
    table.addCell(cell6);
    table.addCell(cell7);
    table.addCell(cell8);
    table.addCell(cell9);
    table.addCell(cell10);
    document.add(table);
    
    p2 = new Paragraph();
    	
	p2.add("\n\n                  Note: This is computer generated receipt, hence no signature is required.");
	document.add(p2);
		}
	else
	{
		PdfPTable table = new PdfPTable(2);

	    PdfPCell cell1 = new PdfPCell(new Paragraph("Flat No: "));
	    PdfPCell cell2 = new PdfPCell(new Paragraph(rs.getString("flat_no")));
	    PdfPCell cell3 = new PdfPCell(new Paragraph("Name:"));
	    PdfPCell cell4 = new PdfPCell(new Paragraph(rs.getString("owner_name")));
	    PdfPCell cell5 = new PdfPCell(new Paragraph("For Month:"));
	    PdfPCell cell6 = new PdfPCell(new Paragraph(month_year));
	 	PdfPCell cell7 = new PdfPCell(new Paragraph("Receipt Date:"));
	 	PdfPCell cell8 = new PdfPCell(new Paragraph(today));
	 	PdfPCell cell9 = new PdfPCell(new Paragraph("Amount:"));
	 	PdfPCell cell10 = new PdfPCell(new Paragraph("R.S. 1200/- Received."));
	 
	 	// Add cells in table
	    table.addCell(cell1);
	    table.addCell(cell2);
	    table.addCell(cell3);
	    table.addCell(cell4);
	    table.addCell(cell5);
	    table.addCell(cell6);
	    table.addCell(cell7);
	    table.addCell(cell8);
	    table.addCell(cell9);
	    table.addCell(cell10);
	    document.add(table);
	    
	    p2 = new Paragraph();
	    	
		p2.add("\n\n                  Note: This is computer generated receipt, hence no signature is required.");
		document.add(p2);
	}
		
		
	}
	document.close();
	
	
	%>
	
    <%
    
	}
	
	catch (Exception e){
		e.printStackTrace();
	}
	finally{
	st.close();
	con.close();
	
	}
	}
	out.print("Receipts are Generated Successfully");
%>

</div>
</body>
</html>