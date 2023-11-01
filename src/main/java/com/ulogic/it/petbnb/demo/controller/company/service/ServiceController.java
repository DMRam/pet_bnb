package com.ulogic.it.petbnb.demo.controller.company.service;

import com.ulogic.it.petbnb.demo.model.company.service.PetService;
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
@RequestMapping("/service")
public class ServiceController {

    @GetMapping("/get_all")
    public ResponseEntity<List<PetService>> getServices() {

        return null;
    }

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.OK)
    public void addService(@RequestBody PetService PetService) {

    }

    @PutMapping("/update")
    @ResponseStatus(HttpStatus.OK)
    public void updateService(@RequestBody PetService PetService) {

    }

    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.OK)
    public void deleteService() {

    }
}
