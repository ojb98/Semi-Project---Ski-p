package resort.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dao.FacilityDao;
import resort.dto.FacilitiesDTO;
import resort.service.FacilityService;

@WebServlet("/facility/insert")
public class FacilityInsertController extends HttpServlet{
	private static final int SUCCESS_THRESHOLD = 0;
	private FacilityService facilityService = new FacilityService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/resort/facilityInsertForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int type_id=Integer.parseInt(req.getParameter("type_id"));
		String facility_name=req.getParameter("facility_name");

		FacilitiesDTO dto=new FacilitiesDTO(0,type_id,facility_name);
	
		int n=facilityService.insertFacility(dto);
		
		if(n>SUCCESS_THRESHOLD) {
			System.out.println(n+"의 등록성공");
		}else {
			System.out.println("등록실패");
		}
	
		resp.sendRedirect(req.getContextPath()+"/index.jsp");
	}

}
