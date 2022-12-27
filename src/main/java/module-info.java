module org.but.feec.library {

    requires javafx.graphics;
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;
    requires org.slf4j;
    requires com.zaxxer.hikari;


    opens org.but.feec.library to javafx.fxml;
    exports org.but.feec.library;
}