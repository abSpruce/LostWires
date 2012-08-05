<%--
    Document   : saleNew
    Created on : Apr 9, 2011, 1:16:15 PM
    Author     : James Beckwith
    Author     : David Hayashida
--%>

<%@page import="lostwires.HtmlUtils"%>
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="java.io.*" %>

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
      <title>LostWires: New Sale</title>
      <LINK REL=STYLESHEET
            HREF="lostwires.css"
            TYPE="text/css">

   </head>

   <body class="twoColFixLtHdr">

      <div id="container">
         <div id="header">
            <h1>New Sale</h1>
            <!-- end #header --></div>
            <jsp:include page="menu.html"/>
         <div id="mainContent">
            <!-- end #mainContent --></div>
            <%
                  db.connect();

                  try {
                     rs = db.execSQL("SELECT * FROM customer");
                     // Begin creating the html response
                     //response.setContentType("text/html");
                     // Get the print writer
                     PrintWriter out1 = response.getWriter();

                     // Create the html utilities
                     HtmlUtils hu = new HtmlUtils();
            %>
         <h3>Select a Customer</h3>
         <TABLE align=center border=1>
            <TH align=center> Select </TH><TH align=center> First Name </TH><TH align=center> Last Name </TH>
            <%

                     /*
                      * Here will set up an arbitrary vector, containing four elements
                      */
                     Vector av = new Vector();
                     while (rs.next()) {
                        av.addElement("<a href=\"saleCreate.jsp?customerID=" + rs.getInt("customerID") + "\">&nbsp;+&nbsp;</a>");
                        av.addElement(rs.getString("firstName"));
                        av.addElement(rs.getString("lastName"));
                     }
                     out.print(hu.getTableContents("center", av, 3));
                  } catch (SQLException e) {
                     throw new ServletException("Your query is not working", e);
                  } finally {
                     db.close();
                  }
            %>
         </TABLE>

         <!-- force the #container div to contain all child floats -->
         <br class="clearfloat" />
         <div id="footer">
            <p>Footer</p>
            <!-- end #footer --></div>
         <!-- end #container --></div>
   </body>
</html>