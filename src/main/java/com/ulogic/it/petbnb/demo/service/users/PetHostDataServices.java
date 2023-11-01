package com.ulogic.it.petbnb.demo.service.users;

import com.google.firebase.FirebaseApp;
import com.google.firebase.database.*;
import com.ulogic.it.petbnb.demo.model.users.PetHost;
import com.ulogic.it.petbnb.demo.util.user.PetHostUtil;
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
public class PetHostDataServices {


    @Autowired
    private FirebaseApp firebaseApp;
    @Autowired
    private FirebaseDatabase firebaseDatabase;
    @Autowired
    PetHostUtil petHostUtil;


    /**
     * <p>
     *
     * </p>
     *
     * @return
     */
    public CompletableFuture<List<PetHost>> getPetHostData() {

        CompletableFuture<List<PetHost>> future = new CompletableFuture<>();

        try {
            DatabaseReference databaseReference = firebaseDatabase.getReference("pet_bnb_pet_host");
            databaseReference.addListenerForSingleValueEvent(new ValueEventListener() {
                /**
                 * <p>
                 *     Passing DataSnapshot util method is returning a list of {@link PetHost}
                 * </p>
                 * @param dataSnapshot The current data at the location
                 */
                @Override
                public void onDataChange(DataSnapshot dataSnapshot) {
                    // BusinessUtil creates List of Business from DataSnapshot
                    future.complete(petHostUtil.petHostsListFactory(dataSnapshot));
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
     * Adding {@link PetHost} to Firebase
     * </p>
     */
    public void addPetHostData(@RequestBody PetHost petHost) {
        try {
            DatabaseReference ref = FirebaseDatabase.getInstance().getReference().child("pet_bnb_pet_host").push();
            String key = ref.getKey();
            petHost.setId(key);

            ref.setValue(petHost, new DatabaseReference.CompletionListener() {
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
     * Delete {@link PetHost}
     * </p>
     *
     * @param id
     */
    public void deletePetHostById(String id) {

        try {
            DatabaseReference ref = firebaseDatabase.getReference("pet_bnb_pet_host/" + id);

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
     * Update {@link PetHost} by Id
     * </p>
     *
     * @param petHost
     */
    public void updatePetHostById(PetHost petHost, String id) {
        try {
            DatabaseReference ref = firebaseDatabase.getReference("pet_bnb_pet_host/" + id);

            ref.setValue(petHost, new DatabaseReference.CompletionListener() {
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
