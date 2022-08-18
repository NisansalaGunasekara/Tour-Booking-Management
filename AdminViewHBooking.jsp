<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="home.css">
        <title>Hotel Booking Details</title>
        
        
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
  
  

   <%@ include file="header.jsp" %>
   
   
    </head>
    <body>
       
        <h1>your booked detail</h1>
         <%
              String bookingid = request.getParameter("BookingID");

                try{
        Class.forName("com.mysql.jdbc.Driver");
       // out.println("driver loaded");
     Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel","root" ,"");
      //  out.println("Connect");
      Statement  st =  con.createStatement();
       //   out.println("conncetion successfull");
         
       ResultSet rs = st.executeQuery("select * from travel.hotel_booking where BookingID = "+bookingid);%>
         
            
         
            
        <%  
            rs.next();
        
        
        
            int BookingID = rs.getInt("BookingID");
          //  out.println(id);
          
            String email  = rs.getString("email");
            String from  = rs.getString("arrival_date");
            String to  = rs.getString("departure_date");
            String roomType  = rs.getString("roomType");
            String roomNo  = rs.getString("NumberOfRoom");
            String person = rs.getString("NumberOfPerson");
            String adult = rs.getString("adults");
            String child = rs.getString("child");
            String BookingPayment = rs.getString("BookingPayment");
                    
        
            
        %> <br>
            
            <div class="hotel-block"  style="background-color: #032ea8;padding: 2px 15px 30px;margin-top: -20px; width: 102%; margin-left: -23px;">
                ...........................................................................................................................................................................................................................................................................................
                
                <%-- <h2 class="heading"><%out.println(BookingID);%></h2><br><br><br> --%>
                <h3 class="heading"><%out.println("Email            :   "+email);%></h3><br>
                <h3 class="heading"> <%out.println("Arrival Date    :   "+from);%></h3><br>
                <h3 class="heading"><%out.println("Departure Date   :   "+to);%></h3><br>
                <h3 class="heading"><%out.println("Room Type        :   "+roomType);%></h3><br>
                <h3 class="heading"><%out.println("Rooms            :   "+roomNo);%></h3><br>
                <h3 class="heading"><%out.println("Persons          :   "+person);%></h3><br>
                
                                
               <a href="AdminSearchHBooking.jsp?BookingID=<%out.println(BookingID);%>" class="linkbutton">Back</a>
                 <button class="linkbutton" onclick="myFunction()">Print</button>
<script>
function myFunction() {
  window.print();
}
</script>
           </div>
                
         
           <% } 
            
            catch(Exception e)
                    {
                    
                    }
            out.close();
            
            %>
            
            

    
    

          
    <%@ include file="footer.jsp" %>
    
    
    
    
    </body>
</html>