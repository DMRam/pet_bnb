package com.ulogic.it.petbnb.demo.util.services;

import com.google.firebase.database.DataSnapshot;
import com.ulogic.it.petbnb.demo.model.company.service.PetService;
import com.ulogic.it.petbnb.demo.model.users.ServiceSeller;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * </p>
 *
 * @author dannymunoz on 2023-10-23
 * @project demo
 */
@Component
public class PetServiceUtil {

    public List<PetService> petServicesListFactory(DataSnapshot dataSnapshot) {
        List<PetService> petServicesList = new ArrayList<>();
        try {
            if (dataSnapshot.exists()) {
                for (DataSnapshot childSnapshot : dataSnapshot.getChildren()) {
                    String id = childSnapshot.getKey();
                    String name = childSnapshot.child("name").getValue(String.class);
                    String description = childSnapshot.child("description").getValue(String.class);
                    double price = childSnapshot.child("price").getValue(double.class);
                    ServiceSeller serviceSeller = childSnapshot.child("serviceSeller").getValue(ServiceSeller.class);
                    PetService petService = new PetService(id, name, description, price, serviceSeller);
                    petServicesList.add(petService);
                }
            }
            return petServicesList;

        } catch (Exception e) {
            System.out.println("EXCEPTION UTIL PET SERVICES: " + e);
        }
        return null;
    }
}
