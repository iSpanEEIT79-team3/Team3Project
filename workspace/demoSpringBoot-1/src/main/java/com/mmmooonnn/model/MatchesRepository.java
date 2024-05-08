package com.mmmooonnn.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import jakarta.transaction.Transactional;

public interface MatchesRepository extends JpaRepository<MatchesBean, Integer> {

   
	@Modifying
    @Transactional
	   
	    @Query(value = "INSERT INTO matches (user1_id, user2_id, match_date, match_success, match_status) VALUES (:userId1, :userId2, CURRENT_TIMESTAMP, '3' ,'Y')", nativeQuery = true)
	    void createMatch(@Param("userId1") Integer userId1, @Param("userId2") Integer userId2);

	    @Modifying
	    @Transactional
	    @Query(value = "UPDATE matches SET match_status = 'N' WHERE user1_id = :userId1 AND user2_id = :userId2", nativeQuery = true)
	    void cancelMatch(@Param("userId1") Integer userId1, @Param("userId2") Integer userId2);

	
}

//	@Query("SELECT NEW com.mmmooonnn.model.MatchUserDetailsDTO("
//			+ "m.matchid, m.user1id, m.user2id, m.matchdate, m.matchsuccess, "
//			+ "u1.nickName, u1.gender, u1.birthday, u1.danceCharacter, u1.danceAge, u1.picture, "
//			+ "u2.nickName, u2.gender, u2.birthday, u2.danceCharacter, u2.danceAge, u2.picture) "
//			+ "FROM MatchesBean m " + "JOIN UsersBeanNew u1 ON m.user1id = u1.userId "
//			+ "JOIN UsersBeanNew u2 ON m.user2id = u2.userId " + "WHERE m.matchsuccess = :status")
//	List<MatchUserDetailsDTO> findMatchesByStatus(@Param("status") String status);
