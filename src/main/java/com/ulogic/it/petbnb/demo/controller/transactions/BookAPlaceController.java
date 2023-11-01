package com.ulogic.it.petbnb.demo.controller.transactions;

import com.ulogic.it.petbnb.demo.model.transactions.BookAPlace;
import com.ulogic.it.petbnb.demo.service.transactions.BookAPlaceDataServices;
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
@RequestMapping("/book_place")
public class BookAPlaceController {

    @Autowired
    BookAPlaceDataServices bookAPlaceDataServices;

    @GetMapping("/get_all")
    public ResponseEntity<List<BookAPlace>> getBookAPlace() throws ExecutionException, InterruptedException {

        return new ResponseEntity<>(bookAPlaceDataServices.getBookAPlaceData().get(), HttpStatus.OK);
    }

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.OK)
    public void addPet(@RequestBody BookAPlace bookAPlace) {
        bookAPlaceDataServices.addBookAPlaceData(bookAPlace);
    }

    @PutMapping("/update/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void updateBookAPlace(@RequestBody BookAPlace bookAPlace, @RequestParam String id) {
        bookAPlaceDataServices.updateBookAPlaceById(bookAPlace, id);

    }

    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.OK)
    public void deleteBookAPlace(@RequestBody String id) {
        bookAPlaceDataServices.deleteBookAPlaceById(id);

    }
}
