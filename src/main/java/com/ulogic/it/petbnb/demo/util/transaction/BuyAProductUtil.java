package com.ulogic.it.petbnb.demo.util.transaction;

import com.google.firebase.database.DataSnapshot;
import com.ulogic.it.petbnb.demo.model.pet.Pet;
import com.ulogic.it.petbnb.demo.model.transactions.BuyAProduct;
import com.ulogic.it.petbnb.demo.model.users.Client;
import com.ulogic.it.petbnb.demo.model.users.ProductSeller;
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
public class BuyAProductUtil {

    public List<BuyAProduct> buyAProductsListFactory(DataSnapshot dataSnapshot) {
        List<BuyAProduct> buyAProductList = new ArrayList<>();
        try {
            if (dataSnapshot.exists()) {
                for (DataSnapshot childSnapshot : dataSnapshot.getChildren()) {
                    String id = childSnapshot.getKey();
                    String productName = childSnapshot.child("productName").getValue(String.class);
                    double price = childSnapshot.child("price").getValue(double.class);
                    ProductSeller productSeller = childSnapshot.child("productSeller").getValue(ProductSeller.class);
                    Client client = childSnapshot.child("client").getValue(Client.class);
                    BuyAProduct buyAProduct = new BuyAProduct(id, productName, price, productSeller, client);
                    buyAProductList.add(buyAProduct);
                }
            }
            return buyAProductList;

        } catch (Exception e) {
            System.out.println("EXCEPTION UTIL BUY A PRODUCT: " + e);
        }
        return null;
    }
}
