package com.project.system.violation;

import com.project.system.exception.ViolationNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ViolationService {
    private final ViolationRepository repository;

    public List<Violation> findAll() {
        return repository.findAll();
    }

    public Violation findById(Long id) {
        return repository.findById(id).orElseThrow(()->new ViolationNotFoundException("Violation not found with the Id: "+id));
    }

    public List<Violation> findAllByLicensePlate(String licensePlate) {
        return repository.findAllByLicensePlateContaining(licensePlate);
    }

    public List<Violation> findAllByViolationType(ViolationType type) {
        return repository.findAllByViolationType(type);
    }

    public Violation addViolation(ViolationRequest request) {
        return repository.save(Violation.builder().licensePlate(request.licensePlate()).violationType(request.violationType()).timestamp(request.timestamp()).isPurchased(false).isApproved(false).build());
    }
}
