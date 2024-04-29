package com.ispan.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.model.ReportBean;

public interface ReportRepository extends JpaRepository<ReportBean, Integer> {
	@Query(value = "SELECT * FROM Report WHERE ltBean = :ltId", nativeQuery = true)
    List<ReportBean> findByID(@Param("ltId") Integer ltId);
}

