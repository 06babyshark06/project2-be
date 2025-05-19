package com.project.system.user;

import com.project.system.vehicle.Vehicle;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@Entity
@Table(name = "app_user")
public class User {
    @Id
    @GeneratedValue
    private Long id;
    @NotNull(message = "Name is required")
    private String name;
    @NotNull(message = "Phone number is required")
    private String phoneNumber;
    @Email(message = "This email is not correctly")
    private String email;
    @OneToMany(mappedBy = "user")
    private List<Vehicle> vehicles;
}
