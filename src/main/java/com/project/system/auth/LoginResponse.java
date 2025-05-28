package com.project.system.auth;

public record LoginResponse(
        String accessToken,
        String refreshToken,
        Long expiresIn
) {
}
