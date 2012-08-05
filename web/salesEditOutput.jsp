<%-- 
    Document   : salesEditOutput
    Created on : 9-Apr-2011, 4:35:25 PM
    Author     : James Beckwith
    Author     : David Hayashida
--%>

<%@page import="lostwires.HtmlUtils"%>
<%@page language="java" import="java.io.*" %>
<%@page language="java" import="java.util.*" %>
<%@ page language="java"%>

<%-- Use Transaction Bean for this page --%>
<jsp:useBean id="transactionBean"
             beanName="lostwires.transactionBean"
             type="lostwires.transactionBean"
             scope="request"/>
<jsp:setProperty name="transactionBean" property="*"/>

<%-- Use Transaction line Bean for this page --%>
<jsp:useBean id="transactionLineBean"
             beanName="lostwires.transactionLineBean"
             type="lostwires.transactionLineBean"
             scope="page"/>

<%-- Use item Bean for this page --%>
<jsp:useBean id="itemBean"
             beanName="lostwires.itemBean"
             type="lostwires.itemBean"
             scope="page"/>

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

<jsp:useBean id="db"
             beanName="lostwires.DbBean"
             type="lostwires.DbBean"
             scope="page"/>

<jsp:setProperty name="db" property="*" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>LostWires: Sales Data Entered</title>
      <LINK REL=STYLESHEET
            HREF="lostwires.css"
            TYPE="text/css">
   </head>

   <body class="twoColFixLtHdr">

      <div id="container">
         <div id="header">
            <h1>Sales Information entered</h1>
            <!-- end #header --></div>
            <jsp:include page="menu.html"/>
         <div id="mainContent">

            <TABLE ALIGN=CENTER BORDER=1>
               <tr><th> Input Name </th><th> Value </th>

                  <%
                        //transactionBean.setCustomerID(custBean.getCustomerID());
                        transactionBean.insertTransRecord();

                        Enumeration enum1 = request.getParameterNames();

                        while (enum1.hasMoreElements()) {
                           String sku = (String) enum1.nextElement();
                           String value = request.getParameter(sku);

                           if (value ==  "Submit") {
                           }
                           else {
                              if (Integer.parseInt(value) != 0) {
                                 itemBean.getItemRecord(Integer.parseInt(sku));
                                 transactionLineBean.setTransactionID(transactionBean.getTransactionID());
                                 transactionLineBean.setSku(Integer.parseInt(sku));
                                 transactionLineBean.setQty(Integer.parseInt(value));
                                 transactionLineBean.setSerialNumber("");
                                 transactionLineBean.setUnitCost(itemBean.getUnitCost());
                                 transactionLineBean.setUnitPrice(itemBean.getUnitPrice());
                                 transactionLineBean.setTax(itemBean.getUnitTax());
                                 transactionLineBean.insertTransLineRecord();
                              }
                           }
                        }
                  %>
            </TABLE><BR>

            <!-- end #mainContent --></div>
         <!-- force the #container div to contain all child floats -->
         <br class="clearfloat" />
         <div id="footer">
            <p>Footer</p>
            <!-- end #footer --></div>
         <!-- end #container --></div>
   </body>
</html>
