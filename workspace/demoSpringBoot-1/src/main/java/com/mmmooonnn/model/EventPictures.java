//package com.mmmooonnn.model;
//
//import org.springframework.stereotype.Component;
//
//import com.fasterxml.jackson.annotation.JsonBackReference;
//import com.fasterxml.jackson.annotation.JsonIgnore;
//
//import jakarta.persistence.Column;
//import jakarta.persistence.Entity;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.GenerationType;
//import jakarta.persistence.Id;
//import jakarta.persistence.JoinColumn;
//import jakarta.persistence.Lob;
//import jakarta.persistence.ManyToOne;
//import jakarta.persistence.Table;
//
//
//@Entity
//@Table(name="Photos")@Component
//public class EventPictures {
//
//		@Id
//	    @GeneratedValue(strategy = GenerationType.IDENTITY)
//		@Column(name = "photo_id")
//	  private Integer photoId;
//		
//		@Column(name = "photo_name")
//	    private String photoName;
//	    
//	    
//	    @Lob
//		@JsonIgnore
//		@Column(name = "photo_data")
//	    private byte[] photoData;
//	    
//	    @Column(name="PRODUCTID", insertable = false, updatable = false)
//		private Integer eventId;
//	    
//	    @JsonBackReference
//	    @ManyToOne
//	    @JoinColumn(name = "PRODUCTID")
//	    private Event event;
//
//		public EventPictures() {
//			
//		}
//	    
//
//	
//}
