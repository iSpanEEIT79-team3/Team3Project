package com.mmmooonnn.model;

import java.io.Serializable;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "MATCHESREPORT")
@Component
public class MatchesReportBean   implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "REPORT_ID")
	private Integer reportid;
	@Column(name = "REPORTER_ID")
	private Integer reporterid;
	@Column(name = "REPORTED_USER_ID")
	private Integer reporteduserid;
	@Column(name = "REPORT_REASON")
	private String reportreason;
	public Integer getReportid() {
		return reportid;
	}
	public void setReportid(Integer reportid) {
		this.reportid = reportid;
	}
	public Integer getReporterid() {
		return reporterid;
	}
	public void setReporterid(Integer reporterid) {
		this.reporterid = reporterid;
	}
	public Integer getReporteduserid() {
		return reporteduserid;
	}
	public void setReporteduserid(Integer reporteduserid) {
		this.reporteduserid = reporteduserid;
	}
	public String getReportreason() {
		return reportreason;
	}
	public void setReportreason(String reportreason) {
		this.reportreason = reportreason;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MatchesReprotBean [reportid=" + reportid + ", reporterid=" + reporterid + ", reporteduserid="
				+ reporteduserid + ", reportreason=" + reportreason + "]";
	}
	public MatchesReportBean(Integer reportid, Integer reporterid, Integer reporteduserid, String reportreason) {
		super();
		this.reportid = reportid;
		this.reporterid = reporterid;
		this.reporteduserid = reporteduserid;
		this.reportreason = reportreason;
	}
	public MatchesReportBean() {
		super();
	}
	
}