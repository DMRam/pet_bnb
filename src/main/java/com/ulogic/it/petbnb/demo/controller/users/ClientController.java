package com.ulogic.it.petbnb.demo.controller.users;

import com.ulogic.it.petbnb.demo.model.users.Client;
import com.ulogic.it.petbnb.demo.service.users.ClientDataServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * <p>
 * This controller Class is taking care of CRUD request for Clients
 * </p>
 *
 * @author dannymunoz on 2023-10-23
 * @project demo
 */
@RestController
@RequestMapping("/client")
public class ClientController {

    @Autowired
    ClientDataServices clientDataServices;

    /**
     * <p>
     * Getting Clients
     * </p>
     *
     * @return
     * @throws ExecutionException
     * @throws InterruptedException
     */
    @GetMapping("all")
    public ResponseEntity<List<Client>> getClients() throws ExecutionException, InterruptedException {
        return new ResponseEntity<>(clientDataServices.getClientsData().get(), HttpStatus.OK);
    }

    /**
     * <p>
     * Create Client
     * </p>
     *
     * @param client
     */
    @PostMapping("/add")
    @ResponseStatus(HttpStatus.CREATED)
    public void addClient(@RequestBody Client client) {
        clientDataServices.addClientData(client);
    }

    /**
     * <p>
     * Delete Client
     * </p>
     *
     * @param id
     */
    @DeleteMapping("/delete/")
    @ResponseStatus(HttpStatus.OK)
    public void deleteClient(@RequestParam String id) {
        clientDataServices.deleteClientById(id);
    }

    /**
     * <p>
     * Update Client
     * </p>
     *
     * @param client
     */
    @PutMapping("/update")
    @ResponseStatus(HttpStatus.OK)
    public void updateClient(@RequestBody Client client) {
        clientDataServices.updateClientById(client);
    }


}
