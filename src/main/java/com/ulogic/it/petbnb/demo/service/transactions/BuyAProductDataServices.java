package com.ulogic.it.petbnb.demo.service.transactions;

import com.google.firebase.FirebaseApp;
import com.google.firebase.database.*;
import com.ulogic.it.petbnb.demo.model.transactions.BuyAProduct;
import com.ulogic.it.petbnb.demo.util.transaction.BuyAProductUtil;
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
public class BuyAProductDataServices {


    @Autowired
    private FirebaseApp firebaseApp;
    @Autowired
    private FirebaseDatabase firebaseDatabase;
    @Autowired
    BuyAProductUtil buyAProductUtil;


    /**
     * <p>
     *
     * </p>
     *
     * @return
     */
    public CompletableFuture<List<BuyAProduct>> getBuyAProductData() {

        CompletableFuture<List<BuyAProduct>> future = new CompletableFuture<>();

        try {
            DatabaseReference databaseReference = firebaseDatabase.getReference("pet_bnb_buy_product");
            databaseReference.addListenerForSingleValueEvent(new ValueEventListener() {
                /**
                 * <p>
                 *     Passing DataSnapshot util method is returning a list of {@link BuyAProduct}
                 * </p>
                 * @param dataSnapshot The current data at the location
                 */
                @Override
                public void onDataChange(DataSnapshot dataSnapshot) {
                    // BusinessUtil creates List of Business from DataSnapshot
                    future.complete(buyAProductUtil.buyAProductsListFactory(dataSnapshot));
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
     * Adding buyAProduct to Firebase
     * </p>
     */
    public void addBuyAProductData(@RequestBody BuyAProduct buyAProduct) {
        try {
            DatabaseReference ref = FirebaseDatabase.getInstance().getReference().child("pet_bnb_buy_product").push();
            String key = ref.getKey();
            buyAProduct.setId(key);

            ref.setValue(buyAProduct, new DatabaseReference.CompletionListener() {
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
     * Delete {@link BuyAProduct}
     * </p>
     *
     * @param id
     */
    public void deleteBuyAProductById(String id) {

        try {
            DatabaseReference ref = firebaseDatabase.getReference("pet_bnb_buy_product/" + id);

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
     * Update {@link BuyAProduct} by Id
     * </p>
     *
     * @param buyAProduct
     */
    public void updateBuyAProductById(BuyAProduct buyAProduct, String id) {
        try {
            DatabaseReference ref = firebaseDatabase.getReference("pet_bnb_buy_product/" + id);

            ref.setValue(buyAProduct, new DatabaseReference.CompletionListener() {
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
