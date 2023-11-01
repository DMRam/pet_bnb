package com.ulogic.it.petbnb.demo.controller.company.products;

import com.ulogic.it.petbnb.demo.model.company.products.PetProduct;
import com.ulogic.it.petbnb.demo.service.products.ProductDataServices;
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
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductDataServices productDataServices;

    @GetMapping("/get_all")
    public ResponseEntity<List<PetProduct>> getProducts() throws ExecutionException, InterruptedException {

        return new ResponseEntity<>(productDataServices.getProductsData().get(), HttpStatus.OK);
    }

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.OK)
    public void addProduct(@RequestBody PetProduct petProduct) {

        productDataServices.addProductData(petProduct);
    }

    @PutMapping("/update/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void updateProduct(@RequestBody PetProduct petProduct, @RequestParam String id) {
        productDataServices.updateProductById(petProduct, id);
    }

    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.OK)
    public void deleteProduct(@RequestBody String id) {
        productDataServices.deleteProductById(id);
    }

}
