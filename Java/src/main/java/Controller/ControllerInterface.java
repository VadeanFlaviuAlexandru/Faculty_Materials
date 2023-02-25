package Controller;
import java.util.Collection;





//yeah, some methods here
public interface ControllerInterface<T,Tid> {

    void addObject(T elem);
    void deleteObject(T elem);
    void updateObject (T elem, Tid id);
    T searchObject (Tid id);
    Iterable<T> controllerFindAll();
    Collection<T> controllerGetAll();
}
