<%@ page errorPage="session_expired.jsp" language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,java.sql.Date" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

<%
String dateAfter="",dateBefore="";
String xVal, yVal;
String yearAfter="",yearBefore="",monthAfter="",monthBefore="",dayAfter="",dayBefore="";
String remark="";
String email = "m1@gmail.com",uname="";

HttpSession hp = request.getSession(false);  // as (false) , it opens old session to read data
dateAfter = (String) hp.getAttribute("dateAfter");
dateBefore = (String) hp.getAttribute("dateBefore");

if(dateAfter!=null || dateBefore!=null)
{

	yearAfter = dateAfter.substring(0,4);  // Year of AfterDate
	yearBefore = dateBefore.substring(0,4); // Year of BeforeDate
	
	monthAfter = dateAfter.substring(5,7);  //Month of AfterDate
	monthBefore = dateBefore.substring(5,7);	//Month of BeforeDate
	
	dayAfter = dateAfter.substring(8,10);	// Day of AfterDate
	dayBefore = dateBefore.substring(8,10);	//Day of BeforeDate
}

Gson gsonObj = new Gson(); // Used for converting the Java Object into particular JSON Representation and vice versa.
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
 
try{
	
	//Establishing Connection to Database (1).......
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp","root","manan");
	Statement statement = connection.createStatement();	
	ResultSet rs = statement.executeQuery("select * from user");
	
	//fetching the username (for temporary purpose) actually username will be taken from session itself
	while(rs.next())
	{
		if(rs.getString(4).equals(email))
		{
			uname = rs.getString(1);
		}
	}
	
	//Query for sum function and fetching data cname and uname and sum
	ResultSet resultSet;
	if(dateAfter==null || dateBefore==null)
	{
		resultSet = statement.executeQuery("select sum(tamount) as sum,cname,uname from transaction group by uname,cname");
	}
	else
	{
		resultSet = statement.executeQuery("select SUM(tamount) as sum,cname,uname from transaction where tdate >= CAST('"+yearAfter+"-"+monthAfter+"-"+dayAfter+"' AS DATE) and tdate <= CAST('"+yearBefore+"-"+monthBefore+"-"+dayBefore+"' AS DATE) group by uname,cname");
	}
	
	while(resultSet.next()){
		if(uname.equals(resultSet.getString("uname")))
		{
			xVal = resultSet.getString("cname");
			yVal = resultSet.getString("sum");
			map = new HashMap<Object,Object>();
			map.put("x", xVal);
			map.put("y", Double.parseDouble(yVal));
			list.add(map);
			dataPoints = gsonObj.toJson(list);
		}
	}
	connection.close();
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}

// to draw the graph from the data from the data base connected

%>

// Calling the Function At the time of Page Load

window.onload = function() { 
 
<% if(dataPoints != null) { %>
	var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "Analysis of Expense"
	},
	data: [{
		type: "pie", //change type to bar, line, area, pie, etc
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
<% } %> 
 
}
</script>
</head>
<body>

<!-- Starting of the div tag to display the Pie Chart -->
<!-- And also applying the calendar to select the Date and month and calling the Servlet Date.java from action "getdate" -->
<div style="margin-left: 30%; margin-bottom: 2%;">
	<form action="getdate">
		<span>FROM</span>
		<input type="date" name="dateAfter"/>
		<span style="margin-left:2%;">TO</span>
		<input type="date" name="dateBefore"/>
		<input type="submit" value="Refresh"/>
	</form>
</div>
<div id="chartContainer">
</div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js">
</script>
<div class="table">
	<% 
	// To Displaying the data from the Database.......................
	try{
		//establishing connection with database (2)........
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp", "root", "manan");
		Statement statement = con.createStatement();
		
		//Fetching username (temporary purpose) username will come from the session
		ResultSet rs = statement.executeQuery("select * from user");
		while(rs.next())
		{
			if(rs.getString(4).equals(email))
			{
				uname = rs.getString(1);
			}
		}
		
		//taking data from database based in the conditions......................
		ResultSet resultSet;	
					
		if(dateAfter==null || dateBefore==null)
		{
			resultSet = statement.executeQuery("select sum(tamount) as sum,cname,uname from transaction group by uname,cname");
		}
		else
		{
			resultSet = statement.executeQuery("select SUM(tamount) as sum,cname,uname from transaction where tdate >= CAST('"+yearAfter+"-"+monthAfter+"-"+dayAfter+"' AS DATE) and tdate <= CAST('"+yearBefore+"-"+monthBefore+"-"+dayBefore+"' AS DATE) group by uname,cname");
		}
					//Starting of the div row tag to display the category and price
					while(resultSet.next())
					{
						if(uname.equals(resultSet.getString("uname")))
						{
							%>
							<div class="row">
								<div class="column"><%out.println(""+resultSet.getString("cname")); %></div>
								<div class="column"><%out.println("Rs "+resultSet.getInt("sum"));%></div>
							</div>
							<%
						}
					}
					con.close();
		}
		catch(Exception e)
		{
			System.out.println(""+e.getMessage());
		}
		
	%>
</div>
</body>
</html>