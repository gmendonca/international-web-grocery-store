package beans;

import java.util.*;

public class Catalog {

    private HashMap<String, ProductData> catalog = new HashMap<String, ProductData>();;


    public HashMap<String, ProductData> getProducts() {
        return catalog;
    }

    public Catalog() {
        catalog.put("br001",new ProductData("br001","Beans","Feijoada - Meat & Black Bean Casserole-18 Oz","Brazil",4.99));
        catalog.put("br002",new ProductData("br002","Beans","Feijão Preto GOYA - 24 Oz(Black Beans)","Brazil",3.39));
        catalog.put("br003",new ProductData("br003","Beans","Carioca Beans -18 Oz","Brazil",3.25));
        catalog.put("br004",new ProductData("br004","Beverages","Café 3 Corações 500g ","Brazil",9.99));
        catalog.put("br005",new ProductData("br005","Beverages","Suco de Cajú 500ml (Da Fruta ou Maguary)","Brazil",3.99));
        catalog.put("br006",new ProductData("br006","Beverages","Guarana Brazilia 2 liters","Brazil",3.29));

    }

}
