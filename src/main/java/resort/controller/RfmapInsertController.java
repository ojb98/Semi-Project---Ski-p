package resort.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dao.FacilityDao;
import resort.dao.ResortDao;
import resort.dto.FacilityListDTO;
import resort.dto.ResortFacilityMapDTO;

@WebServlet("/rfmap/insert")
public class RfmapInsertController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int resortId = Integer.parseInt(req.getParameter("resort_id"));

		//시설유형,시설이름 목록 가져오기
		FacilityDao fdao=FacilityDao.getInstance();
		List<FacilityListDTO> flist=fdao.listAll();
		System.out.println("List<FacilityListDTO>에 저장된 목록들:" + flist);
		
		//해당 리조트에 매핑된 facility_id 가져오기
		List<Integer> facilityIds=fdao.getFacilityId(resortId);
		
		
		req.setAttribute("resort_id", resortId);
        req.setAttribute("flist", flist);
        req.setAttribute("facilityIds", facilityIds);
        
        req.getRequestDispatcher("/resort/rfmapInsertForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int resortId = Integer.parseInt(req.getParameter("resort_id"));
        String[] facilityIds = req.getParameterValues("facility_id");
        
        if (facilityIds != null && facilityIds.length > 0) {
        	List<ResortFacilityMapDTO> map = Arrays.stream(facilityIds)
                    .map(fIdStr -> new ResortFacilityMapDTO(resortId, Integer.parseInt(fIdStr)))
                    .collect(Collectors.toList());
        	
        	FacilityDao fdao=FacilityDao.getInstance();
            fdao.mapInsert(map);
        }
        
        resp.sendRedirect(req.getContextPath() + "/resort/detail?resort_id=" + resortId);
    }
		
		
}
