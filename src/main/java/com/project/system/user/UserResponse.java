package com.project.system.user;


public record UserResponse(
        Long id,
        String name,
        String phoneNumber,
        String email
        ) {
}
