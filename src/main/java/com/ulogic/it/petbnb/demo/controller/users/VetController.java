package com.ulogic.it.petbnb.demo.controller.users;

import com.ulogic.it.petbnb.demo.model.pet.Pet;
import com.ulogic.it.petbnb.demo.model.users.Vet;
import com.ulogic.it.petbnb.demo.service.pet.PetDataServices;
import com.ulogic.it.petbnb.demo.service.users.VetDataServices;
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
@RequestMapping("/vet")
public class VetController {

    @Autowired
    VetDataServices vetDataServices;

    @GetMapping("/get_all")
    public ResponseEntity<List<Vet>> getVet() throws ExecutionException, InterruptedException {

        return new ResponseEntity<>(vetDataServices.getVetData().get(), HttpStatus.OK);
    }

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.OK)
    public void addVet(@RequestBody Vet vet) {
        vetDataServices.addVetData(vet);
    }

    @PutMapping("/update/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void updateVet(@RequestBody Vet vet, @RequestParam String id) {
        vetDataServices.updateVetById(vet, id);

    }

    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.OK)
    public void deleteVet(@RequestBody String id) {
        vetDataServices.deleteVetById(id);
    }
}
