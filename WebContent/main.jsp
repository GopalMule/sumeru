<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
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
  width:20%; /* The width is 20%, by default */
  

  
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
  <li><a class="active" href="societymembers.jsp">Society Members</a></li>
  <li><a href="maintenance.jsp">Maintenance</a></li>
  <li><a href="#contact">Committee</a></li>
  <li><a href="#about">Contact</a></li>
</ul>
</div>
  


<div class="main" style="text-align:center">
<h1>Sumeru Residency</h1><br>
<h2>Page is under construction</h2>

</div>
</body>
</html>