package com.ulogic.it.petbnb.demo.model.company.service;

import com.ulogic.it.petbnb.demo.model.users.ServiceSeller;

/**
 * <p>
 * </p>
 *
 * @author dannymunoz on 2023-10-23
 * @project demo
 */
public class PetService {

    private String id;
    private String name;
    private String description;

    private double price;

    private ServiceSeller serviceSeller;

    public PetService(String id, String name, String description, double price, ServiceSeller serviceSeller) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.serviceSeller = serviceSeller;
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

    public ServiceSeller getServiceSeller() {
        return serviceSeller;
    }

    public void setServiceSeller(ServiceSeller serviceSeller) {
        this.serviceSeller = serviceSeller;
    }
}
