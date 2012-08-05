<%-- 
    Document   : viewcustomer
    Created on : Mar 30, 2011, 10:00:59 PM
    Author     : James Beckwith
    Author     : David Hayashida
--%>

<%@page import="lostwires.HtmlUtils"%>
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="java.io.*" %>
<%@page import="javax.xml.transform.Source"%>
<%--<%@page import="lostwires.customerBean" %>--%>

<%@page language="java"%>
<%-- Use Customer Bean for this page --%>
<jsp:useBean id="db"
             beanName="lostwires.DbBean"
             type="lostwires.DbBean"
             scope="page"/>
<jsp:setProperty name="db" property="*" />
<%!    ResultSet rs = null;
   ResultSetMetaData rsmd = null;
   int numColumns;
   int i;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>LostWires: View Customer</title>
      <LINK REL=STYLESHEET
            HREF="lostwires.css"
            TYPE="text/css">
   </head>
   <body class="twoColFixLtHdr">

      <div id="container">
         <div id="header">
            <h1>View Customer</h1>
            <!-- end #header --></div>
            <jsp:include page="menu.html"/>
         <div id="mainContent">
            <%
                  db.connect();

                  try {
                     rs = db.execSQL("SELECT * FROM customer");
                     // Get the print writer
                     PrintWriter out1 = response.getWriter();

                     // Create the html utilities
                     HtmlUtils hu = new HtmlUtils();

            %>
            <TABLE align=center border=1>
               <TH align=center> Edit </TH><TH align=center> First Name </TH><TH align=center> Last Name </TH><TH align=center> Street Address </TH><TH align=center> City </TH><TH align=center> Province </TH><TH align=center> Postal Code </TH><TH align=center> Telephone Number </TH>
               <%
                        /*
                         * Here will set up an arbitrary vector, containing four elements
                         */
                        Vector av = new Vector();
                        while (rs.next()) {
                           av.addElement("<a href=\"customerEdit.jsp?customerID=" + rs.getInt("customerID") + "\">&nbsp;+&nbsp;</a>");
                           av.addElement(rs.getString("firstName"));
                           av.addElement(rs.getString("lastName"));
                           av.addElement(rs.getString("streetAddress"));
                           av.addElement(rs.getString("city"));
                           av.addElement(rs.getString("prov"));
                           av.addElement(rs.getString("postCD"));
                           av.addElement(rs.getString("telephone"));
                        }
                        out.print(hu.getTableContents("center", av, 8));
                     } catch (SQLException e) {
                        throw new ServletException("Your query is not working", e);
                     } finally {
                        db.close();
                     }
               %>
            </TABLE>
            <!-- end #mainContent --></div>
         <!-- force the #container div to contain all child floats -->
         <br class="clearfloat" />
         <div id="footer">
            <p>Footer</p>
            <!-- end #footer --></div>
         <!-- end #container --></div>
   </body>
</html>
