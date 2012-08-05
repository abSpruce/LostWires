/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lostwires;

import java.io.Serializable;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author James Beckwith
 * @author David Hayashida
 */
public class transactionLineBean implements Serializable {

   private int transactionID;
   private int transactionLineNumber;
   private int sku;
   private String serialNumber;
   private int qty = 1;
   private long unitPrice;
   private long unitCost;
   private long tax;
   // PreparedStatement for executing queries
   private DbBean db = new DbBean();
   private ResultSet rs = null;
   private PreparedStatement psItemQuery;
   private transactionBean transBean = new transactionBean();
   private itemBean itemBean = new itemBean();

   public transactionLineBean() {
   }

   public transactionLineBean(int transactionID, int sku, String serialNumber, int qty){
      this.transBean.setTransactionID(transactionID);
      this.sku = sku;
      this.itemBean.getItemRecord(sku);
      this.serialNumber = serialNumber;
      this.qty = qty;
      this.unitPrice = itemBean.getUnitPrice();
      this.unitCost = itemBean.getUnitCost();
      this.tax = itemBean.getUnitTax();

   }
   
   /**
    * @param  insert an item to the database
    */
   public void insertTransLineRecord() {
      String insertTransLine = String.format("INSERT INTO transactionline (transactionID, sku, serialNumber, qty, unitPrice, unitCost, tax) VALUES "
              + "(%d, %d, \"%s\",  %d, %d, %d, %d)",
              getTransactionID(), getSku(), getSerialNumber(), getQty(), getUnitPrice(), getUnitCost(), getTax());
      try {
         db.connect();
         int i = db.insertSQL(insertTransLine);
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(transactionLineBean.class.getName()).log(Level.SEVERE, null, ex);
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }

   /**
    * @param sku updates an item from the database
    */
   public void updateTransLineRecord(int pSku) {
      String updateTransLine = String.format("UPDATE transactionline SET sku = %d, serialNumber = \"%s\", qty = %d, unitPrice = %d, unitCost = %d, tax = %d WHERE transactionID = %d AND transactionLineNumber = %d",
              getSku(), getSerialNumber(), getQty(), getUnitPrice(), getUnitCost(), getTax(),
              getTransactionID(), getTransactionLineNumber());
      try {
         db.connect();
         int i = db.updateSQL(updateTransLine);
         //i = db.updateSQL("UPDATE employee set FIRSTNME = 'hello world' where EMPNO='000010'");
         //out.println(i);
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(transactionLineBean.class.getName()).log(Level.SEVERE, null, ex);
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }

   /**
    * @param sku retrieve an item from the database
    */
   public void getItemRecord(int pTransactionId, int pTransLineId) {
      // Create a statement
      String findTransLine = "Select * FROM transactionline WHERE transactionID = ? AND transactionLineNumber = ?";

      try {
         db.connect();
         rs = db.execPreSQL2(findTransLine, pTransactionId, pTransLineId);
         while (rs.next()) {
            setTransactionID(rs.getInt("transactionID"));
            setTransactionLineNumber(rs.getInt("transactionLineNumber"));
            setSku(rs.getInt("sku"));
            setSerialNumber(rs.getString("serialNumber"));
            setUnitPrice(rs.getLong("unitPrice"));
            setUnitCost(rs.getLong("unitCost"));
            setTax(rs.getLong("tax"));
         }
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(transactionLineBean.class.getName()).log(Level.SEVERE, null, ex);
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
    * @return the transactionLineNumber
    */
   public int getTransactionLineNumber() {
      return transactionLineNumber;
   }

   /**
    * @param transactionLineNumber the transactionLineNumber to set
    */
   public void setTransactionLineNumber(int transactionLineNumber) {
      this.transactionLineNumber = transactionLineNumber;
   }

   /**
    * @return the sku
    */
   public int getSku() {
      return sku;
   }

   /**
    * @param sku the sku to set
    */
   public void setSku(int sku) {
      this.sku = sku;
   }

   /**
    * @return the serialNumber
    */
   public String getSerialNumber() {
      return serialNumber;
   }

   /**
    * @param serialNumber the serialNumber to set
    */
   public void setSerialNumber(String serialNumber) {
      this.serialNumber = serialNumber;
   }

   /**
    * @return the qty
    */
   public int getQty() {
      return qty;
   }

   /**
    * @param qty the qty to set
    */
   public void setQty(int qty) {
      this.qty = qty;
   }

   /**
    * @return the unitPrice
    */
   public long getUnitPrice() {
      return unitPrice;
   }

   /**
    * @param unitPrice the unitPrice to set
    */
   public void setUnitPrice(long unitPrice) {
      this.unitPrice = unitPrice;
   }

   /**
    * @return the unitCost
    */
   public long getUnitCost() {
      return unitCost;
   }

   /**
    * @param unitCost the unitCost to set
    */
   public void setUnitCost(long unitCost) {
      this.unitCost = unitCost;
   }

   /**
    * @return the tax
    */
   public long getTax() {
      return tax;
   }

   /**
    * @param tax the tax to set
    */
   public void setTax(long tax) {
      this.tax = tax;
   }
}
