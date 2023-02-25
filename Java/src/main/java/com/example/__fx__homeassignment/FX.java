package com.example.__fx__homeassignment;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;
import java.io.IOException;


public class FX extends Application {
    @Override
    public void start(Stage stage) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(FX.class.getResource("FXfile.fxml"));
        Scene scene = new Scene(fxmlLoader.load(), 990, 600);
        stage.setTitle("Cake Request Simulator and all that! Tell your friends!");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}

