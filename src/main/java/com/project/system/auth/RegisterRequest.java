package com.project.system.auth;

public record RegisterRequest(
        String username,
        String fullName,
        String phoneNumber,
        String email,
        String identityCard,
        String password
) {
}
