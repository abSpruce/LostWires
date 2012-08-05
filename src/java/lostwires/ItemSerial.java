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
public class ItemSerial {
  private String sku;
  private String serialNumber;
  private String idSupplier;
  private String status;

  public ItemSerial() {}

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


}
