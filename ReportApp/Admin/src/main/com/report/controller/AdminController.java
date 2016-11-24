package main.com.report.controller;

import main.com.report.service.AdminService;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.inject.Inject;
import java.io.*;

@ManagedBean(name = "user")
@RequestScoped
public class AdminController implements Serializable {

    private String email;

    private String password;

    @Inject
    private AdminService adminService;

    public AdminController(){}


    public void setEmail(String email) {
        this.email = email;
    }
    public String getEmail() {
        return email;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String login() {
        if (adminService.login(this)) {
            adminService.getReport();
                return "admin";
            } else {
                return "error";
            }

    }

}
