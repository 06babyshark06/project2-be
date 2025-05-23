package com.project.system.user;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/v1/users")
@RequiredArgsConstructor
public class UserController {
    private final UserService service;

    @PreAuthorize("hasRole('admin')")
    @GetMapping
    public ResponseEntity<List<UserResponse>> getAllUsers() {
        return ResponseEntity.ok(service.findAllUsers());
    }

    @GetMapping("/{user-id}")
    public ResponseEntity<UserResponse> findUserById(@PathVariable("user-id") Long id) {
        return ResponseEntity.ok(service.findUserById(id));
    }

    @GetMapping("identity/{identity-card}")
    public ResponseEntity<UserResponse> findUserByIdentityCard(@PathVariable("identity-card") String identityCard) {
        return ResponseEntity.ok(service.findByIdentityCard(identityCard));
    }

    @GetMapping("/phone/{phone-number}")
    public ResponseEntity<List<UserResponse>> findUserByPhoneNumber(@PathVariable("phone-number") String phoneNumber) {
        return ResponseEntity.ok(service.findUserByPhoneNumber(phoneNumber));
    }

    @GetMapping("/name/{name}")
    public ResponseEntity<List<UserResponse>> findUserByName(@PathVariable("name") String name) {
        return ResponseEntity.ok(service.findUserByName(name));
    }

    @GetMapping("/email/{email}")
    public ResponseEntity<List<UserResponse>> findUserByEmail(@PathVariable("email") String email) {
        return ResponseEntity.ok(service.findUserByEmail(email));
    }
}
