package com.mystore.service;

import com.mystore.domain.User;

public interface UserService {

    /**
     * Receive user by email.
     *
     * @param email email.
     * @return user with certain email.
     */
    User getUser(String email);

    /**
     * Changing information about user.
     *
     * @param user information about user.
     */
    void editUser(User user);

    /**
     * Addition users with help their information.
     *
     * @param user information about user.
     */
    void addUser(User user);

    /**
     * Addition order.
     *
     * @param email email.
     * @param id product id.
     * @param amount amount.
     * @param paymentMethod payment method.
     * @param deliveryMethod delivery method.
     */
    void makeAnOrder(String email, long id, int amount, String paymentMethod, String deliveryMethod);

    /**
     * Check whether exist an email.
     *
     * @param email
     * @return if exist-true, not-false.
     */
    boolean existUser(String email);
}
