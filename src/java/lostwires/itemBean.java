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
public class itemBean implements Serializable {

   private int sku;
   private String description;
   private long unitPrice = 0;
   private long unitCost = 0;
   private long unitTax = 0;
   private int qtyOnHand = 0;
   private int qtyBackOrdered = 0;
   private int qtyOnReserve = 0;
   private String status;
   private int isSerial;

   private int dbaction = 0; // 0 - Insert 1 - Update
   // PreparedStatement for executing queries
   private DbBean db = new DbBean();
   private ResultSet rs = null;
   private PreparedStatement psItemQuery;

   public itemBean() {
      this.sku = 0;
      this.description = "New Item";
      this.status = "New";
      this.isSerial = 0;
      //this.unitPrice = 0.00;
      //this.unitCost = 0.00;
      //this.unitTax = 0.00;
   }

   /**
    * @param  insert an item to the database
    */
   public void insertItemRecord() {
      String insertItem = String.format("INSERT INTO item (SKU, description, unitPrice, unitCost, unitTax, qtyOnHand, qtyBackOrdered, qtyOnReserve, status, isSerial) VALUES "
              + "(%d, \"%s\", %d, %d, %d, %d, %d, %d, \"%s\", %d)",
              getSku(), getDescription(), getUnitPrice(), getUnitCost(), getUnitTax(),
              getQtyOnHand(), getQtyBackOrdered(), getQtyOnReserve(), getStatus(), getIsSerial());
      try {
         db.connect();
         int i = db.insertSQL(insertItem);
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(itemBean.class.getName()).log(Level.SEVERE, null, ex);
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }

   /**
    * @param sku updates an item from the database
    */
   public void updateItemRecord(int pSku) {
      String updateItem = String.format("UPDATE item SET description = \"%s\", unitPrice = %d, unitCost = %d, unitTax = %d, qtyOnHand = %d, qtyBackOrdered = %d, qtyOnReserve = %d, status = \"%s\", isSerial = %d WHERE sku = %d",
              getDescription(), getUnitPrice(), getUnitCost(), getUnitTax(), getQtyOnHand(),
              getQtyBackOrdered(), getQtyOnReserve(), getStatus(), getIsSerial(), getSku());
      try {
         db.connect();
         int i = db.updateSQL(updateItem);
         //i = db.updateSQL("UPDATE employee set FIRSTNME = 'hello world' where EMPNO='000010'");
         //out.println(i);
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(itemBean.class.getName()).log(Level.SEVERE, null, ex);
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }
   public void updateItemQtyRecord(int pSku) {
      String updateItem = String.format("UPDATE item SET qtyOnHand = qtyOnHand - %d, qtyOnReserve = qtyOnReserve + %d WHERE sku = %d",
              getQtyOnReserve(), getQtyOnReserve(), getSku());
      try {
         db.connect();
         int i = db.updateSQL(updateItem);
         //i = db.updateSQL("UPDATE employee set FIRSTNME = 'hello world' where EMPNO='000010'");
         //out.println(i);
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(itemBean.class.getName()).log(Level.SEVERE, null, ex);
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }
   /**
    * @param sku retrieve an item from the database
    */
   public void getItemRecord(int pSku) {
      // Create a statement
      String findItem = "Select * FROM item WHERE sku = ?";

      try {
         db.connect();
         rs = db.execPreSQL(findItem, pSku);
         while (rs.next()) {
            setSku(rs.getInt("sku"));
            setDescription(rs.getString("description"));
            setUnitPrice(rs.getLong("unitPrice"));
            setUnitCost(rs.getLong("unitCost"));
            setUnitTax(rs.getLong("unitTax"));
            setQtyOnHand(rs.getInt("qtyOnHand"));
            setQtyOnReserve(rs.getInt("qtyBackOrdered"));
            setQtyOnReserve(rs.getInt("qtyOnReserve"));
            setStatus(rs.getString("status"));
            setIsSerial(rs.getInt("isSerial"));
         }
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(itemBean.class.getName()).log(Level.SEVERE, null, ex);
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
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
    * @return the description
    */
   public String getDescription() {
      return description;
   }

   /**
    * @param description the description to set
    */
   public void setDescription(String description) {
      this.description = description;
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
    * @return the unitTax
    */
   public long getUnitTax() {
      return unitTax;
   }

   /**
    * @param unitTax the unitTax to set
    */
   public void setUnitTax(long unitTax) {
      this.unitTax = unitTax;
   }

   /**
    * @return the qtyOnHand
    */
   public int getQtyOnHand() {
      return qtyOnHand;
   }

   /**
    * @param qtyOnHand the qtyOnHand to set
    */
   public void setQtyOnHand(int qtyOnHand) {
      this.qtyOnHand = qtyOnHand;
   }

   /**
    * @return the qtyBackOrdered
    */
   public int getQtyBackOrdered() {
      return qtyBackOrdered;
   }

   /**
    * @param qtyBackOrdered the qtyBackOrdered to set
    */
   public void setQtyBackOrdered(int qtyBackOrdered) {
      this.qtyBackOrdered = qtyBackOrdered;
   }

   /**
    * @return the qtyOnReserve
    */
   public int getQtyOnReserve() {
      return qtyOnReserve;
   }

   /**
    * @param qtyOnReserve the qtyOnReserve to set
    */
   public void setQtyOnReserve(int qtyOnReserve) {
      this.qtyOnReserve = qtyOnReserve;
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

   /**
    * @return the isSerial
    */
   public int getIsSerial() {
      return isSerial;
   }

   /**
    * @param isSerial the isSerial to set
    */
   public void setIsSerial(int isSerial) {
      this.isSerial = isSerial;
   }

   /**
    * @return the isSerial
    */
   public int getDbaction() {
      return dbaction;
   }

   /**
    * @param isSerial the isSerial to set
    */
   public void setDbaction(int dbaction) {
      this.dbaction = dbaction;
   }

}
