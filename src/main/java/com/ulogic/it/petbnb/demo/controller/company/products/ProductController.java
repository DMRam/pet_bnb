package com.ulogic.it.petbnb.demo.controller.company.products;

import com.ulogic.it.petbnb.demo.model.company.products.PetProduct;
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
@RequestMapping("/product")
public class ProductController {

    @GetMapping("/get_all")
    public ResponseEntity<List<PetProduct>> getProducts() {

        return null;
    }

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.OK)
    public void addProduct(@RequestBody PetProduct petProduct) {

    }

    @PutMapping("/update")
    @ResponseStatus(HttpStatus.OK)
    public void updateProduct(@RequestBody PetProduct petProduct) {

    }

    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.OK)
    public void deleteProduct() {

    }

}
