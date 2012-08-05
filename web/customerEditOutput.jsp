<%-- 
    Document   : customerEditOutput
    Created on : 9-Apr-2011, 4:35:25 PM
    Author     : James Beckwith
    Author     : David Hayashida
--%>

<%@page import="lostwires.HtmlUtils"%>
<%@page language="java" import="java.io.*" %>
<%@page language="java" import="java.util.*" %>
<%@ page language="java"%>

<%-- Use Customer Bean for this page --%>
<jsp:useBean id="custBean"
             beanName="lostwires.customerBean"
             type="lostwires.customerBean"
             scope="request"/>
<%-- jsp:setProperty will request all the values from
     the previous page and calls the appropriate setter
     methods to set all the properties
--%>
<jsp:setProperty name="custBean" property="*"/>
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
            <h1>Customer Information you keyed in</h1>
            <!-- end #header --></div>
            <jsp:include page="menu.html"/>
         <div id="mainContent">

            <form action=""  id="frmCustomer" name="frmCustomer" method=post>
               <%
                     if (custBean.getCustomerID() == 0) {
                        custBean.insertCustomerRecord();
                     } else {
                        custBean.updateCustomerRecord(custBean.getCustomerID());
                     }
                     // Begin creating the html response
                     //response.setContentType("text/html");
                     // Get the print writer
                     PrintWriter out1 = response.getWriter();

                     // Create the html utilities
                     HtmlUtils hu = new HtmlUtils();

               %>
               <TABLE align=center border=1>
                  <TH align=center> First Name </TH><TH align=center> Last Name </TH><TH align=center> Street Address </TH><TH align=center> City </TH><TH align=center> Province </TH><TH align=center> Postal Code </TH><TH align=center> Telephone Number </TH>
                  <%
                        /*
                         * Here will set up an arbitrary vector, containing four elements
                         */
                        Vector av = new Vector();
                        av.addElement(custBean.getFirstName());
                        av.addElement(custBean.getLastName());
                        av.addElement(custBean.getStreetAddress());
                        av.addElement(custBean.getCity());
                        av.addElement(custBean.getProv());
                        av.addElement(custBean.getPostCD());
                        av.addElement(custBean.getTelephone());
                        out.print(hu.getTableContents("center", av, 7));
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