module com.example.__fx__homeassignment {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.__fx__homeassignment to javafx.fxml;
    exports com.example.__fx__homeassignment;
}