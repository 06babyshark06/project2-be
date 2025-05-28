package com.project.system.auth;

public record LoginRequest(
        String username,
        String password
) {
}
