
package Tourpak;

import db.DBUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;


public class EditHotelBooking extends HttpServlet {
    
     
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DBUtils db = new DBUtils();
		response.setContentType("text/html;charset=UTF-8");
		try {
	
        
         String email = request.getParameter("email");
         String arrival_date = request.getParameter("arrival_date");
         String departure_date = request.getParameter("departure_date");
         String roomType = request.getParameter("roomType");
         String NumberOfRoom = request.getParameter("NumberOfRoom");
         String NumberOfPerson = request.getParameter("NumberOfPerson");
         String adults = request.getParameter("adults");
         String child = request.getParameter("child");
         
         String hotel_name = request.getParameter("hotel_name");
         int uid=Integer.parseInt(request.getParameter("uid"));
         int BookingID=Integer.parseInt(request.getParameter("BookingID"));

         String sql="update hotel_booking set email='"+email+"',arrival_date='"+arrival_date+"',departure_date='"+departure_date+"',roomType='"+roomType+"',NumberOfRoom='"+NumberOfRoom+"',NumberOfPerson='"+NumberOfPerson+"',adults='"+adults+"',child='"+child+"',hotel_name='"+hotel_name+"',uid='"+uid+"' where BookingID='"+BookingID+"'";
                          
            db.st.executeUpdate(sql);
			response.sendRedirect("CustomerHotelBook.jsp");
                        }catch(Exception e) {	
				response.sendRedirect("CustomerHotelBook.jsp");
				
			}
       }

   
    }

    