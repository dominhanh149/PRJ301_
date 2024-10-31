/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.detail;

import controller.auth.BaseRBACController;
import dal.ProductPlanDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import model.ProductPlan;
import model.User;

/**
 *
 * @author admin
 */
public class PlanDetailList extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
/// Lấy planId từ request parameter
        int planId = Integer.parseInt(req.getParameter("plid"));

        // Lấy dữ liệu từ database bằng ProductionPlanDBContext
        ProductPlanDBContext db = new ProductPlanDBContext();
        ProductPlan plan = db.get(planId);

        // Tạo danh sách ngày từ startdate đến enddate
        ArrayList<Date> scheduleDates = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(plan.getStart());
        while (!calendar.getTime().after(plan.getEnd())) {
            scheduleDates.add(calendar.getTime());
            calendar.add(Calendar.DATE, 1);
        }

        // Đưa dữ liệu vào request scope để sử dụng trong JSP
        req.setAttribute("plan", plan);
        req.setAttribute("scheduleDates", scheduleDates);

        // Chuyển tiếp yêu cầu tới trang JSP để hiển thị dữ liệu
        req.getRequestDispatcher("/view/planDetail/list.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
