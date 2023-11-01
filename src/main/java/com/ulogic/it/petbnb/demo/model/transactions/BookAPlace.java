package com.ulogic.it.petbnb.demo.model.transactions;

import com.ulogic.it.petbnb.demo.model.users.Client;
import com.ulogic.it.petbnb.demo.model.users.PetHost;

/**
 * <p>
 * </p>
 *
 * @author dannymunoz on 2023-10-23
 * @project demo
 */
public class BookAPlace {

    private String id;
    private String placeName;
    private double price;

    private PetHost petHost;

    private Client client;

    public BookAPlace(String id, String placeName, double price, PetHost petHost, Client client) {
        this.id = id;
        this.placeName = placeName;
        this.price = price;
        this.petHost = petHost;
        this.client = client;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public PetHost getPetHost() {
        return petHost;
    }

    public void setPetHost(PetHost petHost) {
        this.petHost = petHost;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }
}
