package com.ulogic.it.petbnb.demo.model.users;

import com.ulogic.it.petbnb.demo.model.pet.Pet;

/**
 * <p>
 * </p>
 *
 * @author dannymunoz on 2023-10-23
 * @project demo
 */
public class Client extends User {

    private Pet pet;

    public Client(String id, String name, String lastName, String password, Pet pet) {
        super(id, name, lastName, password);
        this.pet = pet;
    }

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
    }
}
