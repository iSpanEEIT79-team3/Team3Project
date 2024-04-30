/*package com.mmmooonnn.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MatchRecordRepository extends JpaRepository<MatchRecordBean, Integer> {

	@Query("from MatchBean where gender = :gender and age <= :maxAge and id != :specifiedUserId")
	List<MatchBean> findByGenderAndAgeLessThanAndIdNot(@Param("gender") String gender, @Param("maxAge") int maxAge,
			@Param("specifiedUserId") int specifiedUserId);

	
}*/
