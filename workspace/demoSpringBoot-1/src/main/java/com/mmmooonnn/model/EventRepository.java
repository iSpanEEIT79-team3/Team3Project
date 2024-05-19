package com.mmmooonnn.model;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;




public interface EventRepository extends JpaRepository<Event, Integer> {
	
	@Query("SELECT e FROM Event e WHERE CAST(e.startTime AS string) LIKE %:startTime%")
	    List<Event> findByStartTime(@Param("startTime") Date startTime);
	   
	   @Query("SELECT e FROM Event e ORDER BY e.startTime ASC")
	   List<Event> findAllByOrderByEventStartTimeAsc();
		
	   
//	   List<Event> findByStartTime(Date startTime);
	   
	   
}
