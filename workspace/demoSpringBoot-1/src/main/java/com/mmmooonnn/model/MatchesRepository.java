package com.mmmooonnn.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MatchesRepository extends JpaRepository<MatchesBean, Integer> {

    @Query("SELECT NEW com.mmmooonnn.model.MatchUserDetailsDTO(" +
            "m.matchid, m.user1id, m.user2id, m.matchdate, m.matchsuccess, " +
            "u1.nickName, u1.gender, u1.birthday, u1.danceCharacter, u1.danceAge, u1.picture, " +
            "u2.nickName, u2.gender, u2.birthday, u2.danceCharacter, u2.danceAge, u2.picture) " +
            "FROM MatchesBean m " +
            "JOIN UsersBeanNew u1 ON m.user1id = u1.userId " +
            "JOIN UsersBeanNew u2 ON m.user2id = u2.userId")
    List<MatchUserDetailsDTO> getMatchUserDetails();
    

    @Query("SELECT NEW com.mmmooonnn.model.MatchUserDetailsDTO(" +
            "m.matchid, m.user1id, m.user2id, m.matchdate, m.matchsuccess, " +
            "u1.nickName, u1.gender, u1.birthday, u1.danceCharacter, u1.danceAge, u1.picture, " +
            "u2.nickName, u2.gender, u2.birthday, u2.danceCharacter, u2.danceAge, u2.picture) " +
            "FROM MatchesBean m " +
            "JOIN UsersBeanNew u1 ON m.user1id = u1.userId " +
            "JOIN UsersBeanNew u2 ON m.user2id = u2.userId " +
            "WHERE m.matchsuccess = 'SUCCESS'")
    List<MatchUserDetailsDTO> findSuccessfulMatches();

    @Query("SELECT NEW com.mmmooonnn.model.MatchUserDetailsDTO(" +
            "m.matchid, m.user1id, m.user2id, m.matchdate, m.matchsuccess, " +
            "u1.nickName, u1.gender, u1.birthday, u1.danceCharacter, u1.danceAge, u1.picture, " +
            "u2.nickName, u2.gender, u2.birthday, u2.danceCharacter, u2.danceAge, u2.picture) " +
            "FROM MatchesBean m " +
            "JOIN UsersBeanNew u1 ON m.user1id = u1.userId " +
            "JOIN UsersBeanNew u2 ON m.user2id = u2.userId " +
            "WHERE m.matchsuccess = 'PENDING'")
    List<MatchUserDetailsDTO> findPendingMatches();

    @Query("SELECT NEW com.mmmooonnn.model.MatchUserDetailsDTO(" +
            "m.matchid, m.user1id, m.user2id, m.matchdate, m.matchsuccess, " +
            "u1.nickName, u1.gender, u1.birthday, u1.danceCharacter, u1.danceAge, u1.picture, " +
            "u2.nickName, u2.gender, u2.birthday, u2.danceCharacter, u2.danceAge, u2.picture) " +
            "FROM MatchesBean m " +
            "JOIN UsersBeanNew u1 ON m.user1id = u1.userId " +
            "JOIN UsersBeanNew u2 ON m.user2id = u2.userId " +
            "WHERE m.matchsuccess = 'REJECTED'")
    List<MatchUserDetailsDTO> findRejectedMatches();
}