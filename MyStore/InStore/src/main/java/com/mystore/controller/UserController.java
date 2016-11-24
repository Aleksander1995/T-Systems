package com.mystore.controller;

import com.mystore.domain.Product;
import com.mystore.domain.User;
import com.mystore.service.EveryOneService;
import com.mystore.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;

@Controller
public class UserController {

    private static final Logger log=Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private EveryOneService everyOneService;

    @RequestMapping(value = "/user")
    public String dispatcher(Principal email, Model model, HttpServletRequest request){
        User user = userService.getUser(email.getName());
        model.addAttribute("user", user);
        if(request.isUserInRole("ROLE_ADMIN")){
            model.addAttribute("findUser",new User());
            model.addAttribute("product", new Product());
            log.info("Администратор: "+user.getEmail()+" "+user.getName()+" "+user.getSurname()+" "+user.getAuthority()+" зашёл в свой профиль.");
            return "admin";
        }
        else {
            model.addAttribute("edit",new User());
            log.info("Пользователь: "+user.getEmail()+" "+user.getName()+" "+user.getSurname()+" "+user.getAuthority()+" зашёл в свой профиль.");
            return "userpage";
        }
    }

    @RequestMapping(value = "/loginin")
    public String loginIn(Model model, @Valid @ModelAttribute("logIn") User user, BindingResult result){
        if(result.hasErrors()) {
            model.addAttribute("errorINFO",result.getAllErrors());
            model.addAttribute("checkIn", new User());
            model.addAttribute("logIn", new User());
            return "auth";
        }else {
            return "forward:/j_spring_security_check";
        }
    }

    @RequestMapping(value = "/edit-user")
    public String editUser(Model model, @Valid @ModelAttribute("edit") User user, BindingResult result){
        if(result.hasErrors()) {
           model.addAttribute("error","Проверьте свои данные и повторите попытку.");
        }else {
            userService.editUser(user);
        }
        return "forward:/user";
    }

    @RequestMapping(value = "/checkin")
    public String checkIn(Model model, @Valid @ModelAttribute("checkIn") User user, BindingResult result){
        System.out.println(userService.existUser(user.getEmail()));
        if(result.hasErrors() || userService.existUser(user.getEmail())) {
            if(!result.hasErrors()){
                model.addAttribute("error","Этот пользователь уже существует");
            }else{
                model.addAttribute("errorINFO",result.getAllErrors());
            }
            model.addAttribute("logIn", new User());
            model.addAttribute("checkIn", new User());
            return "auth";
        }else {
            String salt = BCrypt.gensalt(12);
            user.setPassword(BCrypt.hashpw(user.getPassword(), salt));
            userService.addUser(user);
            log.info("Зарегистрировался новый пользователь: "+user.getEmail()+" "+user.getName()+" "+user.getSurname());
            return "forward:/j_spring_security_check";
        }
    }

    @RequestMapping(value = "/order")
    public String order(@RequestParam("productId")String productId,Model model){
        model.addAttribute("product", everyOneService.getProduct(Long.parseLong(productId)));
        return "order";
    }

    @RequestMapping(value = "/makeAnOrder")
    public String makeAnOrder(Principal email,@RequestParam("productId")String productId,
                              @RequestParam("amount")String amount,
                              @RequestParam("payment_method")String paymentMethod,
                              @RequestParam("delivery_method")String deliveryMethod){
        userService.makeAnOrder(email.getName(),Long.parseLong(productId),Integer.parseInt(amount),paymentMethod,deliveryMethod);
        return "forward:/deletefrombasket";
    }

}
