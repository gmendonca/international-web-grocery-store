package beans;

import java.util.*;
import java.text.*;
import java.io.*;

public class Order implements Serializable{
  private String first;
  private String last;
  private String address;
  private String card;
  private String name;
  private String date;
  private String cvc;
  private Double confNumber;
  private HashMap<String,Integer> products;
  private Date purchaseDate;
  private Date deliveryDate;
  private Date cancellationDate;

  public Order(){
    confNumber = (1000000 + (Math.random() * (9999999 - 1000000)));
    products = new HashMap<String,Integer>();
  }

  public String getConf(){
    return Double.toString(confNumber);
  }

  public Order getOrder() {
    return this;
  }

  public void setFirst(String first) {
    this.first = first;
  }

  public void setLast(String last) {
    this.last = last;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public void setCard(String card) {
    this.card = card;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setDate(String date) {
    this.date = date;
  }

  public void setCvc(String cvc) {
    this.cvc = cvc;
  }

  public void setProducts(HashMap<String,Integer> products) {
    this.products.putAll(products);
  }

  public void setPurchaseDate(Date date){
      this.purchaseDate = date;
  }

  public void setDeliveryDate(Date date){
      this.deliveryDate = date;
  }

  public void setCancellationDate(Date date){
      this.cancellationDate = date;
  }

  public Date getPurchaseDate(){
      return purchaseDate;
  }

  public Date getDeliveryDate(){
      return deliveryDate;
  }

  public Date getCancellationDate() {
      return cancellationDate;
  }

  @Override public String toString() {
      return String.format("Order: %f<br><br>Bought with the card: %s - **** **** **** %s<br><br>Products:",
        this.confNumber ,this.name, this.card.substring(this.card.length() - 4));
  }

  public String showOrder(){
    return String.format("Order: %f<br>Bought with the card: %s - **** **** **** %s<br><br>",
        this.confNumber ,this.name, this.card.substring(this.card.length() - 4));
  }
}
