package resort.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import resort.dao.ResortDao;
import resort.dto.ResortDTO;

@WebServlet("/resort/list")
public class ResortListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ResortDao dao=ResortDao.getInstance();
		List<ResortDTO> relist=dao.resortList();
		req.setAttribute("relist", relist);
		req.getRequestDispatcher("/resort/resortList.jsp").forward(req, resp);
	}
	
	
}
