package beans;

import java.io.*;
import java.util.*;
public class ProductData implements Serializable{

	private String prodid;
	private String category;
	private String description;
	private String country;
	private double price;

	public ProductData(String prodid, String category, String description, String country, double cost){
		setProdId(prodid);
		setCategory(category);
		setDecription(description);
		setCountry(country);
		setPrice(cost);
	}


	public void setProdId(String prodid){

		this.prodid = prodid;
	}

	public String getProdId(){

		return prodid;
	}

	public void setCategory(String category){
		this.category = category;
	}

	public String getCategory(){

		return category;
	}
	public void setDecription(String desc){
		this.description = desc;

	}

	public String getDescription(){

		return description;
	}

	public void setCountry(String country){
		this.country = country;
	}

	public String getCountry(){

		return country;
	}

	public void setPrice(double price){

		this.price = price;
	}

	public double getPrice(){

		return price;
	}



}
