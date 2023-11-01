package com.ulogic.it.petbnb.demo.util.transaction;

import com.google.firebase.database.DataSnapshot;
import com.ulogic.it.petbnb.demo.model.pet.Pet;
import com.ulogic.it.petbnb.demo.model.transactions.BookAPlace;
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
public class BookAPlaceUtil {

    public List<BookAPlace> bookAPlacesListFactory(DataSnapshot dataSnapshot) {
        List<BookAPlace> bookAPlacesList = new ArrayList<>();
        try {
            if (dataSnapshot.exists()) {
                for (DataSnapshot childSnapshot : dataSnapshot.getChildren()) {
                    String id = childSnapshot.getKey();
                    String placeName = childSnapshot.child("placeName").getValue(String.class);
                    double price = childSnapshot.child("price").getValue(double.class);
                    PetHost petHost = childSnapshot.child("petHost").getValue(PetHost.class);
                    Client client = childSnapshot.child("client").getValue(Client.class);
                    BookAPlace bookAPlace = new BookAPlace(id, placeName, price, petHost, client);
                    bookAPlacesList.add(bookAPlace);
                }
            }
            return bookAPlacesList;

        } catch (Exception e) {
            System.out.println("EXCEPTION UTIL BOOK A PLACE: " + e);
        }
        return null;
    }
}
