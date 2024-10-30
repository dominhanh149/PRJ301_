/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;

import controller.auth.BaseRBACController;
import dal.DepartmentDBContext;
import dal.EmployeeDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import model.Department;
import model.Employee;
import model.User;

/**
 *
 * @author admin
 */
public class EmployeeFilterController extends BaseRBACController {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, User user)
    throws ServletException, IOException {
        String raw_id = request.getParameter("id");
        String raw_name = request.getParameter("name");
        String raw_phonenumber = request.getParameter("phonenumber");
        String raw_address = request.getParameter("address");
        String raw_did = request.getParameter("did");
        
        //validate data - regular expression (XSS,SQL Injection, Command Injection, Business Rules)
        
        Integer id = (raw_id!=null)&&(!raw_id.isBlank())
                ?Integer.parseInt(raw_id):null;
        String name = raw_name;
        String phonenumber = raw_phonenumber;
        String address = raw_address;
        Integer did = (raw_did!=null) && (!raw_did.equals("-1"))
                ?Integer.parseInt(raw_did): null;
        
        EmployeeDBContext dbEmp = new EmployeeDBContext();
        ArrayList<Employee> emps = dbEmp.search(id, name, phonenumber, address, did);
        DepartmentDBContext dbDept = new DepartmentDBContext();
        ArrayList<Department> depts = dbDept.list();
        
        
        request.setAttribute("depts", depts);
        request.setAttribute("emps", emps);
        
        request.getRequestDispatcher("../view/employee/filter.jsp").forward(request, response);
    } 

    

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }

}
