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
	@Query(value = "INSERT INTO matches (user1_id, user2_id, match_date, match_success, match_status) VALUES (:userId1, :userId2, CURRENT_TIMESTAMP, :matchSuccess, :matchStatus)", nativeQuery = true)
	void createMatch(@Param("userId1") Integer userId1, @Param("userId2") Integer userId2,
			@Param("matchSuccess") String matchSuccess, @Param("matchStatus") String matchStatus);

	

	
	@Query("SELECT NEW com.mmmooonnn.model.MatchUserDetailsDTO"
	        + "(m.matchid, m.user1id, m.user2id, m.matchdate, m.matchsuccess, m.matchstatus, "
	        + "u2.nickName, u2.gender, u2.birthday, u2.danceCharacter, u2.danceAge, u2.picture) "
	        + "FROM MatchesBean m JOIN UsersBeanNew u2 ON m.user2id = u2.userId "
	        + "WHERE m.user1id = :userid AND m.matchstatus = 'Y'")
	List<MatchUserDetailsDTO> findMatches(@Param("userid") Integer userid);


	@Query(value = "SELECT MATCH_ID, USER1_ID, USER2_ID, MATCH_DATE, MATCH_SUCCESS, MATCH_STATUS, NICKNAME, GENDER, BIRTHDAY, DANCECHARACTER, DANCEAGE, USERPICTURE FROM matches WHERE USER1_ID = :userId1 AND USER2_ID = :userId2 AND MATCH_STATUS = 'Y'", nativeQuery = true)
	List<MatchUserDetailsDTO> findMatchUserDetails(@Param("userId1") Integer userId1, @Param("userId2") Integer userId2);

	
}

//	@Query("SELECT NEW com.mmmooonnn.model.MatchUserDetailsDTO("
//			+ "m.matchid, m.user1id, m.user2id, m.matchdate, m.matchsuccess, "
//			+ "u1.nickName, u1.gender, u1.birthday, u1.danceCharacter, u1.danceAge, u1.picture, "
//			+ "u2.nickName, u2.gender, u2.birthday, u2.danceCharacter, u2.danceAge, u2.picture) "
//			+ "FROM MatchesBean m " + "JOIN UsersBeanNew u1 ON m.user1id = u1.userId "
//			+ "JOIN UsersBeanNew u2 ON m.user2id = u2.userId " + "WHERE m.matchsuccess = :status")
//	List<MatchUserDetailsDTO> findMatchesByStatus(@Param("status") String status);
