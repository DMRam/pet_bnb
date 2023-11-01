package com.ulogic.it.petbnb.demo.model.transactions;

import com.ulogic.it.petbnb.demo.model.users.Client;
import com.ulogic.it.petbnb.demo.model.users.PetHost;
import com.ulogic.it.petbnb.demo.model.users.ProductSeller;

/**
 * <p>
 * </p>
 *
 * @author dannymunoz on 2023-10-23
 * @project demo
 */
public class BuyAProduct {

    private String id;
    private String productName;
    private double price;

    private ProductSeller productSeller;

    private Client client;

    public BuyAProduct(String id, String productName, double price, ProductSeller productSeller, Client client) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.productSeller = productSeller;
        this.client = client;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public ProductSeller getProductSeller() {
        return productSeller;
    }

    public void setProductSeller(ProductSeller productSeller) {
        this.productSeller = productSeller;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }
}
