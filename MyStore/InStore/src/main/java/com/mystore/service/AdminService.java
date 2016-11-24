package com.mystore.service;

import com.mystore.domain.Product;

public interface AdminService {
    /**
     * Changing order(order status or payment status).
     *
     * @param orderId order id.
     * @param paymentStatus payment status.
     * @param orderStatus order status.
     */
    void changeOrder(String orderId, String paymentStatus, String orderStatus);

    /**
     * Addition product.
     *
     * @param product information about product.
     */
    void addProduct(Product product);
}
