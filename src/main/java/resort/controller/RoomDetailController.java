package resort.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dao.RoomDao;
import resort.dto.RoomDTO;

@WebServlet("/resort/rmdetail")
public class RoomDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int resortId=Integer.parseInt(req.getParameter("resort_id"));
		
		RoomDao rmdao=RoomDao.getInstance();
		
		List<RoomDTO> rmdto=rmdao.getInfo(resortId);
		
		req.setAttribute("rmdto", rmdto);
		
		
		req.getRequestDispatcher("/resort/roomDetail.jsp").forward(req, resp);
	}
}
