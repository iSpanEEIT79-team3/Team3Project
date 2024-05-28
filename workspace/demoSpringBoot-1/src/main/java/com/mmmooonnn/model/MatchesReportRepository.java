package com.mmmooonnn.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MatchesReportRepository extends JpaRepository<MatchesReportBean, Integer> {
}