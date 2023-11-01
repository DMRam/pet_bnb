package com.ulogic.it.petbnb.demo.util.products;

import com.google.firebase.database.DataSnapshot;
import com.ulogic.it.petbnb.demo.model.company.products.PetProduct;
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
public class ProductUtil {

    public List<PetProduct> productsListFactory(DataSnapshot dataSnapshot) {
        List<PetProduct> productsList = new ArrayList<>();
        try {
            if (dataSnapshot.exists()) {
                for (DataSnapshot childSnapshot : dataSnapshot.getChildren()) {
                    String id = childSnapshot.getKey();
                    String name = childSnapshot.child("name").getValue(String.class);
                    String description = childSnapshot.child("description").getValue(String.class);
                    double price = childSnapshot.child("price").getValue(double.class);
                    ProductSeller productSeller = childSnapshot.child(("productSeller")).getValue(ProductSeller.class);
                    PetProduct petProduct = new PetProduct(id, name, description, price, productSeller);
                    productsList.add(petProduct);
                }
            }
            return productsList;

        } catch (Exception e) {
            System.out.println("EXCEPTION UTIL PRODUCT: " + e);
        }
        return null;
    }
}
