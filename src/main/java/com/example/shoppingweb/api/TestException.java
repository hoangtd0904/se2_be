package com.example.shoppingweb.api;

import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "*")
public class TestException extends RuntimeException{
    public TestException(String message) {
        super(message);
    }
}
