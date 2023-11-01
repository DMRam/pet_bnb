package com.ulogic.it.petbnb.demo.service.transactions;

import com.google.firebase.FirebaseApp;
import com.google.firebase.database.*;
import com.ulogic.it.petbnb.demo.model.transactions.BookAService;
import com.ulogic.it.petbnb.demo.util.transaction.BookAServiceUtil;
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
public class BookAServiceDataServices {


    @Autowired
    private FirebaseApp firebaseApp;
    @Autowired
    private FirebaseDatabase firebaseDatabase;
    @Autowired
    BookAServiceUtil bookAServiceUtil;


    /**
     * <p>
     *
     * </p>
     *
     * @return
     */
    public CompletableFuture<List<BookAService>> getBookAServiceData() {

        CompletableFuture<List<BookAService>> future = new CompletableFuture<>();

        try {
            DatabaseReference databaseReference = firebaseDatabase.getReference("pet_bnb_book_a_service");
            databaseReference.addListenerForSingleValueEvent(new ValueEventListener() {
                /**
                 * <p>
                 *     Passing DataSnapshot util method is returning a list of {@link BookAService}
                 * </p>
                 * @param dataSnapshot The current data at the location
                 */
                @Override
                public void onDataChange(DataSnapshot dataSnapshot) {
                    // BusinessUtil creates List of Business from DataSnapshot
                    future.complete(bookAServiceUtil.bookAServicesListFactory(dataSnapshot));
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
     * Adding bookAService to Firebase
     * </p>
     */
    public void addBookAServiceData(@RequestBody BookAService bookAService) {
        try {
            DatabaseReference ref = FirebaseDatabase.getInstance().getReference().child("pet_bnb_book_a_service").push();
            String key = ref.getKey();
            bookAService.setId(key);

            ref.setValue(bookAService, new DatabaseReference.CompletionListener() {
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
     * Delete {@link BookAService}
     * </p>
     *
     * @param id
     */
    public void deleteBookAServiceById(String id) {

        try {
            DatabaseReference ref = firebaseDatabase.getReference("pet_bnb_book_a_service/" + id);

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
     * Update {@link BookAService} by Id
     * </p>
     *
     * @param bookAService
     */
    public void updateBookAServiceById(BookAService bookAService, String id) {
        try {
            DatabaseReference ref = firebaseDatabase.getReference("pet_bnb_book_a_service/" + id);

            ref.setValue(bookAService, new DatabaseReference.CompletionListener() {
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
