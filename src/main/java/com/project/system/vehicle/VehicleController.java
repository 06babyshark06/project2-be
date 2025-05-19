package com.project.system.vehicle;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/v1/vehicles")
@RequiredArgsConstructor
public class VehicleController {
    private final VehicleService service;

    @GetMapping
    public ResponseEntity<List<VehicleResponse>> findAll() {
        return ResponseEntity.ok(service.findAll());
    }

    @GetMapping("/{vehicle-id}")
    public ResponseEntity<VehicleResponse> findById(@PathVariable("vehicle-id") Long id) {
        return ResponseEntity.ok(service.findById(id));
    }

    @GetMapping("/plate/{license-plate}")
    public ResponseEntity<List<VehicleResponse>> findByLicensePlate(@PathVariable("license-plate") String licensePlate) {
        return ResponseEntity.ok(service.findVehiclesByLicensePlate(licensePlate));
    }

    @GetMapping("/user/{user-id}")
    public ResponseEntity<List<VehicleResponse>> findByUserId(@PathVariable("user-id") Long userId) {
        return ResponseEntity.ok(service.findVehiclesByUserId(userId));
    }
}
