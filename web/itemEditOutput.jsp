<%-- 
    Document   : itemEditOutput
    Created on : 9-Apr-2011, 4:35:25 PM
    Author     : James Beckwith
    Author     : David Hayashida
--%>

<%@page import="lostwires.HtmlUtils"%>
<%@page language="java" import="java.io.*" %>
<%@page language="java" import="java.util.*" %>
<%@ page language="java"%>

<%-- Use item Bean for this page --%>
<jsp:useBean id="itemBean"
             beanName="lostwires.itemBean"
             type="lostwires.itemBean"
             scope="request"/>
<%-- jsp:setProperty will request all the values from
     the previous page and calls the appropriate setter
     methods to set all the properties
--%>
<jsp:setProperty name="itemBean" property="*"/>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>LostWires: Modify Product</title>
      <LINK REL=STYLESHEET
            HREF="lostwires.css"
            TYPE="text/css">
   </head>

   <body class="twoColFixLtHdr">

      <div id="container">
         <div id="header">
            <h1>Item Information you keyed in</h1>
            <!-- end #header --></div>
            <jsp:include page="menu.html"/>
         <div id="mainContent">
<!--            <h1>Item Information you keyed in</h1>-->

            <form action=""  id="frmItem" name="frmItem" method=post>
               <%
                     if (itemBean.getDbaction() == 0) {
                        itemBean.insertItemRecord();
                     } else if (itemBean.getDbaction() == 1) {
                        itemBean.updateItemRecord(itemBean.getSku());
                     } else {
                        itemBean.updateItemQtyRecord(itemBean.getSku());
                     }
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
                        av.addElement(itemBean.getSku());
                        av.addElement(itemBean.getDescription());
                        av.addElement(itemBean.getUnitPrice());
                        av.addElement(itemBean.getUnitCost());
                        av.addElement(itemBean.getUnitTax());
                        av.addElement(itemBean.getQtyOnHand());
                        av.addElement(itemBean.getQtyBackOrdered());
                        av.addElement(itemBean.getQtyOnReserve());
                        av.addElement(itemBean.getStatus());
                        av.addElement(itemBean.getIsSerial());
                        out.print(hu.getTableContents("center", av, 10));
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