package com.mystore.service.Impl;

import com.mystore.domain.User;
import com.mystore.dto.Report;
import com.mystore.repository.ClientRepository;
import com.mystore.repository.ProductRepository;
import com.mystore.service.RestAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class RestAdminServiceImpl implements RestAdminService {

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private ProductRepository productRepository;

    /**
     *@see RestAdminService {@link #restLogIn(String, String)}
     */
    @Override
    public boolean restLogIn(String email, String password){
        User user=clientRepository.getUser(email);
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        if(email.equalsIgnoreCase(user.getEmail()) && encoder.matches(password, user.getPassword())&& user.getAuthority().equals("ROLE_ADMIN")) {
           return true;
        }else{
            return false;
        }
    }

    /**
     *@see RestAdminService {@link #getReport()}
     */
    @Override
    public Report getReport(){
        Report report =new Report();
        report.setProduct(productRepository.getTopProduct());
        report.setUser(clientRepository.getTopUsers());
        return report;
    }
}
