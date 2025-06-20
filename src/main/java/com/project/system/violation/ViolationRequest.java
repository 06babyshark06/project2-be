package com.project.system.violation;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

public record ViolationRequest(
        @NotBlank(message = "License plate is required")
        String licensePlate,
        @NotNull(message = "Violation type is required")
        ViolationType violationType,
        @NotNull(message = "Timestamp is required")
        @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        LocalDateTime timestamp,
        String location
) {
}
