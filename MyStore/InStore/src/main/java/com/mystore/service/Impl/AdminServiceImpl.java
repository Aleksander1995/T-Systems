package com.mystore.service.Impl;

import com.mystore.domain.Order;
import com.mystore.domain.Product;
import com.mystore.repository.OrderRepository;
import com.mystore.repository.ProductRepository;
import com.mystore.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    /**
     *@see AdminService {@link #changeOrder(String, String, String)}
     */
    @Transactional
    @Override
    public void changeOrder(String orderId, String paymentStatus, String orderStatus){
        Order order=orderRepository.getOrder(Long.parseLong(orderId));
        if(paymentStatus!=null){
            order.setPaymentStatus(paymentStatus);
        }
        if(orderStatus!=null){
            order.setOrderStatus(orderStatus);
        }
        orderRepository.save(order);
    }

    /**
     *@see AdminService {@link #addProduct(Product)}
     */
    @Transactional
    @Override
    public void addProduct(Product product){
        product.getOption().setProduct(product);
        productRepository.save(product);
    }
}
