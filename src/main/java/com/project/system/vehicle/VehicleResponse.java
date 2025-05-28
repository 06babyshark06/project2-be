package com.project.system.vehicle;

public record VehicleResponse(
        Long id,
        String licensePlate,
        String vehicleType,
        Long userId
) {
}
