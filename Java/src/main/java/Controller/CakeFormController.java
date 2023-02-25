package Controller;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import Domain.*;
import Repository.*;




//A controller basically controls the flow of the data.
public class CakeFormController {
    private CakeRequestFormRepository formrepo;

    public CakeFormController(CakeRequestFormRepository formrepo) {
        this.formrepo=formrepo;
    }

    public void addCakeForm(CakeRequestForm cake) {
        formrepo.add(cake);
    }

    public void DeleteCakeForm(CakeRequestForm cake) {
        formrepo.delete(cake);
    }

    public void UpdateCakeForm(CakeRequestForm cake) {
        formrepo.update(cake, cake.getID());
    }

    public void searchCakeForm(CakeRequestForm cake) {
        formrepo.findById(cake.getID());
    }

    //that a class that implements the Java Iterable interface can have its elements iterated
    public Iterable<CakeRequestForm> ControllerFindAll(){
        return formrepo.findAll();
    }

    //The Collection in Java is a framework that provides an architecture to store and manipulate the group of objects.
    // -can achieve all the operations that you perform on a data such as searching, sorting, insertion, manipulation, and deletion.
    // -Java Collection means a single unit of objects.
    public Collection<CakeRequestForm> controllerGetAll(){
        return formrepo.getAll();
    }


    //some reports


    public List<CakeRequest> CakeRequestsByJoe(){
        Collection<CakeRequestForm> cakeformcollection= controllerGetAll();
//		Stream is used to process collections of objects. ‘filter’ method is used to eliminate elements based on a criteria. A Map is an object that maps keys to values
//								Collectors are used to combine the result of processing on the elements of a stream. Collectors can be used to return a list or a string.
        List<CakeRequest> cakelist=cakeformcollection.stream().filter(CakeRequestForm -> CakeRequestForm.getEmployee() == "Joe").map(CakeRequestForm -> CakeRequestForm.getCakeRequest()).collect(Collectors.toList());
        return new ArrayList<>(cakelist);
    }

    public List<CakeRequest> PrintExpensiveCakes(){
        Collection<CakeRequestForm> cakeformcollection= controllerGetAll();
//		Stream is used to process collections of objects. ‘filter’ method is used to eliminate elements based on a criteria. A Map is an object that maps keys to values
//		Collectors are used to combine the result of processing on the elements of a stream. Collectors can be used to return a list or a string.
        List<CakeRequest> cakelist=cakeformcollection.stream().filter(CakeRequestForm -> CakeRequestForm.getPrice() > 1000).map(CakeRequestForm -> CakeRequestForm.getCakeRequest()).collect(Collectors.toList());
        return new ArrayList<>(cakelist);
    }

    public List<CakeRequest> PrintCheapCakes(){
        Collection<CakeRequestForm> cakeformcollection= controllerGetAll();
//		Stream is used to process collections of objects. ‘filter’ method is used to eliminate elements based on a criteria. A Map is an object that maps keys to values
//		Collectors are used to combine the result of processing on the elements of a stream. Collectors can be used to return a list or a string.
        List<CakeRequest> cakelist=cakeformcollection.stream().filter(CakeRequestForm -> CakeRequestForm.getPrice() <= 1000).map(CakeRequestForm -> CakeRequestForm.getCakeRequest()).collect(Collectors.toList());
        return new ArrayList<>(cakelist);
    }
}