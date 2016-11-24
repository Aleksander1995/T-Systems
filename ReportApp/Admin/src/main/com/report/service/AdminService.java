package main.com.report.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import main.com.report.controller.AdminController;
import main.com.report.dto.Product;
import main.com.report.dto.Report;
import main.com.report.dto.User;
import javax.faces.bean.RequestScoped;
import javax.servlet.http.HttpServlet;
import javax.ws.rs.core.MediaType;
import java.io.*;


@RequestScoped
public class AdminService extends HttpServlet {
    private static Boolean access=null;
    private static String userJson=null;

    public AdminService(){

    }

    public static boolean login(AdminController admin){
        Client client = Client.create();
        WebResource webResource = client.resource("http://localhost:8080/report-admin/getUser/");
        ObjectMapper mapper = new ObjectMapper();
        try {
            userJson=mapper.writeValueAsString(admin);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        ClientResponse response = webResource
                .accept(MediaType.APPLICATION_JSON)
                .type(MediaType.APPLICATION_JSON)
                .post(ClientResponse.class, userJson);
        if (response.getStatus() != 200) {
            throw new RuntimeException("Failed : HTTP error code : "
                    + response.getStatus());
        }
        String Json=response.getEntity(String.class);
        try {
            access=mapper.readValue(Json,Boolean.class);
            return access;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
    public Report getReport(){
        Client client = Client.create();
        WebResource webResource = client.resource("http://localhost:8080/report-admin/getReport/");
        ObjectMapper mapper = new ObjectMapper();
        ClientResponse response = webResource
                .accept(MediaType.APPLICATION_JSON)
                .type(MediaType.APPLICATION_JSON)
                .get(ClientResponse.class);
        if (response.getStatus() != 200) {
            throw new RuntimeException("Failed : HTTP error code : "
                    + response.getStatus());
        }
        String Json=response.getEntity(String.class);
        Report report=null;
        try {
            report=mapper.readValue(Json,Report.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(report.getUser().get(0).getName());
        createReport(report );
        return report;
    }

    private void createReport(Report report){
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);
        File file=new File("D:\\Trash\\tsystems\\ReportApp\\Admin\\src\\main\\webapp\\pdf\\Report.pdf");
        FileOutputStream fileOutputStream=null;
        try {
            fileOutputStream=new FileOutputStream(file);
            PdfWriter.getInstance(document, fileOutputStream);
            document.open();
            BaseFont bf = BaseFont.createFont("D:\\Trash\\tsystems\\ReportApp\\Admin\\src\\main\\webapp\\font\\arial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font font = new Font(bf);
            Font fontheader = new Font(bf);
            fontheader.setColor(new CMYKColor(0, 255, 0, 0));
            fontheader.setSize(14);
            document.add(new Paragraph("Статистика InStore", fontheader));

            document.add(new Paragraph("Топ товаров:",font));
            PdfPTable t1 = new PdfPTable(5);
            t1.setSpacingBefore(25);
            t1.setSpacingAfter(25);
            PdfPCell c1 = new PdfPCell(new Phrase("№",font));
            t1.addCell(c1);
            PdfPCell c2 = new PdfPCell(new Phrase("Наименование",font));
            t1.addCell(c2);
            PdfPCell c3 = new PdfPCell(new Phrase("Цена",font));
            t1.addCell(c3);
            PdfPCell c4 = new PdfPCell(new Phrase("Категория",font));
            t1.addCell(c4);
            PdfPCell c5 = new PdfPCell(new Phrase("Продано",font));
            t1.addCell(c5);
            int counterProduct=0;
            for (Product product : report.getProduct()) {
                t1.addCell(new Paragraph(String.valueOf(++counterProduct),font));
                t1.addCell(new Paragraph(product.getProductName(),font));
                t1.addCell(new Paragraph(product.getPrice().toString()+"0 р.",font));
                t1.addCell(new Paragraph(product.getCategory(),font));
                t1.addCell(new Paragraph(String.valueOf(product.getSellCounter()),font));
            }
            document.add(t1);

            document.add(new Paragraph("Топ клиентов:",font));
            PdfPTable t2 = new PdfPTable(5);
            t2.setSpacingBefore(25);
            t2.setSpacingAfter(25);
            PdfPCell w1 = new PdfPCell(new Phrase("№",font));
            t2.addCell(w1);
            PdfPCell w2 = new PdfPCell(new Phrase("Имя",font));
            t2.addCell(w2);
            PdfPCell w3 = new PdfPCell(new Phrase("Фамилия",font));
            t2.addCell(w3);
            PdfPCell w4 = new PdfPCell(new Phrase("Эл. адрес",font));
            t2.addCell(w4);
            PdfPCell w5 = new PdfPCell(new Phrase("Куплено",font));
            t2.addCell(w5);
            int counterUser=0;
            for (User user : report.getUser()) {
                t2.addCell(new Paragraph(String.valueOf(++counterUser),font));
                t2.addCell(new Paragraph(user.getName(),font));
                t2.addCell(new Paragraph(user.getSurname(),font));
                t2.addCell(new Paragraph(user.getEmail(),font));
                t2.addCell(new Paragraph(String.valueOf(user.getPayCounter()),font));
            }
            document.add(t2);
            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
