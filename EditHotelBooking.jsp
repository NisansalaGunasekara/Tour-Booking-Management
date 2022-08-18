<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="home.css">
        <title>EditHotelBookingDetails</title>
        
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
        
    </head>
    <body>
       
        

        
       
            
        <%@ include file="headerView.jsp" %>
        
         <%
            if(request.getParameter("BookingID")!=null) //get edit_id from index.jsp page with href link and check not null after continue
            {
                int BookingID=Integer.parseInt(request.getParameter("BookingID")); //get edit_id store in "id" variable
                
                String url="jdbc:mysql://localhost:3306/travel"; //database connection url string
                String username="root"; //database connection username
                String password=""; //database password
                
                try
                {
                    Class.forName("com.mysql.jdbc.Driver"); //load driver
                    Connection con=DriverManager.getConnection(url,username,password); //create connection
                        
                    PreparedStatement pstmt=null; //create statement
                    
                    
                    pstmt=con.prepareStatement("select * from hotel_booking where BookingID=?"); //sql select query 
                    pstmt.setInt(1,BookingID);
                    ResultSet rs=pstmt.executeQuery(); //execute query and set in Resultset object rs.
                    
                    while(rs.next())
                    {
                       
            %>
             

       
        <form  action="EditHotelBooking" method="post">
            
           
           
        <pre>
            <div class="hotel-block"  style="background-color: #032ea8;padding: 2px 15px 30px;margin-top:250px; width: 101%; margin-left: -22px;">
            <h1 style="color:  #ffffff; margin-left: 80px;">Edit Hotel Booking Details</h1>
            <div style="margin-top: 0px;margin-left: 260px;"> 
                
            <input type="hidden" name="BookingID" id="BookingID" value="<%=rs.getInt("BookingID")%>" style="width: 500px; height: 40px;"/> 
            <input type="hidden" name="uid" id="uid" value="<%=rs.getInt("uid")%>" style="width: 500px; height: 40px;"/>
            
            <label class="Labeltext" >Hotel Name:</label>
            <input type="text" name="hotel_name"  placeholder="hotel_name " id="hotel_name" value="<%=rs.getString("hotel_name")%>" style=" width: 500px; height: 40px;"/>
   
            <label class="Labeltext" >Email:</label>
            <input type="text" name="email"  placeholder="email " id="email" value="<%=rs.getString("email")%>" style=" width: 500px; height: 40px;"/>  
                
            <label class="Labeltext" >Arrival Date:</label>
            <input type="date" name="arrival_date" id="arrival_date" value="<%=rs.getString("arrival_date")%>" style="width: 500px; height: 40px;"/>
            
            <label class="Labeltext"  >Departure Date:</label>
            <input type="date" name="departure_date" id="departure_date" value="<%=rs.getString("departure_date")%>" style="width: 500px; height: 40px;"/>
            
            <label class="Labeltext" >Total Number of Persons:</label>
            <input type="number" name="NumberOfPerson" id="NumberOfPerson" value="<%=rs.getString("NumberOfPerson")%>" style="width: 500px; height: 40px;"/>
            
            <label class="Labeltext" >Adults(18+):</label>
            <input type="number" name="adults" id="adults" value="<%=rs.getString("adults")%>" style="width: 500px; height: 40px;"/>
            
            <label class="Labeltext" >Children(1-18):</label>
            <input type="number" name="child" id="child" value="<%=rs.getString("child")%>"  style="width: 500px; height: 40px;"/>
           
            <label class="Labeltext" > <span style="width: 500px; height: 40px;"/>Room Type</span></label>
            <select name="roomType"  id="roomType" value="<%=rs.getString("roomType")%>" style="width: 500px; height: 40px;">
                    <option value="Single Normal"> Single Normal </option>
                    <option value="Single Luxury"> Single Luxury </option>
                    <option value=" Couple Normal"> Couple Normal </option>
                    <option value="Couple Luxury"> Couple Luxury  </option>
                    <option value="Family Normal"> Family Normal </option>
                    <option value="Family Luxury"> Family Luxury </option>
                    <option value="Villa"> Villa </option>            
            </select>
            
            <label class="Labeltext" >Number of Rooms:</label>
            <input type="number" name="NumberOfRoom" id="NumberOfRoom" value="<%=rs.getString("NumberOfRoom")%>"  style="width: 500px; height: 40px;"/>
            
            
            
<input type="submit" value = "Update" name="btn_edit" class ="cbtn" style="background-color:  #0385ad; width: 350px; height: 60px"/>
<input type="hidden" name="hidden_id" value="<%=rs.getInt("BookingID")%>">
       

        <%
                    }
                    
                    pstmt.close(); //close statement

                    con.close(); //close connection
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            %>
                                
            </div>
            </div>
        </pre>
        </form>
        
        <%@ include file="footer.jsp" %>
        
    </body>
</html>
