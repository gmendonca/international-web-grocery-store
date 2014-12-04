package beans;

import java.io.*;
import java.util.*;
import java.lang.*;
public class MainCatalog {

	public void makecatalog() throws IOException{

	 HashMap<String,ProductData> catalog = new HashMap<String, ProductData>();


	catalog.put("br001",new ProductData("br001","Beans","Feijoada - Meat & Black Bean Casserole-18 Oz","Brazil",4.99));
	catalog.put("br002",new ProductData("br002","Beans","Feijão Preto GOYA - 24 Oz(Black Beans)","Brazil",3.39));
	catalog.put("br003",new ProductData("br003","Beans","Carioca Beans -18 Oz","Brazil",3.25));
	catalog.put("br004",new ProductData("br004","Beverages","Café 3 Corações 500g ","Brazil",9.99));
	catalog.put("br005",new ProductData("br005","Beverages","Suco de Cajú 500ml (Da Fruta ou Maguary)","Brazil",3.99));
	catalog.put("br006",new ProductData("br006","Beverages","Guarana Brazilia 2 liters","Brazil",3.29));
  catalog.put("br007",new ProductData("br007","Cereals","Kimilho Flocão - Yoki 500 grams","Brazil",3.99));
  catalog.put("br008",new ProductData("br008","Cereals","Milharina Quaker - 500g ","Brazil",3.49));
  catalog.put("br009",new ProductData("br009","Cereals","Trigo para Kibe Yoki - 500g ","Brazil",3.49));
  catalog.put("br010",new ProductData("br010","Frozen Foods","Bacalhau - Codfish - KIT WITH 3 PACKAGES","Brazil",24.99));
  catalog.put("br011",new ProductData("br011","Frozen Foods","Feijoada Pronta Congelada - KIT WITH 4","Brazil",39.90));
  catalog.put("br012",new ProductData("br012","Frozen Foods","Catupiry - KIT WITH 2 of 250g ","Brazil",19.90));
  catalog.put("br013",new ProductData("br013","Sauces and Oils","Azeite Victor Guedes - 946ml ","Brazil",14.90));
  catalog.put("br014",new ProductData("br014","Sauces and Oils","Azeite de Dende - Talisca 140 ml","Brazil",5.90));
  catalog.put("br015",new ProductData("br015","Sauces and Oils","Molho de Tomate Pomarola ou Tarantella - 340G ","Brazil",7.90));
  catalog.put("br014",new ProductData("br016","Snacks","Guava Paste Light ","Brazil",7.99));

  catalog.put("ch001",new ProductData("ch001","Beans","Soy beans","China",2.95));
  catalog.put("ch002",new ProductData("ch002","Beans","Black beans","China",3.45));
  catalog.put("ch003",new ProductData("ch003","Beans","Split Moong Bean","China", 2.65));
  catalog.put("ch004",new ProductData("ch004","Beverages","Pu'erh Tea (20 bags)","China",2.15));
  catalog.put("ch005",new ProductData("ch005","Beverages","Aloe Vera King Drink","China",3.15));
  catalog.put("ch006",new ProductData("ch006","Beverages","Gan Mao Cha Beverage","China",2.99));
  catalog.put("ch007",new ProductData("ch007","Cooking-Ingredients","Chinese Five Spice Powder","China",1.79));
  catalog.put("ch008",new ProductData("ch008","Cooking-Ingredients","Minced Garlic Paste","China",3.15));
  catalog.put("ch009",new ProductData("ch009","Cooking-Ingredients","Chilli Powder (Extra Hot)","China",1.25));
  catalog.put("ch010",new ProductData("ch010","Dried Foods","Deep sea dried scallops 8oz.","China", 39.65));
  catalog.put("ch011",new ProductData("ch011","Dried Foods","Dried small shrimp","China", 3.65));
  catalog.put("ch012",new ProductData("ch012","Dried Foods","Dried Oyester 8oz.","China", 29.65));
  catalog.put("ch013",new ProductData("ch013","Canned Foods","555 Brand Fried Sardines in Soybean Oil with Black Beans 5.5 Oz","China", 1.99));
  catalog.put("ch014",new ProductData("ch014","Canned Foods","Aroy-D Pineapple Chunks","China", 3.65));
  catalog.put("ch015",new ProductData("ch015","Rice and Noodles","Assi 08110K Korean Dried Noodles 4 Lbs","China", 7.99));
  catalog.put("ch016",new ProductData("ch016","Rice and Noodles","Asian Best Jasmine Rice 5 Lbs","China", 9.99));

  catalog.put("in001",new ProductData("in001","Beans","Kabuli Chana 4lb","India",5.99));
  catalog.put("in002",new ProductData("in002","Beans","Kidney Beans Small 2lb","India",3.99));
  catalog.put("in003",new ProductData("in003","Beans","Moong Beans 2lb","India",3.45));
  catalog.put("in004",new ProductData("in004","Beverages","Brook Bond Taj Mahal Tea 900gm","India",10.99));
  catalog.put("in005",new ProductData("in005","Beverages","Nescafé Sunrise 100g","India",4.99));
  catalog.put("in006",new ProductData("in006","Beverages","Bournvita 500gm","India",5.99));
  catalog.put("in007",new ProductData("in007","Dals","Toor Dal 2lb","India",3.99));
  catalog.put("in008",new ProductData("in008","Dals","Masoor Dal 2lb","India",3.49));
  catalog.put("in009",new ProductData("in009","Dals","Urad Dal 2lb","India",3.99));
  catalog.put("in010",new ProductData("in010","Flours and Rice","Aashirvaad Atta 20Lbs","India",11.99));
  catalog.put("in011",new ProductData("in011","Flours and Rice","Sona Masoori Rice","India",17.99));
  catalog.put("in012",new ProductData("in012","Flours and Rice","Sooji Rava 2.2lbs","India",3.99));
  catalog.put("in013",new ProductData("in013","Frozen Food","Frozen Parathas","India",5.99));
  catalog.put("in014",new ProductData("in014","Frozen Food","Frozen Samosa","India",3.99));
  catalog.put("in015",new ProductData("in015","Pickles","Mango Pickle","India",3.99));
  catalog.put("in016",new ProductData("in016","Pickles","Lime Pickle","India",3.99));
  catalog.put("in017",new ProductData("in017","Spices","Garam Masala","India",3.99));
  catalog.put("in018",new ProductData("in018","Spices","Everest Complete Masalas Pack","India",9.99));



      FileOutputStream fos = new FileOutputStream("itemsfile.ser");
      ObjectOutputStream oos = new ObjectOutputStream(fos);
      oos.writeObject(catalog);
      oos.close();
      fos.close();
	}

	public HashMap<String,ProductData> showcatalog() {

		HashMap<String,ProductData> map = null;
		try{
			FileInputStream fis = new FileInputStream("itemsfile.ser");
			ObjectInputStream ois = new ObjectInputStream(fis);
			map = (HashMap<String,ProductData>) ois.readObject();
			ois.close();
			fis.close();
		} catch (Exception e) { }

		return map;
	}

}
