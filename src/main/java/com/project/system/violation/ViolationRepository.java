package com.project.system.violation;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ViolationRepository extends JpaRepository<Violation,Long> {
    List<Violation> findAllByLicensePlateContaining(String licensePlate);
    List<Violation> findAllByViolationType(ViolationType type);
}
