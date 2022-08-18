package Tourpak;

import db.DBUtils;
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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class HotelBooking extends HttpServlet {
    
    
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         //String BookingID = request.getParameter("BookingID");
         
         String email = request.getParameter("email");
         String from = request.getParameter("arrival_date");
         String to = request.getParameter("departure_date");
         String roomType = request.getParameter("roomType");
         String roomNo = request.getParameter("NumberOfRoom");
         String person = request.getParameter("NumberOfPerson");
         String adult = request.getParameter("adults");
         String child = request.getParameter("child");
         String BookingPayment = request.getParameter("BookingPayment");
         
         
         
                HttpSession session=request.getSession(true);
          String s7 = (String)session.getAttribute("sessname");
          String s9 = request.getParameter("id");
          String s1 = request.getParameter("hotel_name");
        
        out.println(s7);
        
//        if (!roomNo.matches("[0-9]"))
//            
//        {
//            String someMessage = "Number are invalid !";
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('" + someMessage + "');");
//            out.println("location='Booking1.jsp';");
//            out.println("</script>");
//        }else
{
         
         
          try {
                        DBUtils db = new DBUtils();
                    db.st.executeUpdate("insert  travel.hotel_booking(email, arrival_date, departure_date, roomType, NumberOfRoom, NumberOfPerson, adults, child, BookingPayment,uid,hotel_name)values ('"+email+"','"+from+"','"+to+"','"+roomType+"','"+roomNo+"','"+person+"','"+adult+"','"+child+"','"+BookingPayment+"','"+s7+"','"+s1+"')");
 
            
       
          response.sendRedirect("CuPayment.jsp");
            
            
        } 
          catch (Exception e)  {
            out.println("" +e);
            //Logger.getLogger(HotelBooking.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            out.close();
        }
         
           
        
    }}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>




}
