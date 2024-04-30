package  com.mmmooonnn.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mmmooonnn.model.ReportBean;
import com.mmmooonnn.model.ReportRepository;

@Service
@Transactional
public class ReportService {
	@Autowired
	private ReportRepository rp;

	public ReportBean InsertReport(ReportBean reportBean) {
		return rp.save(reportBean);

	}

	public ReportBean update(ReportBean reportBean) {
		return rp.save(reportBean);

	}

	public ReportBean findById(Integer ReportId) {
		Optional<ReportBean> op1 = rp.findById(ReportId);
		if (op1.isPresent()) {
			return op1.get();

		}
		return null;
	}
	
	public List<ReportBean> findReport(){
		return rp.findAll();
		
	}

	public void deleteById(Integer ReportId) {
		rp.deleteById(ReportId);

	}

	
	public List<ReportBean> findId(Integer ltId){
		
		return rp.findByID(ltId);
		
	}
	
}
