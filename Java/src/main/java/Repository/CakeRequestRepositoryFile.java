package Repository;
import Domain.*;
import java.io.*;
import Exceptions.RepositoryExceptions;





public class CakeRequestRepositoryFile extends AbstractRepository<CakeRequest, Integer>{
    private String filename;

    public CakeRequestRepositoryFile(String filename) {
        this.filename=filename;
        readFromFile();
    }

    private void readFromFile() {
        try(BufferedReader reader=new BufferedReader(new FileReader(filename))){
            //BufferedReader is a class which simplifies reading text from a character input stream
            String line;
            while((line=reader.readLine())!=null) {
//split() method divides a String into an ordered list of substrings,puts these substrings into an array, and returns the array
                String[] el=line.split(";");
                if(el.length!=7) {
                    System.err.println("Not a valid number of atributes "+line);
                    continue;
                }
                try {
                    int Id=Integer.parseInt(el[0]);
                    //to convert the String to an int
                    CakeRequest c=new
                            CakeRequest(Id,el[1],el[2],el[3],el[4],el[5],el[6]);
                    super.add(c);
                    //super is used to call the constructor , methods and properties of parent class.
                }
                catch(NumberFormatException n){
                    System.err.println("The ID is not a valid number "+el[0]);
                }
            }
        }
        catch(IOException error){
            throw new RepositoryExceptions("Error reading"+error);
        }
    }

    @Override
    public void add(CakeRequest obj) {
        try{
            super.add(obj);
            //super is used to call the constructor , methods and properties of parent class.
            writeToFile();
        }
        catch(RuntimeException e){
            throw new RepositoryExceptions("Object wasn’t added" + e + " " + obj);
        }
    }

    private void writeToFile() {
        try(PrintWriter pw = new PrintWriter(filename)) {
//PrintWriter enables you to write int , long and other primitive data formatted as text, rather than as their byte values
            for(CakeRequest el : findAll()) {
                String line = el.getID() + ";" + el.getOwnerName() + ";" + el.getOwnerAddress() +
                        ";" + el.getPhoneNumber() + ";" + el.getModel() +";"+ el.getFlavour() + ";" + el.getDesign();
                pw.println(line);
            }
        }
        catch(IOException error) {
            throw new RepositoryExceptions("Error writing" + error);
        }
    }

    @Override
    public void delete(CakeRequest obj){
        try
        {
            super.delete(obj);
            //super is used to call the constructor , methods and properties of parent class.
            writeToFile();
        }
        catch(RuntimeException error)
        {
            throw new RepositoryExceptions("Object was not deleted"+error+" "+obj);
        }
    }

    @Override
    public void update(CakeRequest obj, Integer id){
        try
        {
            super.update(obj, id);
            //super is used to call the constructor , methods and properties of parent class.
            writeToFile();
        }
        catch(RuntimeException error)
        {
            throw new RepositoryExceptions("Object was not updated" + error + " " + obj);
        }
    }



}
