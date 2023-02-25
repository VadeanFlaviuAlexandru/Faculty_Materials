package Repository;
import Domain.*;
import java.util.*;



//abstract classes is to function as base classes which can be extended by subclasses to create a full implementation.
public abstract class AbstractRepository <T extends Identifiable<ID>,ID> implements Repository<T,ID> {
    protected Map<ID,T> elem;
    //A Map is an object that maps keys to values

    public AbstractRepository(){
        elem= new HashMap<>();
    }
    //Map is an interface, i.e. an abstract "thing" that defines how something can be used.
    //HashMap is an implementation of that interface.
    //		A HashMap cannot contain duplicate keys
    //		Java HashMap allows null values and the null key.

    public void add(T element){
        if(elem.containsKey(element.getID()))
            throw new RuntimeException("~~ This element already exists! ~~");
        else
            elem.put(element.getID(),element);
    }

    public void delete(T element){
        if(elem.containsKey(element.getID()))
            elem.remove(element.getID());
    }

    public void update(T element,ID id){
        if(elem.containsKey(id))
            elem.put(element.getID(),element);
        else
            throw new RuntimeException("~~ Element does not exist! ~~");
    }

    public T findById( ID id){
        if(elem.containsKey(id))
            return elem.get(id);
        else
            throw new RuntimeException("~~ Element does not exist! ~~");
    }

    public Iterable<T> findAll(){
        return elem.values();
    }
    //Java Collections can achieve all the operations that you perform on a data such as
    //searching, sorting, insertion, manipulation, and deletion.
    //Java Collection means a single unit of objects.
    public Collection<T> getAll() {
        return elem.values();
    }
}