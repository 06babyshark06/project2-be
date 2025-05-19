package com.project.system.exception;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class VehicleNotFoundException extends RuntimeException {
    private final String msg;
}
