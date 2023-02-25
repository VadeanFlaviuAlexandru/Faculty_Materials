package Controller;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import Domain.*;
import Repository.*;




//A controller basically controls the flow of the data.
public class CakeController {
    private CakeRequestRepository cakerepo;

    public CakeController(CakeRequestRepository cakerepo) {
        this.cakerepo=cakerepo;
    }

    public void addCake(CakeRequest cake) {
        cakerepo.add(cake);
    }

    public void DeleteCake(CakeRequest cake) {
        cakerepo.delete(cake);
    }

    public void UpdateCake(CakeRequest cake, int id) {
        cakerepo.update(cake, cake.getID());
    }

    public void searchCake(CakeRequest cake) {
        cakerepo.findById(cake.getID());
    }
    //that a class that implements the Java Iterable interface can have its elements iterated
    public Iterable<CakeRequest> ControllerFindAll(){
        return cakerepo.findAll();
    }
    //The Collection in Java is a framework that provides an architecture to store and manipulate the group of objects.
// -can achieve all the operations that you perform on a data such as searching, sorting, insertion, manipulation, and deletion.
// -Java Collection means a single unit of objects.
    public Collection<CakeRequest> controllerGetAll(){
        return cakerepo.getAll();
    }
    //some reports
    public List<CakeRequest> PrintCakesFromCluj(){
        Collection<CakeRequest> cakecollection= controllerGetAll();
//		Stream is used to process collections of objects. ‘filter’ method is used to eliminate elements based on a criteria. A Map is an object that maps keys to values
//		Collectors are used to combine the result of processing on the elements of a stream. Collectors can be used to return a list or a string.
        List<CakeRequest> cakelist= cakecollection.stream().filter(CakeRequest -> CakeRequest.getOwnerAddress() == "Cluj").toList();
        return new ArrayList<>(cakelist);
    }

    public List<CakeRequest> PrintVanillaCakes(){
        Collection<CakeRequest> cakecollection= controllerGetAll();
//		Stream is used to process collections of objects. ‘filter’ method is used to eliminate elements based on a criteria. A Map is an object that maps keys to values
//		Collectors are used to combine the result of processing on the elements of a stream. Collectors can be used to return a list or a string.
        List<CakeRequest> cakelist= cakecollection.stream().filter(CakeRequest -> CakeRequest.getFlavour() == "Vanilla").toList();
        return new ArrayList<>(cakelist);
    }

}