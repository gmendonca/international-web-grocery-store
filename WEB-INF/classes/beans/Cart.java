package beans;

import java.util.*;

public class Cart {
  private HashMap<String,Integer> products;

  public Cart() {
      products = new HashMap<String,Integer>();
  }

  public HashMap<String,Integer> getProducts() {
      return products;
  }

  public void setProduct(String product) {
      if(products.containsKey(product))
        products.put(product, products.get(product)+1);
      else
        products.put(product,1);
  }

  public void removeProduct(String product) {
      if(products.containsKey(product))
        products.remove(product);
  }
}
