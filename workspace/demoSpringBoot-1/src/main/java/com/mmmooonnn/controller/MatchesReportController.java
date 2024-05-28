package com.mmmooonnn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mmmooonnn.model.MatchesReportBean;
import com.mmmooonnn.service.MatchesReportService;
import com.mmmooonnn.service.MatchesService;

@Controller
@RequestMapping("/reports")
public class MatchesReportController {

    @Autowired
    private MatchesReportService service;
    
    @Autowired
    private MatchesService ms;

    @GetMapping
    public String getAllReports(Model m) {
    	List<MatchesReportBean> result = service.findAllReports();
    	m.addAttribute("reports",result);
        return "forward:/WEB-INF/jsp/back/match/backreport.jsp";
    }

    @GetMapping("/{id}")
    public ResponseEntity<MatchesReportBean> getReportById(@PathVariable Integer id) {
        MatchesReportBean report = service.findReportById(id);
        if (report != null) {
            return ResponseEntity.ok(report);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public MatchesReportBean createReport(@RequestBody MatchesReportBean report) {
        return service.saveReport(report);
    }

    @PutMapping("/{id}")
    public ResponseEntity<MatchesReportBean> updateReport(@PathVariable Integer id, @RequestBody MatchesReportBean reportDetails) {
        MatchesReportBean report = service.findReportById(id);
        if (report != null) {
            report.setReporterid(reportDetails.getReporterid());
            report.setReporteduserid(reportDetails.getReporteduserid());
            report.setReportreason(reportDetails.getReportreason());
            MatchesReportBean updatedReport = service.saveReport(report);
            return ResponseEntity.ok(updatedReport);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

	@PutMapping("/DeleteById")
	public ModelAndView processActionDeleteById(@RequestParam("userId1") Integer userId1, 
	                                            @RequestParam("userId2") Integer userId2,
	                                            @RequestParam("reportid") Integer reportid
	                                           /* @RequestParam("matchSuccess") String matchSuccess, 
	                                            @RequestParam("matchStatus") String matchStatus*/) {
	    ModelAndView view = new ModelAndView("redirect:/reports");
	    try {
	        // 設定更新的狀態
	        String updatedMatchStatus = "N";
	        String updatedMatchSuccess = "0";
	        System.out.println("我的IDDDDDDDDDDDDDDDDDDDDDDDDDD : " + reportid);
	        service.deleteReportById(reportid);

	        // 調用 MatchesService 中的方法來更新狀態
	        ms.updateMatchStatus(userId1, userId2, updatedMatchStatus, updatedMatchSuccess);

	        // 向 ModelAndView 對象添加任何必要的屬性
//	        view.addObject("message", "記錄更新成功。");
	        

	    } catch (Exception e) {
	        // 處理異常並向視圖添加錯誤消息
//	        view.addObject("error", "更新記錄時發生錯誤: " + e.getMessage());
	    }
	    return view;
	}
	
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteReport(@PathVariable Integer id) {
        MatchesReportBean report = service.findReportById(id);
        if (report != null) {
            service.deleteReportById(id);
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/submit")
    public ResponseEntity<String> submitReport(@RequestBody MatchesReportBean report) {
        service.saveReport(report);
        return ResponseEntity.ok("Report submitted successfully");
    }
}
