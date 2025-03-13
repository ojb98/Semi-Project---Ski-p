package resort.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dao.FacilityDao;
import resort.dto.FacilityListDTO;
import resort.service.FacilityService;

@WebServlet("/facility/list")
public class FacilityListController extends HttpServlet{
	private FacilityService facilityService = new FacilityService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<FacilityListDTO> flist=facilityService.getFacilityListAll();
		
		req.setAttribute("flist",flist);
		System.out.println(flist);
		
		req.getRequestDispatcher("/resort/facilityList.jsp").forward(req, resp);
	}
	
	
}
