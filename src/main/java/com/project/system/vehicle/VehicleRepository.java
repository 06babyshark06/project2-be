package com.project.system.vehicle;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VehicleRepository extends JpaRepository<Vehicle,Long> {
    List<Vehicle> findVehicleByLicensePlateContainsIgnoreCase(String licensePlate);
    List<Vehicle> findVehicleByUserId(Long userId);
}
