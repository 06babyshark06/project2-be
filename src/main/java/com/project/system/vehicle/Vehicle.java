package com.project.system.vehicle;

import com.project.system.user.User;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@Entity
public class Vehicle {
    @Id
    @GeneratedValue
    private Long id;
    @NotNull(message = "License plate is required")
    private String licensePlate;
    private String vehicleType;
    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;
}
