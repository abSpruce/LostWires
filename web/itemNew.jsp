<%--
    Document   : itemNew
    Created on : Apr 9, 2011, 1:16:15 PM
    Author     : James Beckwith
    Author     : David Hayashida
--%>
<%@page import="lostwires.HtmlUtils"%>
<%@page language="java" import="java.io.*" %>
<%@page language="java" import="java.util.*" %>
<%@ page language="java"%>

<%-- Use itemBean Bean for this page --%>
<jsp:useBean id="itemBean"
             beanName="lostwires.itemBean"
             type="lostwires.itemBean"
             scope="page"/>
<%-- This will initialize the bean with default values provided
    in the constructor --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>LostWires: New Product</title>
      <LINK REL=STYLESHEET
            HREF="lostwires.css"
            TYPE="text/css">
   </head>

   <body class="twoColFixLtHdr">

      <div id="container">
         <div id="header">
            <h1>Add New Product</h1>
            <!-- end #header --></div>
            <jsp:include page="menu.html"/>
         <div id="mainContent">
<!--            <h1>Add New Product</h1>-->

            <form class="mainContent"id="frmItem" name="frmItem" method=post action="itemEditOutput.jsp">
               <%
                     // Begin creating the html response
                     //response.setContentType("text/html");
                     // Get the print writer
                     PrintWriter out1 = response.getWriter();

                     // Create the html utilities
                     HtmlUtils hu = new HtmlUtils();

                     // Create the header for the page
                     //out1.print(hu.createHtmlHeader("Add itemBean"));

                     // Begin creating the table for the page
                     //out1.print(hu.getTableHead("center", 1));
               %>
               <TABLE align=center border=1>
                  <%

                        /*
                         * Here will set up an arbitrary vector, containing four elements
                         */
                        Vector av = new Vector();
                        av.addElement("SKU");
                        av.addElement("<input type=text id=\"sku\" name=\"sku\" "
                                + " value= \"" + itemBean.getSku() + "\"> "
                                + "</input>");
                        av.addElement("Description");
                        av.addElement("<input type=text id=\"description\" name=\"description\" "
                                + " value= \"" + itemBean.getDescription() + "\"> "
                                + "</input>");
                        av.addElement("Unit Price");
                        av.addElement("<input type=text id=\"unitPrice\" name=\"unitPrice\" "
                                + " value= \"" + itemBean.getUnitPrice() + "\"> "
                                + "</input>");
                        av.addElement("Unit Cost");
                        av.addElement("<input type=text id=\"unitCost\" name=\"unitCost\" "
                                + " value= \"" + itemBean.getUnitCost() + "\"> "
                                + "</input>");
                        av.addElement("Unit Tax");
                        av.addElement("<input type=text id=\"unitTax\" name=\"unitTax\" "
                                + " value= \"" + itemBean.getUnitTax() + "\"> "
                                + "</input>");
                        av.addElement("Qty On Hand");
                        av.addElement("<input type=text id=\"qtyOnHand\" name=\"qtyOnHand\" "
                                + " value= \"" + itemBean.getQtyOnHand() + "\"> "
                                + "</input>");
                        av.addElement("Qty Back Ordered");
                        av.addElement("<input type=text id=\"qtyBackOrdered\" name=\"qtyBackOrdered\" "
                                + " value= \"" + itemBean.getQtyBackOrdered() + "\"> "
                                + "</input>");
                        av.addElement("Qty On Reserve");
                        av.addElement("<input type=text id=\"qtyOnReserve\" name=\"qtyOnReserve\" "
                                + " value= \"" + itemBean.getQtyOnReserve() + "\"> "
                                + "</input>");
                        av.addElement("Status");
                        av.addElement("<input type=text id=\"status\" name=\"status\" "
                                + " value= \"" + itemBean.getStatus() + "\"> "
                                + "</input>");
                        av.addElement("Serial");
                        av.addElement("<input type=text id=\"isSerial\" name=\"isSerial\" "
                                + " value= \"" + itemBean.getIsSerial() + "\"> "
                                + "</input>");
                        av.addElement("<input type=submit id=\"btnSubmit\" name=\"btnSubmit\" value=\"Submit\"></input>");
                        av.addElement("<input type=button id=\"btnCancel\" name=\"btnCancel\" value=\"Cancel\"></input>");
                        out.print(hu.getTableContents("center", av, 2));
                        //out.print(hu.getHtmlFooter());
%>
               </TABLE>
            </form>

            <!-- end #mainContent --></div>
         <!-- force the #container div to contain all child floats -->
         <br class="clearfloat" />
         <div id="footer">
            <p>Footer</p>
            <!-- end #footer --></div>
         <!-- end #container --></div>
   </body>
</html>