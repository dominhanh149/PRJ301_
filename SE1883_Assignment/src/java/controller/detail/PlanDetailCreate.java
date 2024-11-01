/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.detail;

import controller.auth.BaseRBACController;
import dal.PlanDetailDBContext;
import dal.ProductPlanDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.ProductPlan;
import model.ProductPlanDetail;
import model.ProductPlanHeader;
import model.Shift;
import model.User;

/**
 *
 * @author admin
 */
public class PlanDetailCreate extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
// Lấy `plid` từ tham số URL
        int plid = Integer.parseInt(req.getParameter("plid"));

        // Lấy danh sách headers và shifts để hiển thị trong form
        PlanDetailDBContext dbContext = new PlanDetailDBContext();
        ArrayList<ProductPlanHeader> headers = dbContext.getHeadersByPlanId(plid); // Lấy headers theo planId
        

        // Đưa các dữ liệu vào request để hiển thị trên `createdetail.jsp`
        req.setAttribute("headers", headers);
        
        req.setAttribute("planId", plid);

        // Chuyển tiếp đến trang `createdetail.jsp`
        req.getRequestDispatcher("../view/productionPlan/createdetail.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        int plid = Integer.parseInt(req.getParameter("plid"));
        int headerId = Integer.parseInt(req.getParameter("headers")); // Lấy header ID từ form
        int shiftId = Integer.parseInt(req.getParameter("shifts"));   // Lấy shift ID từ form
        String date = req.getParameter("date");
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        // Tạo đối tượng ProductPlanDetail
        ProductPlanDetail detail = new ProductPlanDetail();

        // Gán ProductPlanHeader cho detail
        ProductPlanHeader header = new ProductPlanHeader();
        header.setId(headerId);
        detail.setHeader(header);

        // Gán Shift cho detail
        Shift shift = new Shift();
        shift.setSid(shiftId);
        detail.setShift(shift);

        detail.setDate(java.sql.Date.valueOf(date)); // Chuyển đổi thành kiểu Date
        detail.setQuantity(quantity);

        // Lưu vào cơ sở dữ liệu
        PlanDetailDBContext pddb = new PlanDetailDBContext();
        pddb.insert(detail);

        // Redirect về trang chi tiết kế hoạch sản xuất
        resp.sendRedirect("listdetail?plid=" + plid);
    }
}
