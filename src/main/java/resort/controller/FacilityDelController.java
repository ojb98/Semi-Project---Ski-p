package resort.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dao.FacilityDao;
import resort.service.FacilityService;

@WebServlet("/facility/delete")
public class FacilityDelController extends HttpServlet{
	private static final int SUCCESS_THRESHOLD = 0;
	private FacilityService facilityService = new FacilityService();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int facilityId=Integer.parseInt(req.getParameter("facility_id"));
		
		int n=facilityService.deleteFacility(facilityId);
		
		if(n>SUCCESS_THRESHOLD) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제실패");
		}
		
		resp.sendRedirect(req.getContextPath()+"/facility/list");
	}
	
}
