package com.mmmooonnn.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface UsersRepository extends JpaRepository<UsersBeanNew, Integer> {
	
//    @Query(value = "SELECT * FROM usersnew u WHERE (:userid IS NOT NULL OR u.userId NOT IN (SELECT m.user2_id FROM matches m WHERE m.user1_id = :userid) AND u.userId <> :userid)", nativeQuery = true)
//    public List<UsersBeanNew> findMatchesByStatus(@Param("userid") Integer userid);
//

	@Query(value ="SELECT * FROM usersnew "
			+   "WHERE userId not in (SELECT user2_id FROM matches WHERE user1_id = :userid) and userId <> :userid" , nativeQuery = true)
		List<UsersBeanNew> findMatchesByStatus(@Param("userid") Integer userid);
	


}

