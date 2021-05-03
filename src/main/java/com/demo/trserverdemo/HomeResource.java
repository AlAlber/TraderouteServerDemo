package com.demo.trserverdemo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeResource {

    //Landing page accessible by anybody
    @GetMapping("/")
    public String home(){
        return ("<h1>Welcome</h1>");
    }

    // User endpoint accessible for users and admins
    @GetMapping("/user")
    public String user(){
        return ("<h1>Welcome User</h1>");
    }
    // Admin endpoint only accessible for admins
    @GetMapping("/admin")
    public String admin(){
        return ("<h1>Welcome Admin</h1>");
    }
}
