package com.ulogic.it.petbnb.demo.service.users;

import com.google.firebase.FirebaseApp;
import com.google.firebase.database.*;
import com.ulogic.it.petbnb.demo.model.users.Client;
import com.ulogic.it.petbnb.demo.util.user.ClientUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.concurrent.CompletableFuture;

/**
 * <p>
 * </p>
 *
 * @author dannymunoz on 2023-10-23
 * @project demo
 */
@Service
public class ClientDataServices {

    @Autowired
    private FirebaseApp firebaseApp;
    @Autowired
    private FirebaseDatabase firebaseDatabase;
    @Autowired
    ClientUtil clientUtil;


    /**
     * <p>
     *
     * </p>
     *
     * @return
     */
    public CompletableFuture<List<Client>> getClientsData() {

        CompletableFuture<List<Client>> future = new CompletableFuture<>();

        try {
            DatabaseReference databaseReference = firebaseDatabase.getReference("pet_bnb_clients");
            databaseReference.addListenerForSingleValueEvent(new ValueEventListener() {
                /**
                 * <p>
                 *     Passing DataSnapshot util method is returning a list of Client
                 * </p>
                 * @param dataSnapshot The current data at the location
                 */
                @Override
                public void onDataChange(DataSnapshot dataSnapshot) {
                    // BusinessUtil creates List of Business from DataSnapshot
                    future.complete(clientUtil.clientsListFactory(dataSnapshot));
                }

                @Override
                public void onCancelled(DatabaseError databaseError) {
                    System.out.println("The read failed: " + databaseError.getCode());
                    future.completeExceptionally(databaseError.toException());
                }
            });
        } catch (Exception e) {
            // Handle the exception here
            future.completeExceptionally(e);
        }

        return future;
    }

    /**
     * <p>
     * Adding clients to Firebase
     * </p>
     */
    public void addClientData(@RequestBody Client client) {
        try {
            DatabaseReference ref = FirebaseDatabase.getInstance().getReference().child("pet_bnb_clients").push();
            String key = ref.getKey();
            client.setId(key);

            ref.setValue(client, new DatabaseReference.CompletionListener() {
                @Override
                public void onComplete(DatabaseError error, DatabaseReference ref) {
                    if (error != null) {
                        // Handle the error
                        System.out.println("Error while setting value: " + error.getMessage());
                    } else {
                        // The operation completed successfully
                        System.out.println("The operation completed successfully");
                    }
                }
            });
        } catch (Exception e) {
            // Handle the exception here
            System.out.println("An exception occurred: " + e.getMessage());
        }
    }

    /**
     * <p>
     * Delete Client
     * </p>
     *
     * @param id
     */
    public void deleteClientById(String id) {

        try {
            DatabaseReference ref = firebaseDatabase.getReference("pet_bnb_clients/" + id);

            System.out.println("Reference to be removed: " + ref);

            ref.removeValue((error, ref1) -> {
                if (error != null) {
                    System.err.println("Error removing element: " + error.getMessage());
                } else {
                    System.out.println("Element removed successfully");
                }
            });
        } catch (Exception e) {
            // Handle the exception here
            System.out.println("An exception occurred: " + e.getMessage());
        }
    }

    /**
     * <p>
     * Update Client by Id
     * </p>
     *
     * @param client
     */
    public void updateClientById(Client client, String id) {
        try {
            DatabaseReference ref = firebaseDatabase.getReference("pet_bnb_clients/" + id);

            ref.setValue(client, new DatabaseReference.CompletionListener() {
                @Override
                public void onComplete(DatabaseError error, DatabaseReference ref) {
                    if (error != null) {
                        // Handle the error
                        System.out.println("Not Done");
                    } else {
                        // The operation completed successfully
                        System.out.println("The operation completed successfully");
                    }
                }
            });

        } catch (Exception e) {
            System.out.println("An exception occurred: " + e.getMessage());
        }

    }
}
