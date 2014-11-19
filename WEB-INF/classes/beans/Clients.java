package beans;

import java.util.*;
import java.text.*;
import java.io.*;

public class Clients {
    private transient HashMap<String,User> clients;


    public Clients(){
        clients = new HashMap<String,User>();
    }

    public void setNewClient(User u){
        clients.put(u.getUserID(), u);
    }

    public void serializeThis() throws IOException{
         FileOutputStream fileOut = new FileOutputStream("clients.ser");
         ObjectOutputStream out = new ObjectOutputStream(fileOut);
         out.writeObject(this.clients);
         out.close();
         fileOut.close();
    }

    public HashMap<String,User> deserializeThis() throws IOException, ClassNotFoundException{
        FileInputStream fileIn = new FileInputStream("clients.ser");
        ObjectInputStream in = new ObjectInputStream(fileIn);
        HashMap<String,User> map = (HashMap<String,User>) in.readObject();
        in.close();
        fileIn.close();
        return map;
    }
}
