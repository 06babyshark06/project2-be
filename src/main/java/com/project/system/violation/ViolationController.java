package com.project.system.violation;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/violations")
public class ViolationController {
    private final ViolationService service;

    @GetMapping
    public ResponseEntity<List<Violation>> findAll() {
        return ResponseEntity.ok(service.findAll());
    }

    @GetMapping("/{violation-id}")
    public ResponseEntity<Violation> findById(@PathVariable("violation-id") Long id) {
        return ResponseEntity.ok(service.findById(id));
    }

    @GetMapping("/plate/{license-plate}")
    public ResponseEntity<List<Violation>> findAllByLicensePlate(@PathVariable("license-plate") String licensePlate) {
        return ResponseEntity.ok(service.findAllByLicensePlate(licensePlate));
    }

    @GetMapping("/type/{violation-type}")
    public ResponseEntity<List<Violation>> findAllByViolationType(@PathVariable("violation-type") ViolationType type) {
        return ResponseEntity.ok(service.findAllByViolationType(type));
    }

    @PostMapping
    public ResponseEntity<Violation> addViolation(@Valid @RequestBody ViolationRequest request) {
        return ResponseEntity.ok(service.addViolation(request));
    }
}
