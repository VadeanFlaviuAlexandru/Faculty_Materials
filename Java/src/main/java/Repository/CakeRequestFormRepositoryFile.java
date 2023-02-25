package Repository;
import Domain.*;
import java.io.*;
import Exceptions.RepositoryExceptions;


public class CakeRequestFormRepositoryFile extends AbstractRepository<CakeRequestForm, Integer>{
    private String filename;
    private CakeRequestRepositoryFile cakerequestfile;

    public CakeRequestFormRepositoryFile(String filename, CakeRequestRepositoryFile cakerequestfile) {
        this.filename=filename;
        this.cakerequestfile=cakerequestfile;
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
                    int Id = Integer.parseInt(el[0]);
                    int price = Integer.parseInt(el[3]);
                    CakeRequestForm c = new CakeRequestForm(Id, cakerequestfile.findById(Integer.parseInt(el[1])), el[2], price, el[4], el[5]);
                    super.add(c);
//super is used to call the constructor , methods and properties of parent class.
                } catch (NumberFormatException n) {
                    System.err.println("The ID is not a valid number" + el[0]);
                }
            }
        } catch (IOException ex) {
            throw new RepositoryExceptions("Error reading" + ex);
        }
    }

    @Override
    public void add(CakeRequestForm obj) {
        try {
            super.add(obj);
            //super is used to call the constructor , methods and properties of parent class.
            writeToFile();
        } catch (RuntimeException e) {
            throw new RepositoryExceptions("Object wasn’t added" + e + " "+obj);
        }
    }

    private void writeToFile() {
        try (PrintWriter pw = new PrintWriter(filename)) {
//PrintWriter enables you to write int , long and other primitive data formatted as text, rather than as their byte values
            for (CakeRequestForm el : findAll()) {
                String line = el.getID() + ";"+el.getCakeRequest().getID()+";"+el.getServices() + ";"+el.getPrice() +";"+el.getDate() + ";" + el.getEmployee() ;

                pw.println(line);
            }
        } catch (IOException ex) {
            throw new RepositoryExceptions("Error writing" + ex);
        }
    }

    @Override
    public void delete(CakeRequestForm obj) {
        try {
            super.delete(obj);
            //super is used to call the constructor , methods and properties of parent class.
            writeToFile();
        } catch (RuntimeException ex) {
            throw new RepositoryExceptions("Object was not deleted" + ex +" "+obj);
        }
    }

    @Override
    public void update(CakeRequestForm obj, Integer id) {
        try {
            super.update(obj, id);
            //super is used to call the constructor , methods and properties of parent class.
            writeToFile();
        } catch (RuntimeException ex) {
            throw new RepositoryExceptions("Object was not updated" + ex + " "+obj);
        }
    }
}