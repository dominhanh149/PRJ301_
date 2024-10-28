/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manage;

import controller.auth.BaseRBACController;
import dal.DepartmentDBContext;
import dal.ProductDBContext;
import dal.ProductPlanDBContext;
import dal.ProductPlanHeaderDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.Department;
import model.Product;
import model.ProductPlan;
import model.ProductPlanHeader;
import model.User;

/**
 *
 * @author admin
 */
public class ProductionPlanUpdate extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {

        DepartmentDBContext dbDept = new DepartmentDBContext();
        ProductDBContext dbProduct = new ProductDBContext();
        
        req.setAttribute("depts", dbDept.get("Production"));
        req.setAttribute("products", dbProduct.list());

        req.getRequestDispatcher("../view/productionPlan/update.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        ProductPlan plan = new ProductPlan();
        plan.setName(req.getParameter("name"));
        plan.setStart(Date.valueOf(req.getParameter("from")));
        plan.setEnd(Date.valueOf(req.getParameter("to")));

        Department d = new Department();
        d.setId(Integer.parseInt(req.getParameter("did")));

        plan.setDept(d);

        String[] pids = req.getParameterValues("pid");
        for (String pid : pids) {
            Product p = new Product();
            p.setId(Integer.parseInt(pid));

            ProductPlanHeader header = new ProductPlanHeader();
            header.setProduct(p);
            String raw_quantity = req.getParameter("quantity" + pid);
            String raw_effort = req.getParameter("effort" + pid);
            header.setQuantity(raw_quantity != null && raw_quantity.length() > 0 ? Integer.parseInt(raw_quantity) : 0);
            header.setEstimatedeffort(raw_effort != null && raw_effort.length() > 0 ? Float.parseFloat(raw_effort) : 0);

            if (header.getQuantity() > 0 && header.getEstimatedeffort() > 0) {
                plan.getHeaders().add(header);
            }
        }

        if (plan.getHeaders().size() > 0) {
            ProductPlanDBContext db = new ProductPlanDBContext();
            db.update(plan);
            resp.sendRedirect("list");
        } else {
            resp.getWriter().println("your plan does not have any headers! it is not allowed!");
        }
    }
}
