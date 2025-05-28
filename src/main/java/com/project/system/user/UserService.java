package com.project.system.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.project.system.exception.UserNotFoundException;

import java.util.List;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository repository;
    private final UserMapper mapper;

    public List<UserResponse> findAllUsers() {
        return repository.findAll().stream().map(mapper::toUserResponse).toList();
    }

    public UserResponse findUserById(Long id) {
        return repository.findById(id).map(mapper::toUserResponse).orElseThrow(()-> new UserNotFoundException("User not found with the Id: "+id));
    }

    public List<UserResponse> findUserByPhoneNumber(String phoneNumber) {
        return repository.findByPhoneNumberContaining(phoneNumber).stream().map(mapper::toUserResponse).toList();
    }

    public List<UserResponse> findUserByName(String name) {
        return repository.findByNameContainingIgnoreCase(name).stream().map(mapper::toUserResponse).toList();
    }

    public List<UserResponse> findUserByEmail(String email) {
        return repository.findByEmailContainingIgnoreCase(email).stream().map(mapper::toUserResponse).toList();
    }

    public UserResponse findByIdentityCard(String identityCard) {
        return repository.findByIdentityCard(identityCard).map(mapper::toUserResponse).orElseThrow(()-> new UserNotFoundException("User not found with the Identity Card: "+identityCard));
    }
    public User syncUser(String username, String email, String sub, String phoneNumber, String identityCard, String fullName, Set<String> roles) {
        return repository.findByUsername(username).orElseGet(() -> repository.save(User.builder().name(fullName).phoneNumber(phoneNumber).username(username).email(email).keycloakId(sub).identityCard(identityCard).roles(roles).build()));
    }
}
