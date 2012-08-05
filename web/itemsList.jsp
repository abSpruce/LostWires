<%--
    Document   : itemsList
    Created on : Apr 9, 2011, 1:16:15 PM
    Author     : James Beckwith
    Author     : David Hayashida
--%>
<%@page import="lostwires.HtmlUtils"%>
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="java.io.*" %>
<%@page language="java" import="java.io.InputStream" %>
<%@page language="java" import="java.io.PrintWriter" %>
<%@page import="javax.xml.transform.Source"%>

<%@page language="java"%>
<%-- Use Item Bean for this page --%>
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
      <title>LostWires: Products List</title>
      <LINK REL=STYLESHEET
            HREF="lostwires.css"
            TYPE="text/css">
   </head>

   <body class="twoColFixLtHdr">

      <div id="container">
         <div id="header">
            <h1>Products List</h1>
            <!-- end #header --></div>
            <jsp:include page="menu.html"/>
         <div id="mainContent">
            <!--            <h1>Products List</h1>-->

            <%
                  db.connect();

                  try {
                     rs = db.execSQL("SELECT * FROM item");
                     // Begin creating the html response
                     response.setContentType("text/html");
                     // Get the print writer
                     PrintWriter out1 = response.getWriter();

                     // Create the html utilities
                     HtmlUtils hu = new HtmlUtils();
            %>
            <TABLE align=center border=1>
               <TH align=center> SKU </TH><TH align=center> Description </TH><TH align=center> Unit Price </TH><TH align=center> Unit Cost </TH><TH align=center> Unit Tax </TH><TH align=center> Qty On Hand </TH><TH align=center> Qty BackOrdered </TH><TH align=center> Qty On Reserve </TH><TH align=center> Status </TH><TH align=center> Serial </TH>
            <%
                        /*
                         * Here will set up an arbitrary vector, containing four elements
                         */
                        Vector av = new Vector();
                        while (rs.next()) {
                           av.addElement("<a href=\"itemEdit.jsp?sku=" + rs.getInt("sku") + "\">&nbsp;" + rs.getInt("sku") + "&nbsp;</a>");
                           av.addElement(rs.getString("description"));
                           av.addElement(rs.getLong("unitPrice"));
                           av.addElement(rs.getLong("unitCost"));
                           av.addElement(rs.getLong("unitTax"));
                           av.addElement(rs.getInt("qtyOnHand"));
                           av.addElement(rs.getInt("qtyBackOrdered"));
                           av.addElement(rs.getInt("qtyOnReserve"));
                           av.addElement(rs.getString("status"));
                           av.addElement(rs.getInt("isSerial"));
                        }
                        out.print(hu.getTableContents("center", av, 10));
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