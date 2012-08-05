/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lostwires;

/**
 *
 * @author noboru
 */
import java.sql.*;
import java.io.*;

public class DbBean {

   String dbURL = "jdbc:mysql://localhost/lostwires";
   String userid = "root";
   String psword = "princess";
   String dbDriver = "com.mysql.jdbc.Driver";
   private Connection dbCon;

   public DbBean() {
      super();
   }

   public boolean connect() throws ClassNotFoundException, SQLException {
      Class.forName(dbDriver);
      dbCon = DriverManager.getConnection(dbURL, userid, psword);
      return true;
   }

   public void close() throws SQLException {
      dbCon.close();
   }

   public ResultSet execSQL(String sql) throws SQLException {
      Statement s = dbCon.createStatement();
      ResultSet r = s.executeQuery(sql);
      return (r == null) ? null : r;
   }

   public ResultSet execPreSQL(String sql, int param) throws SQLException {
      // Create a statement
      PreparedStatement ps = dbCon.prepareStatement(sql);
      // Prepart the SQL statement with the requested ssn
      ps.setInt(1, param);
      // Excute the querty to find the records
      ResultSet r = ps.executeQuery();
      return (r == null) ? null : r;
   }


   public ResultSet execPreSQL2(String sql, int param, int param2) throws SQLException {
      // Create a statement
      PreparedStatement ps = dbCon.prepareStatement(sql);
      // Prepart the SQL statement with the requested ssn
      ps.setInt(1, param);
      ps.setInt(2, param2);
      // Excute the querty to find the records
      ResultSet r = ps.executeQuery();
      return (r == null) ? null : r;
   }


   public int updateSQL(String sql) throws SQLException {
      Statement s = dbCon.createStatement();
      int r = s.executeUpdate(sql);
      return (r == 0) ? 0 : r;
   }

   public int insertSQL(String sql) throws SQLException {
      Statement s = dbCon.createStatement();
      int r = s.executeUpdate(sql);
      return (r == 0) ? 0 : r;
   }
}
