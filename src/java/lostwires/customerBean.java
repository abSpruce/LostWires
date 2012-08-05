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
 * @author noboru
 */
public class customerBean implements Serializable {
   // attributes of the customer / fields in Customer table

   private int customerID;
   private String firstName;
   private String lastName;
   private String streetAddress;
   private String city;
   private String prov;
   private String postCD;
   private String telephone;
   // PreparedStatement for executing queries
   private DbBean db = new DbBean();
   private ResultSet rs = null;
   private PreparedStatement psCustomerQuery;

   /**
    * Default constructor
    */
   public customerBean() {
      this.customerID = 0;
      this.firstName = "John";
      this.lastName = "Doe";
      this.streetAddress = "123 Main St.";
      this.city = "Big City";
      this.prov = "ON";
      this.postCD = "L1L1L1";
      this.telephone = "5555555555";
   }

   /**
    *  constructor
    */
   public customerBean(String firstName, String lastName, String streetAddress, String city,
           String prov, String postCD, String telephone) {
      this.customerID = (int) (Math.random() * 1000);
      this.firstName = firstName;
      this.lastName = lastName;
      this.streetAddress = streetAddress;
      this.city = city;
      this.prov = prov;
      this.postCD = postCD;
      this.telephone = telephone;
   }

   /**
    * @param customerID retrieve a customer from the database
    */
   public void insertCustomerRecord(){
      String insertCustomer = String.format("INSERT INTO customer (firstName, lastName, streetAddress, city, prov, postCD, telephone) VALUES (\"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\")",
              getFirstName(), getLastName(), getStreetAddress(), getCity(), getProv(),
              getPostCD(), getTelephone());
      try {
         db.connect();
         int i = db.insertSQL(insertCustomer);
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(customerBean.class.getName()).log(Level.SEVERE, null, ex);
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }

   /**
    * @param updates a customer from the database
    */
   public void updateCustomerRecord(int pCustomerId){
      String updateCustomer = String.format("UPDATE customer SET firstName = \"%s\", lastName = \"%s\", streetAddress = \"%s\", city = \"%s\", prov = \"%s\", postCD = \"%s\", telephone = \"%s\" WHERE customerID = %d",
              getFirstName(), getLastName(), getStreetAddress(), getCity(), getProv(), 
              getPostCD(), getTelephone(), getCustomerID());
      try {
         db.connect();
         int i = db.updateSQL(updateCustomer);
         //i = db.updateSQL("UPDATE employee set FIRSTNME = 'hello world' where EMPNO='000010'");
         //out.println(i);
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(customerBean.class.getName()).log(Level.SEVERE, null, ex);
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
   }

   /**
    * @param Inserts a customer record to the database
    */
   public void getCustomerRecord(int pCustomerId) {
      // Create a statement
      String findCustomer = "Select * FROM customer WHERE CustomerID = ?";

      try {
         db.connect();
         rs = db.execPreSQL(findCustomer, pCustomerId);
         //i = db.updateSQL("UPDATE employee set FIRSTNME = 'hello world' where EMPNO='000010'");
         //out.println(i);
         while (rs.next()) {
            setCustomerID(rs.getInt("CustomerID"));
            setFirstName(rs.getString("firstName"));
            setLastName(rs.getString("lastName"));
            setStreetAddress(rs.getString("streetAddress"));
            setCity(rs.getString("city"));
            setProv(rs.getString("prov"));
            setPostCD(rs.getString("postCD"));
            setTelephone(rs.getString("telephone"));
         }
      } catch (ClassNotFoundException ex) {
         Logger.getLogger(customerBean.class.getName()).log(Level.SEVERE, null, ex);
      } catch (SQLException ex) {
         ex.printStackTrace();
      }
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
    * @return the firstName
    */
   public String getFirstName() {
      return firstName;
   }

   /**
    * @param firstName the firstName to set
    */
   public void setFirstName(String firstName) {
      this.firstName = firstName;
   }

   /**
    * @return the lastName
    */
   public String getLastName() {
      return lastName;
   }

   /**
    * @param lastName the lastName to set
    */
   public void setLastName(String lastName) {
      this.lastName = lastName;
   }

   /**
    * @return the streetAddress
    */
   public String getStreetAddress() {
      return streetAddress;
   }

   /**
    * @param streetAddress the streetAddress to set
    */
   public void setStreetAddress(String streetAddress) {
      this.streetAddress = streetAddress;
   }

   /**
    * @return the city
    */
   public String getCity() {
      return city;
   }

   /**
    * @param city the city to set
    */
   public void setCity(String city) {
      this.city = city;
   }

   /**
    * @return the prov
    */
   public String getProv() {
      return prov;
   }

   /**
    * @param prov the prov to set
    */
   public void setProv(String prov) {
      this.prov = prov;
   }

   /**
    * @return the postCD
    */
   public String getPostCD() {
      return postCD;
   }

   /**
    * @param postCD the postCD to set
    */
   public void setPostCD(String postCD) {
      this.postCD = postCD;
   }

   /**
    * @return the telephone
    */
   public String getTelephone() {
      return telephone;
   }

   /**
    * @param telephone the telephone to set
    */
   public void setTelephone(String telephone) {
      this.telephone = telephone;
   }
}
