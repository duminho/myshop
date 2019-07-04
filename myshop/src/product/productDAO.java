package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import product.productDTO;
import product.DBConnectionMgr;

public class productDAO {
	
	 Connection con;
	 PreparedStatement ps;
	 ResultSet rs;
	 DBConnectionMgr mgr;
	 
	 public productDAO() {
		mgr = DBConnectionMgr.getInstance();
	 }
	
	 public void insert(productDTO dto) throws Exception {

	      con = mgr.getConnection();
	      String sql = "insert into product values(?,?,?,?)";
	      ps = con.prepareStatement(sql);
	      System.out.println("연결 성공했다구(insert)");

	      ps.setString(1, dto.getId());
	      ps.setString(2, dto.getTitle());
	      ps.setString(3, dto.getContent());
	      ps.setInt(4, dto.getPrice());

	      ps.executeUpdate();
	      System.out.println("상품 db등록");   
	}
	
	 public void update(String id, String content,int price) throws Exception {
	      con = mgr.getConnection();

	      String sql = "update product set content = ?, price = ? where id = ?";
	      ps = con.prepareStatement(sql);

	      ps.setString(1, content);
	      ps.setInt(2, price);
	      ps.setString(3, id);

	      ps.executeUpdate();
	      System.out.println("상품 변경!");
	}
	 public void delete(String id) throws Exception {

	      con = mgr.getConnection();

	      String sql = "delete from product where id = ?";
	      ps = con.prepareStatement(sql);
	      ps.setString(1, id);

	      ps.executeUpdate();
	}
	
	 public productDTO select(String inputid) throws Exception {

	      con = mgr.getConnection();

	      String sql = "select * from product where id = ?";
	      ps = con.prepareStatement(sql);
	      ps.setString(1, inputid);

	      rs = ps.executeQuery();
	      productDTO dto2 = null;

	      while (rs.next()) {
	         dto2 = new productDTO();
	         String id = rs.getString(1);
	         String title = rs.getString(2);
	         String content = rs.getString(3);
	         int price = rs.getInt(4);

	         dto2.setId(id);
	         dto2.setTitle(title);
	         dto2.setContent(content);
	         dto2.setPrice(price);
	      }
	      return dto2;
	 }
	 public ArrayList selectAll() {

	      ArrayList list = new ArrayList();
	      productDTO dto = null;

	      try {
	         con = mgr.getConnection();
	         
	         String sql = "select * from product";
	         ps = con.prepareStatement(sql);
	         
	         rs = ps.executeQuery();
	         
	         while (rs.next()) {

	            dto = new productDTO();
	            String id = rs.getString(1);
	            String title = rs.getString(2);
	            String content = rs.getString(3);
	            int price = rs.getInt(4);

	            
	            dto.setId(id);
	            dto.setTitle(title);
	            dto.setContent(content);
	            dto.setPrice(price);

	            list.add(dto);
	            
	         }

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
	 public String idCheck(String InputId) {
			
			String id = null;
			mgr = DBConnectionMgr.getInstance();
			try {
				con = mgr.getConnection();
				String sql = "select * from product where id=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, InputId);
				rs = ps.executeQuery();

				if(rs.next()) {
					id = rs.getString(1);
				}else {
					id = null;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				mgr.freeConnection(con);
			}
			return id;
		}
	 
}
