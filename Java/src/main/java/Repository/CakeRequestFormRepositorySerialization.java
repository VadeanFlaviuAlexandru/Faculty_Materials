package Repository;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Map;
import Exceptions.RepositoryExceptions;
import Domain.CakeRequestForm;





public class CakeRequestFormRepositorySerialization extends AbstractRepository<CakeRequestForm,Integer>{
    private String filename;//="D:\\\\Programs\\\\Eclipse\\\\Program Eclipse\\\\~~~~~~~~ HOME - ASSIGNMENT\\\\CakeFormSerialization.txt";
    @SuppressWarnings("unused")// to ignore a warning i guess
    private CakeRequestRepositorySerialization cakerequestreposerialization;

    public CakeRequestFormRepositorySerialization(String filename, CakeRequestRepositorySerialization cakerequestreposerialization) {
//Serialization is a process to convert objects into a writable byte stream. Once converted, these objects can be written to a file.
        this.filename=filename;
        this.cakerequestreposerialization=cakerequestreposerialization;
    }

    private void writeToFile(){
        try(ObjectOutputStream e=new ObjectOutputStream(new FileOutputStream(filename)))
        //ObjectOutputStream enables you to write Java objects to an OutputStream instead of just raw bytes
        {
            e.writeObject(elem);
        }
        catch(IOException r){
            throw new RepositoryExceptions("message " + r);
        }
    }

    @SuppressWarnings({ "unused", "unchecked" })//to ignoer some warnings
    private void readFromFile ()
    {
        try(ObjectInputStream in= new ObjectInputStream (new FileInputStream(filename)))
        //ObjectInputStream is used to recover those objects previously serialized.
        {
            elem = (Map<Integer, CakeRequestForm>) in.readObject();
        }
        catch(IOException|ClassNotFoundException err)
        {
            throw new RepositoryExceptions("Error reading from file: "+err);
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
            throw new RepositoryExceptions("Object was not updated" + ex + " " + obj);
        }
    }
}