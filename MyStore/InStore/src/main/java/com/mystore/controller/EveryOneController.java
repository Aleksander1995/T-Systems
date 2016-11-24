package com.mystore.controller;

import com.mystore.domain.User;
import com.mystore.service.EveryOneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashSet;
import java.util.Set;

@Controller
@SessionAttributes(value = "productId")
public class EveryOneController {

    @Autowired
    EveryOneService everyOneService;

    @RequestMapping(value = "/")
    public String welcome(){
        return "start";
    }

    @RequestMapping(value = "/getCategory")
    public ModelAndView getCategory(){
        ModelAndView mv = new ModelAndView();
        mv.addObject("ourproducts", everyOneService.getCategory());
        mv.setViewName("productCategory");
        return mv;
    }

    @RequestMapping(value = "/getProductByCategory")
    public String getCategory(@RequestParam(value = "parameter",required=false) String parameter,Model model){

       if(parameter!=null){
            model.addAttribute("products", everyOneService.getProductByCategory(parameter));
            return "productByCategory";
       }else {
            model.addAttribute("ourproducts", everyOneService.getCategory());
            return "productCategory";
       }

    }

    @RequestMapping(value = "/putBasket")
    public ModelAndView putBusket(@ModelAttribute("productId") Set<String> productId,@RequestParam String id){
        ModelAndView mv=new ModelAndView();
        productId.add(id);
        mv.addObject("productId",productId);
        mv.setViewName("basket");
        return mv;
    }

    @RequestMapping(value = "/getBasket")
    public String getBusket(@ModelAttribute("productId") Set<String> productId, Model model){
        model.addAttribute("products",everyOneService.getProductsBySession(productId));
        return "basket";
    }

    @ModelAttribute("productId") Set<String> createSession(){
       return new HashSet<String>();
    }

    @ModelAttribute(value = "checkIn")
    User clientCheckIn(){
        return new User();
    }

    @ModelAttribute(value = "logIn")
    User clientLoginIn(){
        return new User();
    }

    @RequestMapping(value = "/deletefrombasket")
    public String actionInBasket(@RequestParam("productId")String removeId,
                                 @ModelAttribute("productId") Set<String> productId,
                                 Model model){
        everyOneService.removeFromBasket(removeId,productId);
        model.addAttribute("products",everyOneService.getProductsBySession(productId));
        return "basket";
    }

    @RequestMapping(value = "/auth")
    public ModelAndView loginin(@RequestParam(value = "error",required = false)String error){

        ModelAndView mv=new ModelAndView();
        mv.setViewName("auth");
        if(error!=null){
            mv.addObject("error","Проверьте свои данные и повторите попытку");
        }
        return mv;
    }

    @RequestMapping(value = "/access-denied")
    public String accessDenied(){
        return "access-denied";
    }

}
