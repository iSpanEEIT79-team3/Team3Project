package com.mmmooonnn.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mmmooonnn.model.ReplyBean;

public interface ReplyRepository extends JpaRepository<ReplyBean, Integer> {
	@Query(value = "SELECT * FROM Reply WHERE ltBean = :ltId", nativeQuery = true)
    List<ReplyBean> findByID(@Param("ltId") Integer ltId);
}



