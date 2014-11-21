package beans;

import java.util.*;
import java.text.*;
import java.io.*;

public class Clients {
    private transient HashMap<String,User> clients;

    public void setNewClient(User u){
        try{
            clients = deserializeThis();
        }catch (Exception e) {}
        if(clients == null) clients = new HashMap<String, User>();
        clients.put(u.getUserID(), u);
    }

    public void serializeThis() throws IOException{
         FileOutputStream fileOut = new FileOutputStream("clients.ser", false);
         ObjectOutputStream out = new ObjectOutputStream(fileOut);
         out.writeObject(this.clients);
         out.close();
         fileOut.close();
    }

    public HashMap<String,User> deserializeThis() throws IOException, ClassNotFoundException{
        FileInputStream fileIn = new FileInputStream("clients.ser");
        ObjectInputStream in = new ObjectInputStream(fileIn);
        clients = (HashMap<String,User>) in.readObject();
        in.close();
        fileIn.close();
        return clients;
    }
}
