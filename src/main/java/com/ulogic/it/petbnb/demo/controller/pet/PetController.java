package com.ulogic.it.petbnb.demo.controller.pet;

import com.ulogic.it.petbnb.demo.model.pet.Pet;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    @GetMapping("/get_all")
    public ResponseEntity<List<Pet>> getPets() {

        return null;
    }

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.OK)
    public void addPet(@RequestBody Pet Pet) {

    }

    @PutMapping("/update")
    @ResponseStatus(HttpStatus.OK)
    public void updatePet(@RequestBody Pet Pet) {

    }

    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.OK)
    public void deletePet() {

    }
}
