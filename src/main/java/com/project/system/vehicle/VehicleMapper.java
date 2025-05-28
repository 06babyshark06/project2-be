package com.project.system.vehicle;

import org.springframework.stereotype.Service;

@Service
public class VehicleMapper {
    public VehicleResponse toVehicleResponse(Vehicle vehicle) {
        return new VehicleResponse(vehicle.getId(), vehicle.getLicensePlate(), vehicle.getVehicleType(), vehicle.getUser().getId());
    }
}
