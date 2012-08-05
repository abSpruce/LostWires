<%-- 
    Document   : editcustomer
    Created on : Mar 30, 2011, 10:01:17 PM
    Author     : James Beckwith
    Author     : David Hayashida
--%>

<%@page import="lostwires.HtmlUtils"%>
<%@page language="java" import="java.io.*" %>
<%@page language="java" import="java.util.*" %>

<%-- Use Customer Bean for this page --%>
<jsp:useBean id="custBean"
             beanName="lostwires.customerBean"
             type="lostwires.customerBean"
             scope="page"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>LostWires: Modify Customer</title>
      <LINK REL=STYLESHEET
            HREF="lostwires.css"
            TYPE="text/css">
   </head>

   <body class="twoColFixLtHdr">

      <div id="container">
         <div id="header">
            <h1>Modify Customer Information</h1>
            <!-- end #header --></div>
            <jsp:include page="menu.html"/>
         <div id="mainContent">
            <!--            <h1>Modify Product Information</h1>-->

            <form id="frmCustomer" name="frmCustomer" method=post action="customerEditOutput.jsp">
               <%
                     // Get the entered ssn
                     String value = request.getParameter("customerID");

                     // Get the selected customer Record from the custBean
                     custBean.getCustomerRecord(Integer.parseInt(value));

                     // Begin creating the html response
                     //response.setContentType("text/html");
                     // Get the print writer
                     PrintWriter out1 = response.getWriter();
                     // Create the html utilities
                     HtmlUtils hu = new HtmlUtils();
                     // Create the header for the page
                     //out1.print(hu.createHtmlHeader("Edit Customer"));
                     // Begin creating the table for the page
                     //out1.print(hu.getTableHead("center", 1));
%>
               <TABLE align=center border=1>
                  <%

                        /*
                         * Here will set up an arbitrary vector, containing four elements
                         */
                        Vector av = new Vector();
                        av.addElement("Customer Data");
                        av.addElement("<input type=hidden id=\"customerID\" name=\"customerID\" "
                                + " value= \"" + custBean.getCustomerID() + "\"> "
                                + "</input>");
                        av.addElement("First Name");
                        av.addElement("<input type=text id=\"firstName\" name=\"firstName\" "
                                + " value= \"" + custBean.getFirstName() + "\"> "
                                + "</input>");
                        av.addElement("Last Name");
                        av.addElement("<input type=text id=\"lastName\" name=\"lastName\" "
                                + " value= \"" + custBean.getLastName() + "\"> "
                                + "</input>");
                        av.addElement("Address");
                        av.addElement("<input type=text id=\"streetAddress\" name=\"streetAddress\" "
                                + " value= \"" + custBean.getStreetAddress() + "\"> "
                                + "</input>");
                        av.addElement("City");
                        av.addElement("<input type=text id=\"city\" name=\"city\" "
                                + " value= \"" + custBean.getCity() + "\"> "
                                + "</input>");
                        av.addElement("Province");
                        av.addElement("<input type=text id=\"prov\" name=\"prov\" "
                                + " value= \"" + custBean.getProv() + "\"> "
                                + "</input>");
                        av.addElement("Postal Code");
                        av.addElement("<input type=text id=\"postCD\" name=\"postCD\" "
                                + " value= \"" + custBean.getPostCD() + "\"> "
                                + "</input>");
                        av.addElement("Telephone Number");
                        av.addElement("<input type=text id=\"telephone\" name=\"telephone\" "
                                + " value= \"" + custBean.getTelephone() + "\"> "
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