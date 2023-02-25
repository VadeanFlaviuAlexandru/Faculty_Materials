package Testing;
import Domain.*;
import Repository.*;





public class TestMain {
    public static void main(String[] args) {
        CakeRequestRepository cakerepo=new CakeRequestRepository();

        cakerepo.add(new CakeRequest(1,"A","adressA","NumberB","ModelA","FlavourA","DesignA"));
        cakerepo.add(new CakeRequest(2,"B","adressB","NumberA","ModelB","FlavourB","DesignB"));
        cakerepo.add(new CakeRequest(3,"C","adressC","NumberC","ModelC","FlavourC","DesignC"));
        cakerepo.add(new CakeRequest(4,"Daniel","Memo","0757574845","Star","Coco","rockstar"));
        cakerepo.add(new CakeRequest(5,"Exam","Lacuri","0757574234","brick","Vanilla","brick"));

        for(CakeRequest cake: cakerepo.findAll())
            System.out.println(cake);

        CakeRequestFormRepository formrepo=new CakeRequestFormRepository();

        formrepo.add(new CakeRequestForm(1,cakerepo.findById(1),"testA",10,"testA","testA"));
        formrepo.add(new CakeRequestForm(2,cakerepo.findById(2),"testB",10,"testB","testB"));
        formrepo.add(new CakeRequestForm(3,cakerepo.findById(3),"testC",10,"testC","testC"));
        formrepo.add(new CakeRequestForm(4,cakerepo.findById(4),"make it bigger",100,"10/10/2020","Joe"));
        formrepo.add(new CakeRequestForm(5,cakerepo.findById(5),"make it even bigger",500,"20/10/2020","Joe"));

        for(CakeRequestForm form: formrepo.findAll())
            System.out.println(form);

        CakeRequestRepositoryFile cakefile=new CakeRequestRepositoryFile("D:\\Programs\\Eclipse\\Program Eclipse\\~~~~~ HOME-ASSIGNMENT\\Requests.txt");
        cakefile.add(new CakeRequest(1,"A","adressA","NumberB","ModelA","FlavourA","DesignA"));
        cakefile.add(new CakeRequest(2,"B","adressB","NumberA","ModelB","FlavourB","DesignB"));
        cakefile.add(new CakeRequest(3,"C","adressC","NumberC","ModelC","FlavourC","DesignC"));
        cakefile.add(new CakeRequest(4,"Daniel","Memo","0757574845","Star","Coco","rockstar"));
        cakefile.add(new CakeRequest(5,"Exam","Lacuri","0757574234","brick","Vanilla","brick"));

        System.out.println("\n--------------------------------FROM THE FILE Requests--------------------------------------\n");
        for(CakeRequest cake:cakefile.findAll()) {
            System.out.println(cake);
        }

        CakeRequestFormRepositoryFile formfile=new CakeRequestFormRepositoryFile("D:\\Programs\\Eclipse\\Program Eclipse\\~~~~~ HOME-ASSIGNMENT\\Forms.txt", cakefile);

        formfile.add(new CakeRequestForm(1,cakerepo.findById(1),"testA",10,"testA","testA"));
        formfile.add(new CakeRequestForm(2,cakerepo.findById(2),"testB",10,"testB","testB"));
        formfile.add(new CakeRequestForm(3,cakerepo.findById(3),"testC",10,"testC","testC"));
        formfile.add(new CakeRequestForm(4,cakerepo.findById(4),"make it bigger",100,"10/10/2020","Joe"));
        formfile.add(new CakeRequestForm(5,cakerepo.findById(5),"make it even bigger",500,"20/10/2020","Joe"));

        System.out.println("\n--------------------------------FROM THE FILE Forms------------------------------------------\n");
        for(CakeRequestForm cake:formfile.findAll()) {
            System.out.println(cake);
        }
        //clearing both files
        cakefile.delete(cakefile.findById(1));
        cakefile.delete(cakefile.findById(2));
        cakefile.delete(cakefile.findById(3));
        cakefile.delete(cakefile.findById(4));
        cakefile.delete(cakefile.findById(5));
        formfile.delete(formfile.findById(1));
        formfile.delete(formfile.findById(2));
        formfile.delete(formfile.findById(3));
        formfile.delete(formfile.findById(4));
        formfile.delete(formfile.findById(5));
		/*
		CakeRequestRepositorySerialization requestserialization=new CakeRequestRepositorySerialization("D:\\Programs\\Eclipse\\Program Eclipse\\~~~~~~~~ HOME - ASSIGNMENT\\src\\CakeRequestSerialization");

		for(CakeRequest cr: requestserialization.findAll())
			System.out.println(cr);

		CakeRequestFormRepositorySerialization formserialization = new CakeRequestFormRepositorySerialization("D:\\Programs\\Eclipse\\Program Eclipse\\~~~~~~~~ HOME - ASSIGNMENT\\src\\CakeFormSerialization", requestserialization);
		formserialization.add(new CakeRequestForm(1, requestserialization.findById(3),"Great Birthday design", 500, "2021/10/25", "Joe"));
		formserialization.add(new CakeRequestForm(2, requestserialization.findById(4), "Wedding design", 100, "2021/09/20", "Geoff"));
		for(CakeRequestForm el: formserialization.findAll())
			System.out.println(el);
		*/



    }
}