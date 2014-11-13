import java.util.*;

public class Catalog{
    public HashMap<String,HashMap<String,HashMap<String,ArrayList<String>>>> catalog;


    public void insertData(){
        catalog = new HashMap<String,HashMap<String,HashMap<String,ArrayList<String>>>>();
        HashMap<String,HashMap<String,ArrayList<String>>> categories;
        HashMap<String,ArrayList<String>> products;
        ArrayList<String> productInfo;

        //Brazil
        categories = new HashMap<String,HashMap<String,ArrayList<String>>>();

        //Grains
        products = new HashMap<String,ArrayList<String>>();
        //First Product
        productInfo = new ArrayList<String>(
        Arrays.asList("Feijoada - Meat & Black Bean Casserole-18 Oz","4.99"));
        products.put("br001", productInfo);
        //Second Product
        productInfo = new ArrayList<String>(
        Arrays.asList("Café 3 Corações 500g","9.99"));
        products.put("br002", productInfo);
        //put all product of the same category
        categories.put("grains", products);

        //Cereals
        products = new HashMap<String,ArrayList<String>>();
        //First Product
        productInfo = new ArrayList<String>(
        Arrays.asList("Kimilho Flocão - Yoki 500 grams","3.99"));
        products.put("br003", productInfo);
        //Second Product
        productInfo = new ArrayList<String>(
        Arrays.asList("Milharina Quaker - 500g ","3.49"));
        products.put("br004", productInfo);
        //put all product of the same category
        categories.put("cereals", products);

        //put all the categories inside a country
        catalog.put("brazil", categories);

    }

    public static void main(String[] args){
        Catalog c = new Catalog();
        c.insertData();
        System.out.println("Categories: ");
        for(Map.Entry me : c.catalog.get("brazil").entrySet()){
            System.out.println(me.getKey() + ": ");
            for(Map.Entry me2 : c.catalog.get("brazil").get(me.getKey()).entrySet()){
                System.out.println("    " + me2.getKey());
                System.out.println("        " + ((ArrayList<String>)me2.getValue()).get(0));
                System.out.println("        " + ((ArrayList<String>)me2.getValue()).get(1));
            }
        }


    }
}
