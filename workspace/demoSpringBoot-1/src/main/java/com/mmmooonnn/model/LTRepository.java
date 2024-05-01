package com.mmmooonnn.model;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mmmooonnn.model.LTBean;

public interface LTRepository extends JpaRepository<LTBean, Integer> {
    @Query("SELECT L FROM LTBean L WHERE L.title LIKE concat('%',:title,'%') ")
    List<LTBean> findByTitle(@Param("title") String title);
}