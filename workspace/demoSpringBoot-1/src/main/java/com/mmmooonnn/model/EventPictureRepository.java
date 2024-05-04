//package com.mmmooonnn.model;
//
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
//
//public interface EventPictureRepository extends JpaRepository<EventPictures, Integer> {
//
//	@Query(value = "SELECT TOP 1 photoId FROM photoData WHERE eventId = :eventId ORDER BY photoId ASC", nativeQuery = true)
//	Integer findFirstEventPictureIdByEventId(@Param("eventId") Integer eventId);
//
//	
//}
