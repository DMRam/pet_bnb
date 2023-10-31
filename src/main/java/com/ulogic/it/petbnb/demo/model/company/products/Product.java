package com.ulogic.it.petbnb.demo.model.company.products;

import com.ulogic.it.petbnb.demo.model.users.ProductSeller;

/**
 * <p>
 * </p>
 *
 * @author dannymunoz on 2023-10-23
 * @project demo
 */
public class Product {

    private String id;
    private String name;
    private String description;

    private double price;

    private ProductSeller productSeller;

    public Product(String id, String name, String description, double price, ProductSeller productSeller) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.productSeller = productSeller;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
}
