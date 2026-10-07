package com.ecom.ecommerce.product;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

public record ProductPurchaseRequest(
        @NotNull(message = "productId is required")
        Integer productId,
        @NotNull(message = "quantity is required")
        @Positive(message = "quantity must be positive")
        double quantity
) {

}
