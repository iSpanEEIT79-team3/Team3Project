package com.mmmooonnn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mmmooonnn.model.MatchesReportBean;
import com.mmmooonnn.model.MatchesReportRepository;

@Service
public class MatchesReportService {

    @Autowired
    private MatchesReportRepository repository;

    public List<MatchesReportBean> findAllReports() {
        return repository.findAll();
    }

    public MatchesReportBean findReportById(Integer reportId) {
        return repository.findById(reportId).orElse(null);
    }

    public MatchesReportBean saveReport(MatchesReportBean report) {
        return repository.save(report);
    }

    public void deleteReportById(Integer reportId) {
        repository.deleteById(reportId);
    }
}