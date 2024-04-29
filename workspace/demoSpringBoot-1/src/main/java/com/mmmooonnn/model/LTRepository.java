package com.ispan.Dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.model.LTBean;

public interface LTRepository extends JpaRepository<LTBean, Integer> {
    @Query(value = "SELECT * FROM LT WHERE title LIKE %:title%", nativeQuery = true)
    List<LTBean> findByTitle(@Param("title") String title);
}