package com.ulogic.it.petbnb.demo.util.user;

import com.google.firebase.database.DataSnapshot;
import com.ulogic.it.petbnb.demo.model.pet.Pet;
import com.ulogic.it.petbnb.demo.model.users.Client;
import com.ulogic.it.petbnb.demo.model.users.Vet;
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
public class VetUtil {

    public List<Vet> vetsListFactory(DataSnapshot dataSnapshot) {
        List<Vet> vetList = new ArrayList<>();
        try {
            if (dataSnapshot.exists()) {
                for (DataSnapshot childSnapshot : dataSnapshot.getChildren()) {
                    String id = childSnapshot.getKey();
                    String userName = childSnapshot.child("name").getValue(String.class);
                    String lastName = childSnapshot.child("lastName").getValue(String.class);
                    String password = childSnapshot.child("password").getValue(String.class);
                    Vet vet = new Vet(id, userName, lastName, password);
                    vetList.add(vet);
                }
            }
            return vetList;

        } catch (Exception e) {
            System.out.println("EXCEPTION UTIL VET: " + e);
        }
        return null;
    }
}
