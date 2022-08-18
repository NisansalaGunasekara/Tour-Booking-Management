<%@page import="db.DBUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="home.css">
         <title>Hotels</title>
        
         <style>
            
        .but{
  
        width: 100px; height: 40px;
        color : red;

   border-top: 1px solid #96d1f8;
   background: #65a9d7;
   background: -webkit-gradient(linear, left top, left bottom, from(#728cdb), to(#65a9d7));
   background: -webkit-linear-gradient(top, #728cdb, #65a9d7);
   background: -moz-linear-gradient(top, #728cdb, #65a9d7);
   background: -ms-linear-gradient(top, #728cdb, #65a9d7);
   background: -o-linear-gradient(top, #728cdb, #65a9d7);
   padding: 5px 10px;
   -webkit-border-radius: 8px;
   -moz-border-radius: 8px;
   border-radius: 8px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 20px;
   font-family: Georgia, serif;
   text-decoration: none;
   vertical-align: middle;
  cursor: pointer;
}
        </style>

<link href="responsiveslides.css" rel="stylesheet" type="text/css"/>
<link href="themes.css" rel="stylesheet" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="responsiveslides.min.js" type="text/javascript"></script>
  <script>
      
      $(function () {

      // Slideshow 1
      $("#slider1").responsiveSlides({
        auto: true,
        pager: false,
        nav: true,
        speed: 500,
        maxwidth: 1200,
        namespace: "centered-btns"
      });
   });
 </script>
  <%@ include file="HederB00king.jsp" %>
</head>
<body>


	

	<table cellspacing="20px" align="center" cellpadding="30px" width="100%">
            
             <%
              

       //try{
            //String n=(String)session.getAttribute("sessname");         
            
            
            
       // out.print("Hello "+n);
        //Class.forName("com.mysql.jdbc.Driver");
       // out.println("driver loaded");
     //Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root" ,"");
      //  out.println("Connect");
      ///Statement  st =  con.createStatement();
      //    out.println("conncetion successfull");
      
       
      // ResultSet rs = st.executeQuery("select * from travel.hotel_booking where uid = "+n);
             
       %>
            <%
                 String bookingid = request.getParameter("BookingID");
			try {
                                String n=(String)session.getAttribute("sessname");
                                Class.forName("com.mysql.jdbc.Driver");
				boolean t;
				DBUtils db = new DBUtils();
                                Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root" ,"");
                                Statement  st =  con.createStatement();
                                ResultSet rs = st.executeQuery("select * from travel.hotel_booking ;");
                                
				String query;
				String search = request.getParameter("search");
				if (search != null) {
					query = "select * from hotel_booking where roomType like'%" + search + "%'";
					db.rs = db.st.executeQuery(query);
				}

				for (int r = 0;r < 10; r++) {
		%>


             
         
            
        <%  while(rs.next())
        {
        
            int BookingID = rs.getInt("BookingID");
            
            int uid= rs.getInt("uid");
          
            String hotel_name  = rs.getString("hotel_name");
            String email  = rs.getString("email");
            String arrival_date  = rs.getString("arrival_date");
            String departure_date = rs.getString("departure_date");
            String roomType  = rs.getString("roomType");
            String NumberOfRoom  = rs.getString("NumberOfRoom");
            String NumberOfPerson  = rs.getString("NumberOfPerson");
            String adults     = rs.getString("adults");
            String child = rs.getString("child");
            
            
            
        
            
            %> 
            <tr style="height: 100px">
			<%
				for (int c = 0; c < 4; c++) {

							t = db.rs.next();
							if (t == false)
								break;
			%>
                        
                        <td align="center"
				style="border: solid #008CBA; color: #008CBA; background-color: white; width: 200px;">


				<p align="center" style="font-size: 30px; font-style: oblique;">
					<%=db.rs.getString("roomType")%></p> 
				<p style="font-size: 24px; color: red">
					<%=db.rs.getString("arrival_date")%>
				</p>
                                <p style="font-size: 24px; color: blue">
					<%=db.rs.getString("departure_date")%>
				</p>
                                
                                <form name="popup" method="post"
					action="ViewBookingDetails.jsp?BookingID=<%=db.rs.getInt("BookingID")%>">
					<input name="view"
						style="background-color: #008CBA; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 10px 10px; cursor: pointer;"
						type="submit" value="View Details">
				</form>
                                

<button class="but" onclick="myFunction()">Print</button>
<script>
function myFunction() {
  window.print();
}
</script>		
                        
                        </td>
            
                        <%	
				}
			%>
		</tr>
            <%
			}

}} catch (Exception e) {
				e.printStackTrace();
			}
		%>

	</table>

</body>
</html>