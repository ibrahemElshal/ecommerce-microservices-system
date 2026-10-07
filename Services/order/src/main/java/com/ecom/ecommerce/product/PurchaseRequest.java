package com.ecom.ecommerce.product;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Positive;

public record PurchaseRequest (
        @NotEmpty(message = "product is mandatory")
        Integer productId,
        @Positive(message = "quantity must be positive")
        Integer quantity

){
}
