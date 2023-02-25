package Main;
import java.util.Scanner;
import Controller.*;
import Domain.*;
import Repository.*;







public class Main {
    public static void MainMenu() {
        String menu = "";
        menu += ("  Menu:\n");
        menu += ("\t0 - Exit program.\n");
        menu += ("\t1 - Print every cake request we have.\n");
        menu += ("\t2 - Print every cake request form we have.\n");
        menu += ("\t3 - Update an existing cake request we have.\n");
        menu += ("\t4 - Delete an existing cake request we have.\n");
        menu += ("\t5 - Print every cake taken care of by Joe.\n");
        menu += ("\t6 - Print every expensive cake.\n");
        menu += ("\t7 - Print every cheap cake.\n");
        menu += ("\t8 - Print every cake request from Cluj.\n");
        menu += ("\t9 - Print every cake request with the vanilla flavour.\n");
        System.out.println(menu);
    }

    public static void main(String[] args) {
        CakeRequestRepository cakelist=new CakeRequestRepository();
        CakeRequestFormRepository formlist=new CakeRequestFormRepository();
        CakeController cakecontroller=new CakeController(cakelist);
        CakeFormController cakeformcontroller=new CakeFormController(formlist);

        CakeRequest c1=new CakeRequest(1,"Alex","Cluj","0757376787","Wedding","Vanilla","Rockstar");
        CakeRequest c2=new CakeRequest(2,"Alex","Cluj","0757376787","Personal","Vanilla","Personal");
        CakeRequest c3=new CakeRequest(3,"Joe","Argentina","0787364423","Celebration","Cocoa","Milestone");
        CakeRequestForm f1=new CakeRequestForm(1,c1,"Make it nice", 1000, "10/10/2000","Joe");
        CakeRequestForm f2=new CakeRequestForm(2,c2,"Make it very nice", 2000, "10/11/2000","Joe");
        CakeRequestForm f3=new CakeRequestForm(3,c3,"Put more flavour in it, please.", 900, "05/21/2000","Roxy");

        cakecontroller.addCake(c1);
        cakecontroller.addCake(c2);
        cakecontroller.addCake(c3);
        cakeformcontroller.addCakeForm(f1);
        cakeformcontroller.addCakeForm(f2);
        cakeformcontroller.addCakeForm(f3);

        Scanner UserInput = new Scanner(System.in);
        try {
            while (true) {
                MainMenu();
                Integer number= UserInput.nextInt();
                if (number == 0) {System.exit(0);

                } else if (number== 1) {
                    System.out.println(cakecontroller.ControllerFindAll());
                    System.out.println("\n---------------------\n");
                } else if (number== 2) {
                    System.out.println(cakeformcontroller.ControllerFindAll());
                } else if (number== 3) {
                    System.out.println("\n Please input the requested ID you want to be updated: ");
                    Integer requestedID= UserInput.nextInt();
                    System.out.println("\n How would like to change the name? ");
                    String requestedName= UserInput.next();
                    System.out.println("\n From what city is this person? ");
                    String requestedCity= UserInput.next();
                    System.out.println("\n Insert the phone number: ");
                    String requestedPhoneNr= UserInput.next();
                    System.out.println("\n The model he requested? ");
                    String requestedModel= UserInput.next();
                    System.out.println("\n What flavour? ");
                    String requestedFlavour= UserInput.next();
                    System.out.println("\n And finally, the design: ");
                    String requestedDesign= UserInput.next();
                    CakeRequest updatedrequest = new CakeRequest(requestedID,requestedName,requestedCity,requestedPhoneNr,requestedModel,requestedFlavour,requestedDesign);
                    cakecontroller.UpdateCake(updatedrequest, requestedID);
                    System.out.println("The cake request has been updated!");
                } else if (number==4) {
                    System.out.println("\n Please input the requested ID you want to be deleted: ");
                    Integer requestedID= UserInput.nextInt();
                    cakelist.delete(cakelist.findById(requestedID));
                    System.out.println("The cake request has been deleted!");
                } else if (number==5) {
                    System.out.println(cakeformcontroller.CakeRequestsByJoe());
                } else if (number==6) {
                    System.out.println(cakeformcontroller.PrintExpensiveCakes());
                } else if (number==7) {
                    System.out.println(cakeformcontroller.PrintCheapCakes());
                } else if (number==8) {
                    System.out.println(cakecontroller.PrintCakesFromCluj());
                } else if (number==9) {
                    System.out.println(cakecontroller.PrintVanillaCakes());
                }
            }
        } finally {	//This ensures that your Scanner is always closed, guaranteeing proper resource cleanup.
            if(UserInput!=null){ UserInput.close();}
        }
    }
}