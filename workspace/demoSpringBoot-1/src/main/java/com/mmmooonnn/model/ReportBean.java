package com.mmmooonnn.model;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "REPORT")
@Component
public class ReportBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "REPORTID")
	private Integer reportId;

	@Column(name="REPORTCONTENT")
	private String reportContent;
	
//	@ManyToOne
//	@JoinColumn(name = "LTID")
////	@JsonIgnore
//	private LTBean ltBean;
	@Column(name="LTID")
	private Integer  LTId;
	
	
	public ReportBean() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Integer getReportId() {
		return reportId;
	}


	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}


	public String getReportContent() {
		return reportContent;
	}


	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}


	public Integer getLTId() {
		return LTId;
	}


	public void setLTId(Integer lTId) {
		LTId = lTId;
	}


	public ReportBean(Integer reportId, String reportContent, Integer lTId) {
		super();
		this.reportId = reportId;
		this.reportContent = reportContent;
		LTId = lTId;
	}


	@Override
	public String toString() {
		return "ReportBean [reportId=" + reportId + ", reportContent=" + reportContent + ", LTId=" + LTId + "]";
	}


	public ReportBean(String reportContent, Integer lTId) {
		super();
		this.reportContent = reportContent;
		LTId = lTId;
	}


	
}
