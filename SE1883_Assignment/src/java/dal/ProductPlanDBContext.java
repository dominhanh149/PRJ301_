/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Department;
import model.Product;
import model.ProductPlan;
import model.ProductPlanHeader;

/**
 *
 * @author admin
 */
public class ProductPlanDBContext extends DBContext<ProductPlan> {

    @Override
    public void insert(ProductPlan model) {
        try {
            connection.setAutoCommit(false);
            String sql_insert_plan = "INSERT INTO [Plans]\n"
                    + "           ([plname]\n"
                    + "           ,[startdate]\n"
                    + "           ,[enddate]\n"
                    + "           ,[did])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            PreparedStatement stm_insert_plan = connection.prepareStatement(sql_insert_plan);
            stm_insert_plan.setString(1, model.getName());
            stm_insert_plan.setDate(2, model.getStart());
            stm_insert_plan.setDate(3, model.getEnd());
            stm_insert_plan.setInt(4, model.getDept().getId());
            stm_insert_plan.executeUpdate();

            String sql_select_plan = "SELECT @@IDENTITY as plid";
            PreparedStatement stm_select_plan = connection.prepareStatement(sql_select_plan);
            ResultSet rs = stm_select_plan.executeQuery();
            if (rs.next()) {
                model.setId(rs.getInt("plid"));
            }

            String sql_insert_header = "INSERT INTO [PlanHeaders]\n"
                    + "           ([plid]\n"
                    + "           ,[pid]\n"
                    + "           ,[quantity]\n"
                    + "           ,[estimatedeffort])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            for (ProductPlanHeader header : model.getHeaders()) {
                PreparedStatement stm_insert_header = connection.prepareStatement(sql_insert_header);
                stm_insert_header.setInt(1, model.getId());
                stm_insert_header.setInt(2, header.getProduct().getId());
                stm_insert_header.setInt(3, header.getQuantity());
                stm_insert_header.setFloat(4, header.getEstimatedeffort());
                stm_insert_header.executeUpdate();
            }

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(ProductPlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ProductPlanDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ProductPlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductPlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public void update(ProductPlan model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(ProductPlan model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<ProductPlan> list() {
        String sql = "SELECT p.plid, p.plname, p.startdate, p.enddate, d.did, d.dname, d.type, ph.phid, ph.pid, ph.quantity, ph.estimatedeffort, pr.pname, pr.description "
                + "FROM Plans p "
                + "JOIN Departments d ON p.did = d.did "
                + "LEFT JOIN PlanHeaders ph ON p.plid = ph.plid "
                + "LEFT JOIN Products pr ON ph.pid = pr.pid "
                + "ORDER BY p.plid";
        ArrayList<ProductPlan> plans = new ArrayList<>();

        PreparedStatement ps = null;
        

        try {

            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ProductPlan currentPlan = null;
            while (rs.next()) {
                int plid = rs.getInt("plid");

                if (currentPlan == null || currentPlan.getId()!= plid) {
                    // Add the previous plan to the list if it's not null
                    if (currentPlan != null) {
                        plans.add(currentPlan);
                    }
                    // Create a new ProductionPlan object
                    currentPlan = new ProductPlan();
                    currentPlan.setId(plid);
                    currentPlan.setName(rs.getString("plname"));
                    currentPlan.setStart(rs.getDate("startdate"));
                    currentPlan.setEnd(rs.getDate("enddate"));

                    // Create and set Department object
                    Department department = new Department();
                    department.setId(rs.getInt("did"));
                    department.setName(rs.getString("dname"));
                    department.setType(rs.getString("type"));
                    currentPlan.setDept(department);

                    currentPlan.setHeaders(new ArrayList<>());
                }

                // Check if PlanHeader exists
                int phid = rs.getInt("phid");
                if (phid != 0) {
                    // Create a new PlanHeader object and add it to the current plan
                    ProductPlanHeader header = new ProductPlanHeader();
                    header.setId(phid);
                    header.setQuantity(rs.getInt("quantity"));
                    header.setEstimatedeffort(rs.getFloat("estimatedeffort"));

                    // Create a new Product object and set it in the header
                    Product product = new Product();
                    product.setId(rs.getInt("pid"));
                    product.setName(rs.getString("pname"));
                    product.setDescription(rs.getString("description"));
                    header.setProduct(product);
                    header.setPlan(currentPlan);
                   
                    // Add the header to the current plan
                    currentPlan.getHeaders().add(header);
                }
            }

        
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                ps.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductPlanDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return plans;
    }



@Override
public ProductPlan get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
