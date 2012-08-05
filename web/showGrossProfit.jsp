<%--
    Document   : supplierList
    Created on : Apr 9, 2011, 1:16:15 PM
    Author     : James Beckwith
    Author     : David Hayashida
--%>

<%@page import="lostwires.HtmlUtils"%>
<%@page language="java" import="java.sql.*" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="java.io.*" %>
<%@page import="javax.xml.transform.Source"%>

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
      <title>LostWires: Gross Profit</title>
      <LINK REL=STYLESHEET
            HREF="lostwires.css"
            TYPE="text/css">
   </head>

   <body class="twoColFixLtHdr">

      <div id="container">
         <div id="header">
            <h1>Gross Sales Profit for Period</h1>
            <!-- end #header --></div>
            <jsp:include page="menu.html"/>
         <div id="mainContent">

            <%
                  db.connect();

                  try {
                     rs = db.execSQL("select TH.date, tl.sku, SUM(TL.unitPrice*TL.qty - TL.unitCost*TL.qty)as Profit "
                             + "from `transaction` as TH , `transactionline` as TL "
                             + "where th.transactionID = tl.transactionID and th.date between '2011-04-01' and '2011-04-30' "
                             + "group by tl.sku, TH.`date` "
                             + "order by tl.sku   ");
                     // Get the print writer
                     PrintWriter out1 = response.getWriter();

                     // Create the html utilities
                     HtmlUtils hu = new HtmlUtils();

            %>
            <TABLE align=center border=1>
               <TH align=center> Date </TH><TH align=center> SKU </TH><TH align=center> Profit </TH>
               <%
                        /*
                         * Here will set up an arbitrary vector, containing four elements
                         */
                        Vector av = new Vector();
                        while (rs.next()) {
                           av.addElement(rs.getDate("date"));
                           av.addElement(rs.getInt("sku"));
                           av.addElement(rs.getLong("Profit"));
                        }
                        out.print(hu.getTableContents("center", av, 3));
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