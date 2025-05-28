package com.project.system.user;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User,Long> {
    List<User> findByPhoneNumberContaining(String phoneNumber);
    List<User> findByNameContainingIgnoreCase(String name);
    List<User> findByEmailContainingIgnoreCase(String email);
    Optional<User> findByKeycloakId(String keycloakId);
    Optional<User> findByIdentityCard(String identityCard);
    Optional<User> findByUsername(String username);
}
