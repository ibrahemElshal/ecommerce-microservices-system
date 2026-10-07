package com.ecom.ecommerce.product;

import com.ecom.ecommerce.exception.ProductPurchaseException;
import jakarta.persistence.EntityNotFoundException;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository repository;
    private final ProductMapper mapper;
    public Integer  createProduct(ProductRequest request) {
        var product = mapper.toProduct(request);
        return repository.save(product).getId();

    }

    public List<ProductPurchaseResponse> purchaseProduct(@Valid List<ProductPurchaseRequest> request) {
        var productIds=request.stream()
                .map(ProductPurchaseRequest::productId)
                .collect(Collectors.toList());
        var storedProducts=repository.findAllByIdInOrderById(productIds);
        if(storedProducts.size()!=request.size()){
            throw new ProductPurchaseException("Cannot purchase products :: some products not found");
        }
        var storedRequests=request.stream()
                .sorted(Comparator.comparing(ProductPurchaseRequest::productId))
                .toList();
        var purchasedProducts=new ArrayList<ProductPurchaseResponse>();
        for(int i=0;i<storedProducts.size();i++){
            var product=storedProducts.get(i);
            var productRequest=storedRequests.get(i);
            if(product.getAvailableQuantity()<productRequest.quantity()){
                throw new ProductPurchaseException(
                        String.format("Cannot purchase product :: not enough quantity available for product id :: %s", product.getId())
                );
            }
            var newAvailableQuantity=product.getAvailableQuantity()-productRequest.quantity();
            product.setAvailableQuantity(newAvailableQuantity);
            repository.save(product);
            purchasedProducts.add(mapper.toProductPurchaseResponse(product, productRequest.quantity()));
        }
        return purchasedProducts;

    }

    public ProductResponse findById(Integer productId) {
        return repository.findById(productId)
                .map(mapper::toProductResponse)
                .orElseThrow(() -> new EntityNotFoundException(
                        String.format("Cannot find product :: no product found with the provided id :: %s", productId)
                ));
    }

    public List<ProductResponse> findAll() {
        return repository.findAll().stream()
                .map(mapper::toProductResponse)
                .collect(Collectors.toList());
    }
}
