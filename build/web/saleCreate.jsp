<%--
    Document   : saleCreate
    Created on : 9-Apr-2011, 4:35:25 PM
    Author     : James Beckwith
    Author     : David Hayashida
--%>

<%@page import="lostwires.HtmlUtils"%>
<%@page language="java" import="java.io.*" %>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="java.sql.*" %>
<%@ page language="java"%>

<%-- Use Customer Bean for this page --%>
<jsp:useBean id="custBean"
             beanName="lostwires.customerBean"
             type="lostwires.customerBean"
             scope="session"/>
<%-- jsp:setProperty will request all the values from
     the previous page and calls the appropriate setter
     methods to set all the properties
--%>
<jsp:setProperty name="custBean" property="*"/>

<%-- Use Transaction Bean for this page --%>
<jsp:useBean id="transactionBean"
             beanName="lostwires.transactionBean"
             type="lostwires.transactionBean"
             scope="session"/>

<%-- Use item Bean for this page --%>
<jsp:useBean id="itemBean"
             beanName="lostwires.itemBean"
             type="lostwires.itemBean"
             scope="page"/>

<%-- Use Transaction line Bean for this page --%>
<jsp:useBean id="transactionLineBean"
             beanName="lostwires.transactionLineBean"
             type="lostwires.transactionLineBean"
             scope="page"/>

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


<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>LostWires: Create Sales</title>
      <LINK REL=STYLESHEET
            HREF="lostwires.css"
            TYPE="text/css">
      <script type="text/javascript" language="JavaScript">
         function loadItemBean(){
            if (frmCustomer.sku.value != ""){
               itemBean.getItemRecord(frmCustomer.sku.valueOf());
            }
         }
      </script>
   </head>

   <body class="twoColFixLtHdr">

      <div id="container">
         <div id="header">
            <h1>Sales Information you keyed in</h1>
            <!-- end #header --></div>
            <jsp:include page="menu.html"/>
         <div id="mainContent">

            <form id="frmSales" name="frmSales" method=post action="salesEditOutput.jsp">
               <h3>
                  Sale order for
               </h3>
               <%
                     // Get the print writer
                     PrintWriter out1 = response.getWriter();

                     // Create the html utilities
                     HtmlUtils hu = new HtmlUtils();
               %>
               <TABLE align=center border=1>
<!--                  <TH align=center> First Name </TH><TH align=center> Last Name </TH><TH align=center> Street Address </TH><TH align=center> City </TH><TH align=center> Province </TH><TH align=center> Postal Code </TH><TH align=center> Telephone Number </TH>-->
                  <%
                        custBean.getCustomerRecord(custBean.getCustomerID());
                        transactionBean.setCustomerID(custBean.getCustomerID());

                        /*
                         * Here will set up an arbitrary vector, containing four elements
                         */
                        Vector av = new Vector();
                        av.addElement(custBean.getFirstName() + " " + custBean.getLastName());
                        av.addElement(custBean.getStreetAddress());
                        av.addElement(custBean.getCity() + ", " + custBean.getProv() + " " + custBean.getPostCD());
                        out.print(hu.getTableContents("center", av, 1));
                  %>
               </TABLE>
               <TABLE align=center border=1>
                  <TH align=center> SKU </TH><TH align=center> Description </TH><TH align=center> Qty </TH><TH align=center> Unit Price </TH><TH align=center> On Hand Qty </TH>

                  <%
                     db.connect();

                     try {
                        rs = db.execSQL("SELECT * FROM item");

                        /*
                         * Here will set up an arbitrary vector, containing four elements
                         */
                        Vector av1 = new Vector();
                        while (rs.next()) {
                           av1.addElement(rs.getInt("sku"));
                           av1.addElement(rs.getString("description"));
                           av1.addElement("<input type=text id=\"" + rs.getInt("sku")+ "\" name=\""+ rs.getInt("sku")+"\" "
                                + " value= \"" + 0 + "\"> "
                                + "</input>");
                           av1.addElement(rs.getLong("unitPrice"));
                           av1.addElement(rs.getInt("qtyOnHand"));
                        }

                        av1.addElement("<input type=submit id=\"btnSubmit\" name=\"btnSubmit\" value=\"Submit\"></input>");
                        av1.addElement("<input type=button id=\"btnCancel\" name=\"btnCancel\" value=\"Cancel\"></input>");
                        out.print(hu.getTableContents("center", av1, 5));

                     } catch (SQLException e) {
                        throw new ServletException("Your query is not working", e);
                     } finally {
                        db.close();
                     }

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