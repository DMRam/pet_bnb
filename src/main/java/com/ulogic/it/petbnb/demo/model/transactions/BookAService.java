package com.ulogic.it.petbnb.demo.model.transactions;

import com.ulogic.it.petbnb.demo.model.users.Client;
import com.ulogic.it.petbnb.demo.model.users.PetHost;
import com.ulogic.it.petbnb.demo.model.users.ServiceSeller;

/**
 * <p>
 * </p>
 *
 * @author dannymunoz on 2023-10-23
 * @project demo
 */
public class BookAService {

    private String id;
    private String serviceName;
    private double price;

    private ServiceSeller serviceSeller;

    private Client client;

    public BookAService(String id, String serviceName, double price, ServiceSeller serviceSeller, Client client) {
        this.id = id;
        this.serviceName = serviceName;
        this.price = price;
        this.serviceSeller = serviceSeller;
        this.client = client;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
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

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }
}
