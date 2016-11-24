package com.mystore.controller;

import com.mystore.domain.Product;
import com.mystore.domain.User;
import com.mystore.service.AdminService;
import com.mystore.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.validation.Valid;
import java.security.Principal;

@Controller
public class AdminController {

    private static final Logger log=Logger.getLogger(AdminController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/admin")
    public String adminPage(Principal email, Model model){
        model.addAttribute("user", userService.getUser(email.getName()));
        model.addAttribute("findUser",new User());
        model.addAttribute("product", new Product());
        return "admin";
    }

    @RequestMapping(value = "/finduser")
    public String findUser(Model model, @Valid @ModelAttribute("findUser") User user, BindingResult result){
        if(result.hasErrors() || !userService.existUser(user.getEmail())){
            if(!result.hasErrors()){
                model.addAttribute("errorUser","Такого пользователя не существует");
            }else{
                model.addAttribute("errorUser",result.getAllErrors().get(0).getDefaultMessage());
            }
            return "forward:/admin";
        }else{
            model.addAttribute("user", userService.getUser(user.getEmail()));
            return "userpage";
        }
    }

    @RequestMapping(value = "/changeOrder")
    public String changeOrder(Model model,@RequestParam("orderId")String orderId,
                              @RequestParam("userEmail")String email,
                              @RequestParam(value = "payment_status",required = false)String paymentStatus,
                              @RequestParam(value = "order_status",required = false)String orderStatus){
        adminService.changeOrder(orderId,paymentStatus,orderStatus);
        model.addAttribute("user", userService.getUser(email));
        return "userpage";
    }

    @RequestMapping(value = "/addproduct")
    public String addProduct(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model){
        if(result.hasErrors()){
            model.addAttribute("errorProduct",result.getAllErrors());
            return "forward:/admin";
        }else{
            adminService.addProduct(product);
            model.addAttribute("success","Товар успешно добавлен!");
            log.info("Был добавлен новый товар: "+product.getId()+" "+product.getProductName());
            return "forward:/admin";
        }
    }

}
