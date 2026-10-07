package com.ecom.ecommerce.kafka.payment;
public record Customer(
         String id,
         String firstName,
         String lastName,
         String email
) {
}
