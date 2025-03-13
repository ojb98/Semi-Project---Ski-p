package resort.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dao.ResortDao;
import resort.dto.FacilityListDTO;
import resort.dto.ResortDTO;
import resort.dto.RoomDTO;

@WebServlet("/resort/fdetail")
public class FacilityDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int resortId = Integer.parseInt(req.getParameter("resort_id"));
        
        ResortDao rdao = ResortDao.getInstance();


        List<FacilityListDTO> fdto=rdao.getfaciltyInfo(resortId);


      	req.setAttribute("fdto", fdto);


        req.getRequestDispatcher("/resort/resortDetail.jsp").forward(req, resp);
    
	}
}
