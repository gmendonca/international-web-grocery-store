package beans;

import java.util.*;
import java.text.*;

public class Order {
  private String first;
  private String last;
  private String address;
  private String card;
  private String name;
  private String date;
  private String cvc;
  private Double confNumber;
  private HashMap<String,Integer> products;

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

  @Override public String toString() {
      return String.format("Order: %f<br><br>Bought with the card: %s - **** **** **** %s<br><br>Products:", 
        this.confNumber ,this.name, this.card.substring(this.card.length() - 4));
  }

  public String showOrder(){
    return String.format("Order: %f<br>Bought with the card: %s - **** **** **** %s<br><br>", 
        this.confNumber ,this.name, this.card.substring(this.card.length() - 4));
  }
}
