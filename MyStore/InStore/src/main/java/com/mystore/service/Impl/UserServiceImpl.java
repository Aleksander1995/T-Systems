package com.mystore.service.Impl;

import com.mystore.domain.Order;
import com.mystore.domain.Product;
import com.mystore.domain.User;
import com.mystore.domain.UserAddress;
import com.mystore.repository.ClientRepository;
import com.mystore.repository.OrderRepository;
import com.mystore.repository.ProductRepository;
import com.mystore.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS, value = "prototype")
public class UserServiceImpl implements UserService {
    private static final Logger log=Logger.getLogger(UserServiceImpl.class);

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderRepository orderRepository;

    private Order order;

    private User user;

    public Order getOrder() {
        return order;
    }

    @Autowired @Qualifier("order")
    public void setOrder(Order order) {
        this.order = order;
    }

    /**
     *@see UserServiceImpl {@link #getUser(String)}
     */
    @Override
    @Transactional
    public User getUser(String email){
        return clientRepository.getUser(email);
    }

    /**
     *@see UserServiceImpl {@link #editUser(User)}
     */
    @Override
    @Transactional
    public void editUser(User user){
        this.user =clientRepository.getUser(user.getEmail());
        if(user.getName()!=null){this.user.setName(user.getName());}
        if(user.getSurname()!=null){this.user.setSurname(user.getSurname());}
        if(user.getDateBirth()!=null){this.user.setDateBirth(user.getDateBirth());}
        if(user.getPassword()!=null){
            String salt = BCrypt.gensalt(12);
            user.setPassword(BCrypt.hashpw(user.getPassword(), salt));
            this.user.setPassword(user.getPassword());
        }
        if(user.getUserAddress()!=null){
            if(user.getUserAddress().getCountry()!=null){this.user.getUserAddress().setCountry(user.getUserAddress().getCountry());}
            if(user.getUserAddress().getCity()!=null){this.user.getUserAddress().setCity(user.getUserAddress().getCity());}
            if(user.getUserAddress().getPostalCode()!=null){this.user.getUserAddress().setPostalCode(user.getUserAddress().getPostalCode());}
            if(user.getUserAddress().getStreet()!=null){this.user.getUserAddress().setStreet(user.getUserAddress().getStreet());}
            if(user.getUserAddress().getHome()!=null){this.user.getUserAddress().setHome(user.getUserAddress().getHome());}
            if(user.getUserAddress().getFlat()!=null){this.user.getUserAddress().setFlat(user.getUserAddress().getFlat());}
        }
        clientRepository.save(this.user);
        log.info("Пользователь: "+this.user.getEmail()+" "+this.user.getName()+" "+this.user.getSurname()+" "+this.user.getAuthority()+" изменил свои персональные данные");
    }

    /**
     *@see UserServiceImpl {@link #addUser(User)}
     */
    @Override
    @Transactional
    public void addUser(User user) {
        UserAddress userAddress =new UserAddress();
        user.setAuthority("ROLE_USER");
        user.setUserAddress(userAddress);
        userAddress.setUser(user);
        clientRepository.save(user);
    }


    /**
     *@see UserService {@link #makeAnOrder(String, long, int, String, String)}
     */
    @Override
    @Transactional
    public void makeAnOrder(String email, long id, int amount, String paymentMethod, String deliveryMethod) {
        Product product=productRepository.getProduct(id);
        product.setAmount(product.getAmount()-amount);
        product.setSellCounter(product.getSellCounter()+1);
        productRepository.save(product);
        User user=clientRepository.getUser(email);
        user.setPayCounter(user.getPayCounter()+1);
        clientRepository.save(user);
        order.setProduct(product);
        order.setUser(user);
        order.setPaymentMethod(paymentMethod);
        order.setDeliveryMethod(deliveryMethod);
        order.setAmount(amount);
        order.setPaymentStatus("Ожидает оплаты");
        order.setOrderStatus("Ожидает оплаты");
        orderRepository.save(order);
        log.info("Пользователь: "+user.getEmail()+" "+user.getName()+" "+user.getSurname()+" "+user.getAuthority()+" сделал заказ № "+ order.getId());
    }

    /**
     *@see UserService {@link #existUser(String)}
     */
    @Override
    @Transactional
    public boolean existUser(String email){
        return clientRepository.existsUser(email);
    }

}
