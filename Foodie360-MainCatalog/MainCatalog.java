import java.util.*;
import java.io.*;
import java.lang.*;
public class MainCatalog implements Serializable{

	private HashMap<String,HashMap<String,String[][]>> catalog;
	public void setHashMap(){

		//creating hashmap to store the products
		 catalog = new HashMap<String,HashMap<String,String[][]>>();

		//create a nested hashmap to store items based on categories
		HashMap<String,String[][]> items1 = new HashMap<String,String[][]>();
		String[][] beans1 = {
								{"br001","Feijoada - Meat & Black Bean Casserole-18 Oz","4.99"},
								{"br002","Feijão Preto GOYA - 24 Oz(Black Beans)","3.39"},
								{"br003","Carioca Beans -18 Oz","3.25"}
							};
		items1.put("beans",beans1);
		String[][] bevarages1= { 
									{"br004","Café 3 Corações 500g ","9.99"},
									{"br005","Suco de Cajú 500ml (Da Fruta ou Maguary)","3.99"},
									{"br006","Guarana Brazilia 2 liters ","3.29"}
							   };
	    items1.put("beverages",bevarages1);
	    String[][] cereals1= {

	    						{"br007","Kimilho Flocão - Yoki 500 grams","3.99"},
	    						{"br008","Milharina Quaker - 500g ","3.49"},
	    						{"br009","Trigo para Kibe Yoki - 500g ","3.49"}
	    				 };

	    items1.put("cereals",cereals1);
	    //add the nested hashmap into the main hashmap based on the countries
	    catalog.put("brazil",items1);

	    HashMap<String,String[][]> items2 = new HashMap<String,String[][]>();
	    String[][] beans2 = {

	    						{"ch001","Soy beans", "2.95"},
	    						{"ch002","Black beans","3.45"},
	    						{"ch003","Split Moong Bean", "2.65"}
	    					};
	    items2.put("beans",beans2);
	    String[][] bevarages2 = {

	    						{"ch004","Pu'erh Tea (20 bags)","2.15"},
	    						{"ch005","Aloe Vera King Drink ","3.15"},
	    						{"ch006","Gan Mao Cha Beverage","2.99"}
						    };
		items2.put("beverages",bevarages2);
		String[][] cookinging2 = {

								  	{"ch007","Chinese Five Spice Powder ","1.79"},
								  	{"ch008","Minced Garlic Paste ","3.15"},
								  	{"ch009","Chilli Powder (Extra Hot) ","1.25"}
								 };
		items2.put("cookingingredients",cookinging2);
		catalog.put("china",items2);

		 HashMap<String,String[][]> items3 = new HashMap<String,String[][]>();
		 String[][] beans3 = {
								{"in001","Kabuli Chana 4lb","5.99"},
								{"in002","Kidney Beans Small 2lb","3.99"},
								{"in003","Moong Beans 2lb","3.45"}
							};
		items3.put("beans",beans3);
		String[][] bevarages3= { 
									{"in004","Brook Bond Taj Mahal Tea 900gm","10.99"},
									{"in005","Nescafé Sunrise 100g","4.99"},
									{"in006","Bournvita 500gm","5.99"}
							   };
	    items3.put("beverages",bevarages3);
	    String[][] dals3= {

	    						{"in007","Toor Dal 2lb","3.99"},
	    						{"in008","Masoor Dal 2lb","3.49"},
	    						{"in009","Urad Dal 2lb","3.99"}
	    				 };

	    items3.put("dals",dals3);
	    //add the nested hashmap into the main hashmap based on the countries
	    catalog.put("india",items3);

	     try
                   {
                          FileOutputStream fos = new FileOutputStream("itemsfile.ser");
                          ObjectOutputStream oos = new ObjectOutputStream(fos);
                          oos.writeObject(catalog);
                          oos.close();
                          fos.close();
                          System.out.printf("HashMap Saved in file");
                   }catch(IOException ioe)
                    {
                          ioe.printStackTrace();
                          return;
                    }
       
	}

	public HashMap<String,HashMap<String,String[][]>> getHashMap(){
		return catalog;
	}
}