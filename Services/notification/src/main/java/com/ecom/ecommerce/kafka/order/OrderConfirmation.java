package com.ecom.ecommerce.kafka.order;

import com.ecom.ecommerce.kafka.payment.Customer;
import com.ecom.ecommerce.kafka.payment.PaymentMethod;
import com.ecom.ecommerce.kafka.payment.Product;

import java.math.BigDecimal;
import java.util.List;

public record OrderConfirmation(
        String orderReference,
        BigDecimal amount,
        PaymentMethod paymentMethod,
        Customer customer,
        List<Product> products
) {
}
