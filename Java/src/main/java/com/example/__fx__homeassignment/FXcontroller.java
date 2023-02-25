package com.example.__fx__homeassignment;



import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.collections.transformation.FilteredList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;
import Domain.*;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.layout.Pane;
import javafx.util.converter.IntegerStringConverter;

import java.io.FileWriter;
import java.io.IOException;


public class FXcontroller {
    @FXML
    private Tab tab1;
    @FXML
    private Tab tab2;
    @FXML
    private Tab tab3;
    @FXML
    private Button deletebutton;
    @FXML
    private Button deleteformbutton;
    @FXML
    private TextField errorreport;
    @FXML
    private TextField errorreportform;
    @FXML
    private TextField field_cakedesign;
    @FXML
    private TextField field_cakeflavour;
    @FXML
    private TextField field_cakemodel;
    @FXML
    private DatePicker field_date;
    @FXML
    private TextField field_employee;
    @FXML
    private TextField field_formID;
    @FXML
    private TextField field_formcakeID;
    @FXML
    private TextField field_id;
    @FXML
    private TextField field_owneradress;
    @FXML
    private TextField field_ownername;
    @FXML
    private TextField field_phonenumber;
    @FXML
    private TextField field_price;
    @FXML
    private TextField field_services;
    @FXML
    private ProgressBar progressbar;
    @FXML
    private ProgressBar progressbar2;
    @FXML
    private TextField progressformreport;
    @FXML
    private TextField progressreport;
    @FXML
    private Button refreshbutton;
    @FXML
    private TableColumn<CakeRequest, Integer> table_ID;
    @FXML
    private TableColumn<CakeRequest, String> table_adress;
    @FXML
    private TableColumn<CakeRequest, String> table_design;
    @FXML
    private TableColumn<CakeRequest, String> table_flavour;
    @FXML
    private TableColumn<CakeRequest, String> table_model;
    @FXML
    private TableColumn<CakeRequest, String> table_name;
    @FXML
    private TableColumn<CakeRequest, String> table_phonenumber;
    @FXML
    private TableView<CakeRequest> table;
    @FXML
    private TableView<CakeRequestForm> tableform;
    @FXML
    private TableColumn<CakeRequestForm, Integer> table_formID;
    @FXML
    private TableColumn<CakeRequestForm, String> table_formdate;
    @FXML
    private TableColumn<CakeRequestForm, String> table_formemployee;
    @FXML
    private TableColumn<CakeRequestForm, Integer> table_formprice;
    @FXML
    private TableColumn<CakeRequestForm, String> table_formservices;
    @FXML
    private TableColumn<CakeRequestForm, CakeRequest> table_formcakerequest;
    @FXML
    private Button updatebutton;
    @FXML
    private CheckBox report1;
    @FXML
    private CheckBox report2;
    @FXML
    private CheckBox report3;
    @FXML
    private CheckBox report4;
    @FXML
    private CheckBox report5;
    @FXML
    private Pane pane1;
    @FXML
    private Pane pane2;
    @FXML
    private Pane pane22;
    @FXML
    private Pane pane3;
    @FXML
    private ToolBar bar1;
    @FXML
    private ToolBar bar2;

    private final ObservableList<CakeRequest> requestdata = FXCollections.observableArrayList();
    private final FilteredList<CakeRequest> requestfilteredData = new FilteredList<>(requestdata, request -> true);

    private final ObservableList<CakeRequestForm> formdata = FXCollections.observableArrayList();
    private final FilteredList<CakeRequestForm> formfilteredData = new FilteredList<>(formdata, request -> true);

    @FXML
    void ClickedDebugModeButton(ActionEvent event) {
        requestdata.add(new CakeRequest(1,"Arthur","King Street","0757378987","Circle","Vanilla","Jet planes"));
        requestdata.add(new CakeRequest(2,"Kay","Star Street","0757383234","Square","Vanilla","Rockstar"));
        requestdata.add(new CakeRequest(3,"Charlie","King Street","0757383999","Circle","Chocolate","Vampire stuff"));
        requestdata.add(new CakeRequest(4,"Daniel","Funny Street","0757322555","Star","Chocolate","Rockstar"));
        requestdata.add(new CakeRequest(5,"Jack","Beer Factory Street","0757398987","Beer","Strawberry","Beer"));
        requestdata.add(new CakeRequest(6,"Tudor","Cluj","0757788732","Box","Coffee","Space Box"));
        formdata.add(new CakeRequestForm(1,requestdata.get(1),"place it in a carboard plane",500,"10/10/2022","Joe"));
        formdata.add(new CakeRequestForm(2,requestdata.get(2),"glitter on the package",1000,"12/10/2022","Joe"));
        formdata.add(new CakeRequestForm(3,requestdata.get(3),"fake blood on the package",1200,"13/03/2023","Sabrina"));
        formdata.add(new CakeRequestForm(4,requestdata.get(4),"make it bigger",900,"11/11/2020","Sabrina"));
        formdata.add(new CakeRequestForm(5,requestdata.get(5),"make it even bigger",800,"01/10/2020","Joe"));
        deletebutton.setVisible(true);
        deleteformbutton.setVisible(true);
        report1.setVisible(true);
        report2.setVisible(true);
        report3.setVisible(true);
        report4.setVisible(true);
        report5.setVisible(true);
        refreshbutton.setVisible(true);
        updatebutton.setVisible(true);
    }
    @FXML
    public void ClickedDeleteButton(ActionEvent event){
        ObservableList<CakeRequest> selectedrows = table.getSelectionModel().getSelectedItems();
        requestdata.removeAll(selectedrows);
    }
    @FXML
    public void ClickedDeleteFormButton(ActionEvent event){
        ObservableList<CakeRequestForm> selectedrows = tableform.getSelectionModel().getSelectedItems();
        formdata.removeAll(selectedrows);
    }
    @FXML
    public void initialize(){
        //cakeRequest
        table_ID.setCellValueFactory(
                p-> new SimpleIntegerProperty(p.getValue().getID()).asObject()
        );
        table_name.setCellValueFactory(
                p -> new SimpleStringProperty(p.getValue().getOwnerName())
        );
        table_adress.setCellValueFactory(
                p -> new SimpleStringProperty(p.getValue().getOwnerAddress())
        );
        table_phonenumber.setCellValueFactory(
                p -> new SimpleStringProperty(p.getValue().getPhoneNumber())
        );
        table_flavour.setCellValueFactory(
                p -> new SimpleStringProperty(p.getValue().getFlavour())
        );
        table_design.setCellValueFactory(
                p -> new SimpleStringProperty(p.getValue().getDesign())
        );
        table_model.setCellValueFactory(
                p -> new SimpleStringProperty(p.getValue().getModel())
        );
        //form
        table_formcakerequest.setCellValueFactory(
                p -> new SimpleObjectProperty<>(p.getValue().getCakeRequest())
        );
        table_formID.setCellValueFactory(
                p->new SimpleIntegerProperty(p.getValue().getID()).asObject()
        );
        table_formdate.setCellValueFactory(
                p->new SimpleStringProperty(p.getValue().getDate())
        );
        table_formprice.setCellValueFactory(
                p->new SimpleIntegerProperty(p.getValue().getPrice()).asObject()
        );
        table_formemployee.setCellValueFactory(
                p->new SimpleStringProperty(p.getValue().getEmployee())
        );
        table_formservices.setCellValueFactory(
                p->new SimpleStringProperty(p.getValue().getServices())
        );
        table.setItems(requestfilteredData);
        table.getSelectionModel().setSelectionMode(SelectionMode.MULTIPLE);
        tableform.setItems(formfilteredData);
        tableform.getSelectionModel().setSelectionMode(SelectionMode.MULTIPLE);
        pane1.styleProperty().set("-fx-background-color: #e8c6f5");
        pane2.styleProperty().set("-fx-background-color: #e8c6f5");
        pane22.styleProperty().set("-fx-background-color: #e8c6f5");
        pane3.styleProperty().set("-fx-background-color: #e8c6f5");
        bar1.styleProperty().set("-fx-background-color: #e8c6f5");
        bar2.styleProperty().set("-fx-background-color: #e8c6f5");
        tab1.styleProperty().set("-fx-background-color: #e8c6f5");
        tab2.styleProperty().set("-fx-background-color: #e8c6f5");
        tab3.styleProperty().set("-fx-background-color: #e8c6f5");
    }
    @FXML
    void AddCakeRequestFormButton(ActionEvent event) {
        try {
            int formID = Integer.parseInt(field_formID.getText());
            int formcakeID=Integer.parseInt(field_formcakeID.getText());
            CakeRequest WantedCake = null;
            for (CakeRequest cake: table.getItems()){
                if (formcakeID==cake.getID()) {
                    WantedCake=cake;
                }
            }
            String services = field_services.getText();
            int price = Integer.parseInt(field_price.getText());
            String date= String.valueOf(field_date.getValue());
            String employee=field_employee.getText();
            formdata.add(new CakeRequestForm(formID,WantedCake, services,price,date,employee));
            field_formID.setText("");
            field_formcakeID.setText("");
            field_services.setText("");
            field_price.setText("");
            field_employee.setText("");
            field_date.getEditor().clear();
            progressformreport.setVisible(true);
            progressbar2.setProgress(1);
            progressformreport.setText("Done!");
        } catch (NumberFormatException error) {
            field_formID.setText("");
            field_formcakeID.setText("");
            field_services.setText("");
            field_price.setText("");
            field_employee.setText("");
            progressbar2.setStyle("-fx-accent: red;");
            progressformreport.setVisible(true);
            progressbar2.setProgress(1);
            progressformreport.setText("Error!");
            errorreportform.setVisible(true);
            errorreportform.setText("Errors: "+error);
        }
    }
    @FXML
    void AddCakeRequestButton(ActionEvent event) {
        try {
            int ID= Integer.parseInt(field_id.getText());
            String ownername = field_ownername.getText();
            String adress = field_owneradress.getText();
            String phonenumber = field_phonenumber.getText();
            String cakemodel = field_cakemodel.getText();
            String cakeflavour = field_cakeflavour.getText();
            String cakedesign = field_cakedesign.getText();
            requestdata.add(new CakeRequest(ID, ownername, adress, phonenumber, cakemodel, cakeflavour, cakedesign));
            field_id.setText("");
            field_owneradress.setText("");
            field_ownername.setText("");
            field_phonenumber.setText("");
            field_cakemodel.setText("");
            field_cakedesign.setText("");
            field_cakeflavour.setText("");
            progressreport.setVisible(true);
            progressbar.setProgress(1);
            progressreport.setText("Done!");
        } catch (NumberFormatException errors) {
            field_id.setText("");
            field_owneradress.setText("");
            field_ownername.setText("");
            field_phonenumber.setText("");
            field_cakemodel.setText("");
            field_cakedesign.setText("");
            field_cakeflavour.setText("");
            progressbar.setStyle("-fx-accent: red;");
            progressreport.setVisible(true);
            progressbar.setProgress(1);
            progressreport.setText("Error!");
            errorreport.setVisible(true);
            errorreport.setText("Errors: "+errors);
        }
    }
    @FXML
    void ClickedRefreshButton(ActionEvent event) {
        table.refresh();
        tableform.refresh();
    }
    @FXML
    void ClickedUpdateTableButton(ActionEvent event){
        table.setEditable(true);
        tableform.setEditable(true);
        table_ID.setCellFactory(TextFieldTableCell.forTableColumn(new IntegerStringConverter()));
        table_name.setCellFactory(TextFieldTableCell.forTableColumn());
        table_adress.setCellFactory(TextFieldTableCell.forTableColumn());
        table_phonenumber.setCellFactory(TextFieldTableCell.forTableColumn());
        table_flavour.setCellFactory(TextFieldTableCell.forTableColumn());
        table_design.setCellFactory(TextFieldTableCell.forTableColumn());
        table_model.setCellFactory(TextFieldTableCell.forTableColumn());
        table_formservices.setCellFactory(TextFieldTableCell.forTableColumn());
        table_formprice.setCellFactory(TextFieldTableCell.forTableColumn(new IntegerStringConverter()));
        table_formemployee.setCellFactory(TextFieldTableCell.forTableColumn());
        table_formservices.setCellFactory(TextFieldTableCell.forTableColumn());
        table_formID.setCellFactory(TextFieldTableCell.forTableColumn(new IntegerStringConverter()));
    }
    @FXML
     void FilterCakeRequestsFromCluj(ActionEvent event) throws IOException {
        if (report1.isSelected()) {
            requestfilteredData.setPredicate(request -> request.getOwnerAddress().contains("Cluj"));
        } else {
            requestfilteredData.setPredicate(request -> true);
        }
    }
    @FXML
    void FilterVanillaCakes(ActionEvent event) throws IOException {
        if (report2.isSelected()) {
            requestfilteredData.setPredicate(request -> request.getFlavour().contains("Vanilla"));
        } else {
            requestfilteredData.setPredicate(request -> true);
        }
    }
    @FXML
    void FilterFormsTakenByJoe(ActionEvent event) throws IOException {
        if (report3.isSelected()) {
            formfilteredData.setPredicate(request -> request.getEmployee().contains("Joe"));
        } else {
            formfilteredData.setPredicate(request -> true);
        }
    }
    @FXML
    void FilterExpensiveCakes(ActionEvent event) throws IOException {
        if (report4.isSelected()) {
            formfilteredData.setPredicate(request -> request.getPrice()>1000);
        } else {
            formfilteredData.setPredicate(request -> true);
        }
    }
    @FXML
    void FilterCheapCakes(ActionEvent event) throws IOException {
        if (report5.isSelected()) {
            formfilteredData.setPredicate(request -> request.getPrice()<600);
        } else {
            formfilteredData.setPredicate(request -> true);
        }
    }
    @FXML
    void ClickedRequestWriteToTextButton(ActionEvent event) throws IOException {
        try{
            writeToTextFileRequests(requestdata);
            writeToTextFileForms(formdata);
        } catch (IOException error){
            error.printStackTrace();
        }
    }
    @FXML
    void ClickedFormWriteToTextButton(ActionEvent event) throws IOException {
        try{
            writeToTextFileForms(formdata);
        } catch (IOException error){
            error.printStackTrace();
        }
    }
    private void writeToTextFileRequests(ObservableList<CakeRequest> requestdata) throws IOException {
        FileWriter writer=new FileWriter("CakeRequests.txt");
        writer.write("-------------------------------------------------CAKE REQUESTS-------------------------------------------------\n");
        for (CakeRequest cake: requestdata){
            writer.write("Cake request with the id: " +cake.getID()+", Owner's name:  " + cake.getOwnerName()+", Owner's address: " + cake.getOwnerAddress()+", PhoneNumber: " + cake.getPhoneNumber()+", cake's flavour: " + cake.getFlavour()+", cake's design " + cake.getDesign()+", cake's model: " + cake.getModel()+"\n");
        }
        writer.close();
    }
    private void writeToTextFileForms(ObservableList<CakeRequestForm> formdata) throws IOException {
        FileWriter writer=new FileWriter("CakeRequestsForms.txt");
        writer.write("-------------------------------------------------CAKE REQUESTS FORMS--------------------------------------------\n");
        for (CakeRequestForm form: formdata){
            writer.write("Cake request form with the id: "+ form.getID() +", request: "+form.getCakeRequest()+", Services:"+form.getServices()+", Price: "+form.getDate()+", Employee: "+form.getEmployee()+", Price: "+form.getPrice()+"\n");
        }
        writer.close();
    }
    @FXML
    void ClickedUpdateRequestButton(ActionEvent event) {
        try {
            int requestedID= Integer.parseInt(field_id.getText());
            String ownername = field_ownername.getText();
            String adress = field_owneradress.getText();
            String phonenumber = field_phonenumber.getText();
            String cakemodel = field_cakemodel.getText();
            String cakeflavour = field_cakeflavour.getText();
            String cakedesign = field_cakedesign.getText();
            int count=0;
            CakeRequest updatedcake=new CakeRequest(requestedID, ownername, adress, phonenumber, cakemodel, cakeflavour, cakedesign);
            for (CakeRequest cake: table.getItems()){
                if (requestedID==cake.getID()) {
                    requestdata.set(count,updatedcake);
                }
                count=count+1;
            }
            field_id.setText("");
            field_owneradress.setText("");
            field_ownername.setText("");
            field_phonenumber.setText("");
            field_cakemodel.setText("");
            field_cakedesign.setText("");
            field_cakeflavour.setText("");
            progressreport.setVisible(true);
            progressbar.setProgress(1);
            progressreport.setText("Done!");
        } catch (NumberFormatException errors) {
            field_id.setText("");
            field_owneradress.setText("");
            field_ownername.setText("");
            field_phonenumber.setText("");
            field_cakemodel.setText("");
            field_cakedesign.setText("");
            field_cakeflavour.setText("");
            progressbar.setStyle("-fx-accent: red;");
            progressreport.setVisible(true);
            progressbar.setProgress(1);
            progressreport.setText("Error!");
            errorreport.setVisible(true);
            errorreport.setText("Errors: "+errors);
        }
    }
    @FXML
    void ClickedUpdateFormButton(ActionEvent event) {
        try {
            int requestedformID = Integer.parseInt(field_formID.getText());
            int formcakeID=Integer.parseInt(field_formcakeID.getText());
            CakeRequest WantedCake = null;
            for (CakeRequest cake: table.getItems()){
                if (formcakeID==cake.getID()) {
                    WantedCake=cake;
                }
            }
            String services = field_services.getText();
            int price = Integer.parseInt(field_price.getText());
            String date= String.valueOf(field_date.getValue());
            String employee=field_employee.getText();
            int countform=0;
            CakeRequestForm updatedform= new CakeRequestForm(requestedformID, WantedCake, services, price, date, employee);
            for (CakeRequestForm form: tableform.getItems()){
                if (requestedformID==form.getID()) {
                    formdata.set(countform,updatedform);
                }
                countform=countform+1;
            }
            field_formID.setText("");
            field_formcakeID.setText("");
            field_services.setText("");
            field_price.setText("");
            field_employee.setText("");
            field_date.getEditor().clear();
            progressformreport.setVisible(true);
            progressbar2.setProgress(1);
            progressformreport.setText("Done!");
        } catch (NumberFormatException error) {
            field_formID.setText("");
            field_formcakeID.setText("");
            field_services.setText("");
            field_price.setText("");
            field_employee.setText("");
            field_date.getEditor().clear();
            progressbar2.setStyle("-fx-accent: red;");
            progressformreport.setVisible(true);
            progressbar2.setProgress(1);
            progressformreport.setText("Error!");
            errorreportform.setVisible(true);
            errorreportform.setText("Errors: "+error);
        }
    }
    @FXML
    void ClickedminiDeleteRequestButton(ActionEvent event) {
        int requestedID= Integer.parseInt(field_id.getText());
        int count=0;
        for (CakeRequest cake : table.getItems()) {
            if (requestedID == cake.getID()) {
                requestdata.remove(count);
            }
            count = count + 1;
        }
        field_id.setText("");
        field_owneradress.setText("");
        field_ownername.setText("");
        field_phonenumber.setText("");
        field_cakemodel.setText("");
        field_cakedesign.setText("");
        field_cakeflavour.setText("");
        progressreport.setVisible(true);
        progressbar.setProgress(1);
        progressreport.setText("Done!");
    }
    /*
    @FXML
    void ClickedminiDeleteFormButton(ActionEvent event) {
        int requestedID= Integer.parseInt(field_id.getText());
        int countform=0;
        for (CakeRequestForm form: tableform.getItems()){
            if (requestedID==form.getID()) {
                formdata.remove(countform);
            }
            countform=countform+1;
        }
        field_formID.setText("");
        field_formcakeID.setText("");
        field_services.setText("");
        field_price.setText("");
        field_employee.setText("");
        field_date.getEditor().clear();
        progressformreport.setVisible(true);
        progressbar2.setProgress(1);
        progressformreport.setText("Done!");
    }
     */
}
