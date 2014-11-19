package beans;

import java.util.*;
import java.text.*;
import java.io.*;

public class User implements Serializable {
	private String userID;
	private String password;
	private transient ArrayList<Order> orders;


	public User(String userID, String password){
		this.userID = userID;
		this.password = password;
		orders = new ArrayList<Order>();
	}

	public void setOrder(Order o){
		orders.add(o);
	}

	public ArrayList<Order> getOrders(){
		return orders;
	}

	public String getUserID(){
		return userID;
	}

	public String getPassword(){
		return password;
	}

	public void removeOrder(String o){
		Order remove = null;
		for (Order order : orders) {
			if(order.getConf().compareTo(o) == 0){
				remove = order;
				break;
			}

		}
		if(remove != null) orders.remove(remove);
	}

	private void writeObject(ObjectOutputStream out) throws IOException {
		out.defaultWriteObject();
		out.writeObject(this.orders);
	}

	private void readObject(ObjectInputStream in) throws IOException,ClassNotFoundException {
		in.defaultReadObject();
		this.orders = (ArrayList<Order>)in.readObject();
	}
}
