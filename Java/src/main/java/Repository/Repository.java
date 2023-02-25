package Repository;

//Repositories define a new elegant method of storing, updating, and extracting the data stored from JAVA applications in the backend.
public interface Repository <T,Tid> {
    void add(T elem);
    void delete(T elem);
    void update (T elem, Tid id);		//CRUD operations

    //T stands for generic type ; A generic type is a generic class or interface
    T findById (Tid id);
    Iterable<T> findAll();
    //Iterable interface represents a collection of objects which is iterable - meaning which can be iterated.
    //This means, that a class that implements the Java Iterable interface can have its elements iterated.
}