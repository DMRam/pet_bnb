package com.ulogic.it.petbnb.demo.firebase;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.database.FirebaseDatabase;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.FileInputStream;
import java.io.IOException;

@Configuration
public class Firebase {

    @Bean
    public FirebaseApp firebaseApp() throws IOException {
        FileInputStream serviceAccount = new FileInputStream(
                "/Users/dannymunoz/IdeaProjects/" +
                        "pet_bnb/src/main/resources/static/" +
                        "petbnb-c5acb-firebase-adminsdk-me4tn-" +
                        "e6c7803f3a.json");

        FirebaseOptions options = new FirebaseOptions.Builder()
                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                .setDatabaseUrl("https://petbnb-c5acb-default-rtdb.firebaseio.com")
                .build();

        return FirebaseApp.initializeApp(options);
    }

    @Bean
    public FirebaseDatabase firebaseDatabase() {
        return FirebaseDatabase.getInstance();
    }


}