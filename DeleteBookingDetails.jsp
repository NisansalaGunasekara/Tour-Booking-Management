<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%
    if(request.getParameter("BookingID")!=null) //get delete_id from index.jsp page with href link and check not null after continue
    {
        int hid=Integer.parseInt(request.getParameter("BookingID")); //get delete_id store in "id" variable
        
        String url="jdbc:mysql://localhost:3306/travel"; //database connection url string
        String username="root"; //database connection username
        String password=""; //database password
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection(url,username,password); //create connection
            
            PreparedStatement pstmt=null; //create statement
            
            pstmt=con.prepareStatement("delete from hotel_booking where BookingID=? "); //sql delete query
            pstmt.setInt(1,hid);
            pstmt.executeUpdate(); //execute query

            RequestDispatcher rd=request.getRequestDispatcher("CustomerHotelBook.jsp"); //after delete success forward index.jsp page
            rd.forward(request, response); 
            
            pstmt.close(); //close statement
            
            con.close(); //close connection   
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }
%>