package com.ulogic.it.petbnb.demo.controller.transactions;

import com.ulogic.it.petbnb.demo.model.transactions.BookAService;
import com.ulogic.it.petbnb.demo.service.transactions.BookAServiceDataServices;
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
@RequestMapping("/book_service")
public class BookAServiceController {

    @Autowired
    BookAServiceDataServices bookAServiceDataServices;

    @GetMapping("/get_all")
    public ResponseEntity<List<BookAService>> getBookAService() throws ExecutionException, InterruptedException {

        return new ResponseEntity<>(bookAServiceDataServices.getBookAServiceData().get(), HttpStatus.OK);
    }

    @PostMapping("/add")
    @ResponseStatus(HttpStatus.OK)
    public void addBookAService(@RequestBody BookAService bookAService) {
        bookAServiceDataServices.addBookAServiceData(bookAService);
    }

    @PutMapping("/update/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void updateBookAService(@RequestBody BookAService bookAService, @RequestParam String id) {
        bookAServiceDataServices.updateBookAServiceById(bookAService, id);

    }

    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.OK)
    public void deleteBookAService(@RequestBody String id) {
        bookAServiceDataServices.deleteBookAServiceById(id);

    }
}
