package com.mmmooonnn.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ReportReplyRepository extends JpaRepository<ReportReplyBean, Integer> {
	@Query(value = "SELECT * FROM ReportReply WHERE replyBean = :replyId", nativeQuery = true)
    List<ReportReplyBean> findByID(@Param("replyId") Integer replyId);
}
