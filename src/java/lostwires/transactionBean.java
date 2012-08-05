/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lostwires;

import java.io.Serializable;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;

/**
 *
 * @author James Beckwith
 * @author David Hayashida
 */
public class transactionBean implements Serializable {

   private int transactionID;
   private Date date;
   private int customerID;
   private String type;
   private String status;
   // PreparedStatement for executing queries
   private DbBean db = new DbBean();
   private ResultSet rs = null;
   private PreparedStatement psItemQuery;

   public transactionBean() {
      this.date = new java.util.Date();
      this.type = "Sale";
      this.status = "New";
   }

   public transactionBean(int customerID) {
      super();
      this.customerID = customerID;
   }

   /**
    * @param  insert an item to the database
    */
   public void insertTransRecord() {
      String insertTrans = String.format("INSERT INTO transaction (date, customerID, type, status) VALUES "
              + "(\"%s\", \"%s\", \"%s\", \"%s\")",
              getDate(), getCustomerID(), getType(), getStatus());
      try {
         db.connect();
         int i = db.insertSQL(insertTrans);
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(transactionBean.class.getName()).log(Level.SEVERE, null, ex);
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }

   /**
    * @param sku updates an item from the database
    */
   public void updateTransRecord(int pSku) {
      String updateTrans = String.format("UPDATE transaction SET date = \"%s\", customerID = \"%s\", type = \"%s\", status = \"%s\" WHERE transactionID = %d",
              getDate(), getCustomerID(), getType(), getStatus(), getTransactionID());
      try {
         db.connect();
         int i = db.updateSQL(updateTrans);
         //i = db.updateSQL("UPDATE employee set FIRSTNME = 'hello world' where EMPNO='000010'");
         //out.println(i);
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(transactionBean.class.getName()).log(Level.SEVERE, null, ex);
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }

   /**
    * @param sku retrieve an item from the database
    */
   public void getTransRecord(int pTransactionID) {
      // Create a statement
      String findTrans = "Select * FROM transaction WHERE transactionID = ?";

      try {
         db.connect();
         rs = db.execPreSQL(findTrans, pTransactionID);
         while (rs.next()) {
            setTransactionID(rs.getInt("transactionID"));
            setDate(rs.getDate("date"));
            setType(rs.getString("type"));
            setStatus(rs.getString("status"));
         }
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(transactionBean.class.getName()).log(Level.SEVERE, null, ex);
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }
   /**
    * @return the transactionID
    */
   public int getTransactionID() {
      return transactionID;
   }

   /**
    * @param transactionID the transactionID to set
    */
   public void setTransactionID(int transactionID) {
      this.transactionID = transactionID;
   }

   /**
    * @return the date
    */
   public Date getDate() {
      return date;
   }

   /**
    * @param date the date to set
    */
   public void setDate(Date date) {
      this.date = date;
   }

   /**
    * @return the customerID
    */
   public int getCustomerID() {
      return customerID;
   }

   /**
    * @param customerID the customerID to set
    */
   public void setCustomerID(int customerID) {
      this.customerID = customerID;
   }

   /**
    * @return the type
    */
   public String getType() {
      return type;
   }

   /**
    * @param type the type to set
    */
   public void setType(String type) {
      this.type = type;
   }

   /**
    * @return the status
    */
   public String getStatus() {
      return status;
   }

   /**
    * @param status the status to set
    */
   public void setStatus(String status) {
      this.status = status;
   }
}
