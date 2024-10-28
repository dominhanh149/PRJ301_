/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.manage;

import dal.DepartmentDBContext;
import dal.ProductDBContext;
import dal.ProductPlanDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import model.Department;
import model.Product;
import model.ProductPlan;
import model.ProductPlanHeader;

/**
 *
 * @author admin
 */
public class ProductionPlanCreateController extends HttpServlet {
   
   
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DepartmentDBContext dbDept = new DepartmentDBContext();
        ProductDBContext dbProduct = new ProductDBContext();
        
        request.setAttribute("depts", dbDept.get("Production"));
        request.setAttribute("products", dbProduct.list());
        
        request.getRequestDispatcher("../view/productionPlan/create.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ProductPlan plan = new ProductPlan();
        plan.setName(request.getParameter("name"));
        plan.setStart(Date.valueOf(request.getParameter("from")));
        plan.setEnd(Date.valueOf(request.getParameter("to")));
        
        Department d = new Department();
        d.setId(Integer.parseInt(request.getParameter("did")));
        
        plan.setDept(d);
        
        String[] pids = request.getParameterValues("pid");
        for (String pid : pids) {
            Product p = new Product();
            p.setId(Integer.parseInt(pid));
            
            ProductPlanHeader header = new ProductPlanHeader();
            header.setProduct(p);
            String raw_quantity = request.getParameter("quantity"+pid);
            String raw_effort = request.getParameter("effort"+pid);
            header.setQuantity(raw_quantity!=null && raw_quantity.length()>0?Integer.parseInt(raw_quantity):0);
            header.setEstimatedeffort(raw_effort!=null && raw_effort.length()>0?Float.parseFloat(raw_effort):0);
            
            if(header.getQuantity()>0&& header.getEstimatedeffort()>0)
                plan.getHeaders().add(header);
        }
        
        if(plan.getHeaders().size() >0)
        {
            ProductPlanDBContext db = new ProductPlanDBContext();
            db.insert(plan);
            response.sendRedirect("list");
        }
        else
        {
            response.getWriter().println("your plan does not have any headers! it is not allowed!");
        }
        
    }

   

}