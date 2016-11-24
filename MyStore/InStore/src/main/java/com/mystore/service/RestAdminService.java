package com.mystore.service;

import com.mystore.domain.User;
import com.mystore.dto.Report;

import java.util.List;

/**
 * Created by alex1_000 on 19.11.2016.
 */
public interface RestAdminService {

    /**
     * Checking whether exist certain admin
     *
     * @param email email.
     * @param password password.
     * @return if exist-true, not-false
     */
    boolean restLogIn(String email, String password);

    /**
     * Receive report by admin.
     *
     * @return dto object.
     */
    Report getReport();
}
