package Domain;
import java.io.Serializable;





@SuppressWarnings("serial")
public class CakeRequest implements Identifiable<Integer>, Serializable{
    //the class access the interface methods
    private int ID;
    private String OwnerName;
    private String OwnerAddress;
    private String PhoneNumber;
    private String Model;
    private String Flavour;
    private String Design;


    //class constructor to initialize new objects
    public CakeRequest(int ID, String OwnerName, String OwnerAddress, String PhoneNumber, String Model, String Flavour, String Design) {
        this.ID=ID;
        this.OwnerName=OwnerName;
        this.OwnerAddress=OwnerAddress;
        this.PhoneNumber=PhoneNumber;
        this.Flavour=Flavour;
        this.Design=Design;
        this.Model=Model;
    }

    //empty(default) constructor when we don't provide an object with parameters
    public CakeRequest() {
        this.ID=0;
        this.OwnerName="";
        this.OwnerAddress="";
        this.PhoneNumber="";
        this.Flavour="";
        this.Design="";
        this.Model="";
    }

    //String representation of an object
    @Override//Override informs the compiler that the element is meant to override an element declared in a superclass
    public String toString() {
        return "Cake request with the id: " +this.ID+", Owner's name:  " + this.OwnerName+", Owner's address: " + this.OwnerAddress+", PhoneNumber: " + this.PhoneNumber+", cake's flavour: " + this.Flavour+", cake's design " + this.Design+", cake's model: " + this.Model+"\t";
    }

    //getters and setters
    public Integer getID() {
        return ID;
    }
    public String getOwnerName() {
        return OwnerName;
    }
    public String getOwnerAddress() {
        return OwnerAddress;
    }
    public String getPhoneNumber() {
        return PhoneNumber;
    }
    public String getFlavour() {
        return Flavour;
    }
    public String getDesign() {
        return Design;
    }
    public String getModel() {
        return Model;
    }
    public void setID(Integer id) {
        ID=id;
    }
    public void setOwnerName(String ON) {
        OwnerName=ON;
    }
    public void setOwnerAddress(String OA) {
        OwnerAddress=OA;
    }
    public void setPhoneNumber(String PN) {
        PhoneNumber=PN;
    }
    public void setFlavour(String flavour) {
        Flavour=flavour;
    }
    public void setDesign(String design) {
        Design=design;
    }
    public void setModel(String model) {
        Model=model;
    }

}
