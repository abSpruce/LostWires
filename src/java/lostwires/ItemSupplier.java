/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package lostwires;

/**
 *
 * @author James Beckwith
 * @author David Hayashida
 */
public class ItemSupplier {
  private String sku;
  private String idSupplier;
  private String status;
  private long unitPrice = 0;
  private long retailPrice = 0;

  public ItemSupplier() {}

  /**
   * @return the sku
   */
  public String getSku() {
    return sku;
  }

  /**
   * @param sku the sku to set
   */
  public void setSku(String sku) {
    this.sku = sku;
  }

  /**
   * @return the idSupplier
   */
  public String getIdSupplier() {
    return idSupplier;
  }

  /**
   * @param idSupplier the idSupplier to set
   */
  public void setIdSupplier(String idSupplier) {
    this.idSupplier = idSupplier;
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
   * @return the retailPrice
   */
  public long getRetailPrice() {
    return retailPrice;
  }

  /**
   * @param retailPrice the retailPrice to set
   */
  public void setRetailPrice(long retailPrice) {
    this.retailPrice = retailPrice;
  }

}
