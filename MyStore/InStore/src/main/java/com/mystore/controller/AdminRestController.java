package com.mystore.controller;

import com.mystore.domain.User;
import com.mystore.dto.Report;
import com.mystore.service.RestAdminService;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import java.io.IOException;

@RestController
public class AdminRestController {

    @Autowired
    private RestAdminService restAdminService;

    @RequestMapping(value = "/report-admin/getUser/", method = RequestMethod.POST)
    public ResponseEntity<String> getAdmin(@RequestBody String userDetails) throws IOException {
        ObjectMapper mapper=new ObjectMapper();
        User userObject=mapper.readValue(userDetails,User.class);
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        Boolean access=restAdminService.restLogIn(userObject.getEmail(),userObject.getPassword());
        if (access == null) {
            return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(mapper.writeValueAsString(access),responseHeaders, HttpStatus.OK);
    }


    @RequestMapping(value = "/report-admin/getReport/", method = RequestMethod.GET)
    public ResponseEntity<String> getReport() throws IOException {
        ObjectMapper mapper=new ObjectMapper();
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        Report report=restAdminService.getReport();
        if (report == null) {
            return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
        }
        String reportJson=mapper.writeValueAsString(report);
        return new ResponseEntity<String>(reportJson,responseHeaders, HttpStatus.OK);
    }
}
