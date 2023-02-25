package Repository;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Map;
import Exceptions.RepositoryExceptions;
import Domain.CakeRequest;





public class CakeRequestRepositorySerialization extends AbstractRepository<CakeRequest, Integer> {
    private String filename;//="D:\\\\Programs\\\\Eclipse\\\\Program Eclipse\\\\~~~~~~~~ HOME - ASSIGNMENT\\\\CakeRequestSerialization.txt";

    public CakeRequestRepositorySerialization(String filename) {
//Serialization is a process to convert objects into a writable byte stream. Once converted, these objects can be written to a file.
        this.filename=filename;
        readFromFile();
    }

    @SuppressWarnings("unchecked")//to ignore some warnings
    private void readFromFile (){
        try(ObjectInputStream in= new ObjectInputStream (new FileInputStream(filename))){
//ObjectInputStream is used to recover those objects previously serialized.
            elem = (Map<Integer, CakeRequest>) in.readObject();
        }
        catch(Exception error){
            throw new RepositoryExceptions("Error reading from file: " + error);
        }
    }

    public void writeToFile()
    {
        try(ObjectOutputStream e=new ObjectOutputStream(new FileOutputStream(filename))){
//ObjectOutputStream enables you to write Java objects to an OutputStream instead of just raw bytes
            e.writeObject(elem);
        }
        catch(IOException error){
            throw new RepositoryExceptions("message " + error);
        }
    }

    @Override
    public void add(CakeRequest obj) {
        try {
            super.add(obj);
//super is used to call the constructor , methods and properties of parent class.
            writeToFile();
        } catch (RuntimeException error) {
            throw new RepositoryExceptions("Object wasn’t added" + error + " "+obj);
        }
    }

    @Override
    public void delete(CakeRequest obj) {
        try {
            super.delete(obj);
            //super is used to call the constructor , methods and properties of parent class.
            writeToFile();
        } catch (RuntimeException error) {
            throw new RepositoryExceptions("Object was not deleted" + error +" "+obj);
        }
    }

    @Override
    public void update(CakeRequest obj, Integer id) {
        try {
            super.update(obj, id);
            //super is used to call the constructor , methods and properties of parent class.
            writeToFile();
        } catch (RuntimeException error) {
            throw new RepositoryExceptions("Object was not updated" + error + " "+obj);
        }
    }
}
