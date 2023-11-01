package com.ulogic.it.petbnb.demo.util.pet;

import com.google.firebase.database.DataSnapshot;
import com.ulogic.it.petbnb.demo.model.pet.Pet;
import com.ulogic.it.petbnb.demo.model.users.Client;
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
public class PetUtil {

    public List<Pet> petsListFactory(DataSnapshot dataSnapshot) {
        List<Pet> petsList = new ArrayList<>();
        try {
            if (dataSnapshot.exists()) {
                for (DataSnapshot childSnapshot : dataSnapshot.getChildren()) {
                    String id = childSnapshot.getKey();
                    String userName = childSnapshot.child("name").getValue(String.class);
                    Client client = childSnapshot.child(("owner")).getValue(Client.class);
                    Pet pet = new Pet(id, userName, client);
                    petsList.add(pet);
                }
            }
            return petsList;

        } catch (Exception e) {
            System.out.println("EXCEPTION UTIL PET: " + e);
        }
        return null;
    }
}
