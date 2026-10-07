package com.ecom.ecommerce.product;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

import java.math.BigDecimal;

public record ProductRequest(
        Integer id,
        @NotNull(message = "product Name is required")
        String name,

        @NotNull(message = "product Description is required")
        String description,

        @Positive(message = "price must be positive")
        BigDecimal price,

        @Positive(message = "available quantity must be positive")
        double availableQuantity,

        @NotNull(message = "category is required")
        Integer categoryId
        ) {



}
