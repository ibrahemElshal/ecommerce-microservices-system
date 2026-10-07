package com.ecom.ecommerce.order;

import com.ecom.ecommerce.product.PurchaseRequest;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;

import java.math.BigDecimal;
import java.util.List;

public record  OrderRequest(
        Integer id,
        String reference,
        @Positive(message = "Order amount must be positive")
        BigDecimal totalAmount,
        @NotNull(message = "Payment method must be precised")
        PaymentMethod paymentMethod,
        @NotNull(message = "Customer ID must be precised")
        @NotEmpty(message = "Customer ID must not be empty")
        @NotBlank(message = "Customer ID must not be blank")
        String customerId,

        @NotEmpty(message = "you should at least purchase one product ")
        List<PurchaseRequest> products

) {
}
