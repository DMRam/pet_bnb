package com.ulogic.it.petbnb.demo.controller.company.service;

import com.ulogic.it.petbnb.demo.model.company.service.PetService;
import com.ulogic.it.petbnb.demo.service.services.ServiceDataServices;
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
@RequestMapping("/service")
public class ServiceController {

    @Autowired
    ServiceDataServices serviceDataServices;

    @GetMapping("/get_all")
    public ResponseEntity<List<PetService>> getPetServices() throws ExecutionException, InterruptedException {

        return new ResponseEntity<>(serviceDataServices.getPetServiceData().get(), HttpStatus.OK);
    }

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.OK)
    public void addPetServices(@RequestBody PetService petService) {

        serviceDataServices.addPetServiceData(petService);
    }

    @PutMapping("/update/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void updatePetService(@RequestBody PetService petService, @RequestParam String id) {
        serviceDataServices.updatePetServiceById(petService, id);
    }

    @DeleteMapping("/delete/")
    @ResponseStatus(HttpStatus.OK)
    public void deletePetService(@RequestParam String id) {
        serviceDataServices.deletePetServiceById(id);

    }
}
