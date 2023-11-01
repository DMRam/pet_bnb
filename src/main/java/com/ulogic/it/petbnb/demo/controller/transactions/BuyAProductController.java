package com.ulogic.it.petbnb.demo.controller.transactions;

import com.ulogic.it.petbnb.demo.model.pet.Pet;
import com.ulogic.it.petbnb.demo.model.transactions.BuyAProduct;
import com.ulogic.it.petbnb.demo.service.pet.PetDataServices;
import com.ulogic.it.petbnb.demo.service.transactions.BuyAProductDataServices;
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
@RequestMapping("/buy_product")
public class BuyAProductController {

    @Autowired
    BuyAProductDataServices buyAProductDataServices;

    @GetMapping("/get_all")
    public ResponseEntity<List<BuyAProduct>> getBuyAProduct() throws ExecutionException, InterruptedException {

        return new ResponseEntity<>(buyAProductDataServices.getBuyAProductData().get(), HttpStatus.OK);
    }

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.OK)
    public void addBuyAProduct(@RequestBody BuyAProduct buyAProduct) {
        buyAProductDataServices.addBuyAProductData(buyAProduct);
    }

    @PutMapping("/update/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void updateBuyAProduct(@RequestBody BuyAProduct buyAProduct, @RequestParam String id) {
        buyAProductDataServices.updateBuyAProductById(buyAProduct, id);

    }

    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.OK)
    public void deleteBuyAProduct(@RequestBody String id) {
        buyAProductDataServices.deleteBuyAProductById(id);

    }
}
