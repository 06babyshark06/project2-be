package com.project.system.vehicle;

import com.project.system.exception.VehicleNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class VehicleService {
    private final VehicleMapper mapper;
    private final VehicleRepository repository;
    public List<VehicleResponse> findAll() {
        return repository.findAll().stream().map(mapper::toVehicleResponse).toList();
    }

    public VehicleResponse findById(Long id) {
        return repository.findById(id).map(mapper::toVehicleResponse).orElseThrow(()->new VehicleNotFoundException("Vehicle not found with the Id: "+id));
    }

    public List<VehicleResponse> findVehiclesByLicensePlate(String licensePlate) {
        return repository.findVehicleByLicensePlateContainsIgnoreCase(licensePlate).stream().map(mapper::toVehicleResponse).toList();
    }

    public List<VehicleResponse> findVehiclesByUserId(Long userId) {
        return repository.findVehicleByUserId(userId).stream().map(mapper::toVehicleResponse).toList();
    }
}
