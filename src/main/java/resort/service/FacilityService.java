package resort.service;

import java.util.List;

import resort.dao.FacilityDao;
import resort.dto.FacilitiesDTO;
import resort.dto.FacilityListDTO;

public class FacilityService {
	private FacilityDao facilityDao =FacilityDao.getInstance();
	    
	public int deleteFacility(int facilityId) {
		return facilityDao.delete(facilityId);
	}
	
	public int insertFacility(FacilitiesDTO dto) {
        return facilityDao.insert(dto);
    }
	
	public List<FacilityListDTO> getFacilityListAll() {
        return facilityDao.listAll();
    }

}
