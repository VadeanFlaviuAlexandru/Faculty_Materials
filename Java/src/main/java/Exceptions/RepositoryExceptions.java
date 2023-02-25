package Exceptions;

@SuppressWarnings("serial") //so we can ignore a warning
public class RepositoryExceptions extends RuntimeException {
    public RepositoryExceptions(){}

    public RepositoryExceptions(String message){
        super(message);
        //super is used to call the constructor , methods and properties of parent class.
    }

    public RepositoryExceptions(Exception ex){
        super(ex);
        //super is used to call the constructor , methods and properties of parent class.
    }
}