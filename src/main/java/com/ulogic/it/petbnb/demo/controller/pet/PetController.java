package com.ulogic.it.petbnb.demo.controller.pet;

import com.ulogic.it.petbnb.demo.model.pet.Pet;
import com.ulogic.it.petbnb.demo.service.pet.PetDataServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * <p>
 * </p>
 *
 * @author dannymunoz on 2023-10-23
 * @project demo
 */
@RestController
@RequestMapping("/pet")
public class PetController {

    @Autowired
    PetDataServices petDataServices;

    @GetMapping("/get_all")
    public ResponseEntity<List<Pet>> getPets() throws ExecutionException, InterruptedException {

        return new ResponseEntity<>(petDataServices.getPetData().get(), HttpStatus.OK);
    }

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.OK)
    public void addPet(@RequestBody Pet pet) {
        petDataServices.addPetData(pet);
    }

    @PutMapping("/update/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void updatePet(@RequestBody Pet pet, @RequestParam String id) {
        petDataServices.updatePetById(pet, id);

    }

    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.OK)
    public void deletePet(@RequestBody String id) {
        petDataServices.deletePetsById(id);

    }
}
