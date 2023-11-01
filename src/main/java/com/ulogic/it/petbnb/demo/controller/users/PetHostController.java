package com.ulogic.it.petbnb.demo.controller.users;

import com.ulogic.it.petbnb.demo.model.pet.Pet;
import com.ulogic.it.petbnb.demo.model.users.PetHost;
import com.ulogic.it.petbnb.demo.service.pet.PetDataServices;
import com.ulogic.it.petbnb.demo.service.users.PetHostDataServices;
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
@RequestMapping("/pet_host")
public class PetHostController {

    @Autowired
    PetHostDataServices petHostDataServices;

    @GetMapping("/get_all")
    public ResponseEntity<List<PetHost>> getPetHost() throws ExecutionException, InterruptedException {

        return new ResponseEntity<>(petHostDataServices.getPetHostData().get(), HttpStatus.OK);
    }

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.OK)
    public void addPetHost(@RequestBody PetHost petHost) {
        petHostDataServices.addPetHostData(petHost);
    }

    @PutMapping("/update/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void updatePetHost(@RequestBody PetHost petHost, @RequestParam String id) {
        petHostDataServices.updatePetHostById(petHost, id);

    }

    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.OK)
    public void deletePetHost(@RequestBody String id) {
        petHostDataServices.deletePetHostById(id);

    }
}
