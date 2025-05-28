package com.project.system.user;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("api/v1/users")
@RequiredArgsConstructor
public class UserController {
    private final JwtDecoder jwtDecoder;
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
    @GetMapping("/token/{access-token}")
    public ResponseEntity<String> insert(@PathVariable("access-token") String token) {
        Jwt jwt = jwtDecoder.decode(token);
        String username = jwt.getClaimAsString("preferred_username");
        String email = jwt.getClaimAsString("email");
        String sub = jwt.getClaimAsString("sub");
        String phoneNumber= jwt.getClaimAsString("phoneNumber");
        String identityCard= jwt.getClaimAsString("identityCard");
        String fullName = jwt.getClaimAsString("fullName");
        Set<String> roles = Optional.ofNullable(jwt.getClaim("realm_access"))
                .filter(Map.class::isInstance)
                .map(Map.class::cast)
                .map(realm -> (List<?>) realm.get("roles"))
                .map(list -> list.stream()
                        .map(Object::toString)
                        .collect(Collectors.toSet()))
                .orElse(Collections.emptySet());

        service.syncUser(username, email, sub, phoneNumber, identityCard, fullName, roles);
        return ResponseEntity.ok("OK");
    }
}
