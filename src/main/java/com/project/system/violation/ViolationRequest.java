package com.project.system.violation;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

public record ViolationRequest(
        @NotBlank(message = "License plate is required")
        String licensePlate,
        @NotNull(message = "Violation type is required")
        ViolationType violationType,
        @NotBlank(message = "Timestamp is required")
        LocalDateTime timestamp
) {
}
