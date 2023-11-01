package com.ulogic.it.petbnb.demo.util.transaction;

import com.google.firebase.database.DataSnapshot;
import com.ulogic.it.petbnb.demo.model.pet.Pet;
import com.ulogic.it.petbnb.demo.model.transactions.BookAService;
import com.ulogic.it.petbnb.demo.model.users.Client;
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
public class BookAServiceUtil {

    public List<BookAService> bookAServicesListFactory(DataSnapshot dataSnapshot) {
        List<BookAService> bookAServices = new ArrayList<>();
        try {
            if (dataSnapshot.exists()) {
                for (DataSnapshot childSnapshot : dataSnapshot.getChildren()) {
                    String id = childSnapshot.getKey();
                    String serviceName = childSnapshot.child("serviceName").getValue(String.class);
                    double price = childSnapshot.child("price").getValue(double.class);
                    ServiceSeller serviceSeller = childSnapshot.child("serviceSeller").getValue(ServiceSeller.class);
                    Client client = childSnapshot.child("client").getValue(Client.class);
                    BookAService bookAService = new BookAService(id, serviceName, price, serviceSeller, client);
                    bookAServices.add(bookAService);
                }
            }
            return bookAServices;

        } catch (Exception e) {
            System.out.println("EXCEPTION UTIL BOOK A SERVICE: " + e);
        }
        return null;
    }
}
