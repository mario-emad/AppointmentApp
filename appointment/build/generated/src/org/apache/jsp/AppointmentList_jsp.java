package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import com.classes.ConnectionClass;
import java.sql.Connection;

public final class AppointmentList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    Connection con = ConnectionClass.ConnectionMethod();
    Statement statement = null;
    ResultSet resultSet = null;

    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate localDate = LocalDate.now();

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("        <table>\n");
      out.write("            <tr>\n");
      out.write("                <th>Doctor name</th>\n");
      out.write("                <th>Date</th>\n");
      out.write("                <th>Hour</th>\n");
      out.write("                <th>Reserve doctor</th>\n");
      out.write("            </tr>\n");
      out.write("            ");

                String doctorname = request.getParameter("");
                statement = con.createStatement();
                String doctoridSQL = "SELECT ID_doctor FROM doctor WHERE name_doctor = '" + doctorname + "';";
                resultSet = statement.executeQuery(doctoridSQL);
                int doctorid = 0;
                if (resultSet.next()) {
                    doctorid = resultSet.getInt("ID_doctor");
                }

                String date = dtf.format(localDate);
                int h = 1;
                String appointmentSQL = "SELECT doctor.name_doctor, doctor_has_patient.date, doctor_has_patient.time FROM doctor_has_patient INNER JOIN doctor ON doctor_has_patient.ID_Doctor = doctor.ID_doctor WHERE doctor_has_patient.ID_Doctor = " + doctorid + " AND doctor_has_patient.date = '" + date + "';";
                for (int i = 0; i < 10; i++) {
            
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <th>ffff</th>\n");
      out.write("                <th>dddddd</th>\n");
      out.write("                <th>sssss</th>\n");
      out.write("                <th>aaaaa</th>\n");
      out.write("            </tr>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("\n");
      out.write("        </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
