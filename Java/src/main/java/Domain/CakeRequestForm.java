package Domain;
import java.io.Serializable;




@SuppressWarnings("serial")
public class CakeRequestForm implements Identifiable<Integer>, Serializable{
    //the class access the interface methods
    private int ID;
    private CakeRequest CakeRequest;
    private String Services;
    private int Price;
    private String Date;
    private String Employee;

    //class constructor to initialize new objects
    public CakeRequestForm (int ID, CakeRequest CakeRequest, String Services, int Price, String Date, String Employee) {
        this.ID=ID;
        this.CakeRequest=CakeRequest;
        this.Services=Services;
        this.Price=Price;
        this.Date=Date;
        this.Employee=Employee;
    }

    //empty(default) constructor when we don't provide an object with parameters
    public CakeRequestForm() {
        this.ID=0;
        this.CakeRequest=null;
        this.Services="";
        this.Price=0;
        this.Date="";
        this.Employee="";
    }

    //String representation of an object
    @Override//Override informs the compiler that the element is meant to override an element declared in a superclass
    public String toString(){
        return "Cake request form with the id: "+ this.ID +", request: "+this.CakeRequest+", Services:"+this.Services+", Price: "+this.Date+", Employee: "+this.Employee+", Price: "+this.Price;
    }

    //getters and setters
    public Integer getID() {
        return ID;
    }

    public CakeRequest getCakeRequest() {
        return CakeRequest;
    }

    public String getServices() {
        return Services;
    }

    public int getPrice() {
        return Price;
    }

    public String getDate() {
        return Date;
    }

    public String getEmployee() {
        return Employee;
    }

    public void setID(Integer id) {
        ID=id;
    }

    public void setCakeRequest(CakeRequest CK) {
        CakeRequest=CK;
    }

    public void setServices(String services) {
        Services=services;
    }

    public void setPrice(Integer price) {
        Price=price;
    }

    public void setDate(String date) {
        Date=date;
    }

    public void setEmployee(String employee) {
        Employee=employee;
    }
}
