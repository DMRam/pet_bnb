package com.ulogic.it.petbnb.demo.util.user;

import com.google.firebase.database.DataSnapshot;
import com.ulogic.it.petbnb.demo.model.pet.Pet;
import com.ulogic.it.petbnb.demo.model.users.Client;
import com.ulogic.it.petbnb.demo.model.users.PetHost;
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
public class PetHostUtil {

    public List<PetHost> petHostsListFactory(DataSnapshot dataSnapshot) {
        List<PetHost> petHostList = new ArrayList<>();
        try {
            if (dataSnapshot.exists()) {
                for (DataSnapshot childSnapshot : dataSnapshot.getChildren()) {
                    String id = childSnapshot.getKey();
                    String userName = childSnapshot.child("name").getValue(String.class);
                    String lastName = childSnapshot.child("lastName").getValue(String.class);
                    String password = childSnapshot.child("password").getValue(String.class);
                    Pet pet = childSnapshot.child("pet").getValue(Pet.class);
                    PetHost petHost = new PetHost(id, userName, lastName, password);
                    petHostList.add(petHost);
                }
            }
            return petHostList;

        } catch (Exception e) {
            System.out.println("EXCEPTION UTIL PET HOST: " + e);
        }
        return null;
    }
}
