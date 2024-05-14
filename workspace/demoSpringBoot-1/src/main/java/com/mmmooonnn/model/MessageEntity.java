package com.mmmooonnn.model;

import java.sql.Date;




public class MessageEntity {

    private Long from;
    private Long to;
    private String message;
    private Date time;
	public Long getFrom() {
		return from;
	}
	public void setFrom(Long from) {
		this.from = from;
	}
	public Long getTo() {
		return to;
	}
	public void setTo(Long to) {
		this.to = to;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public MessageEntity() {
		super();
		
	}
	@Override
	public String toString() {
		return "MessageEntity [from=" + from + ", to=" + to + ", message=" + message + ", time=" + time + "]";
	}
	public MessageEntity(Long from, Long to, String message, Date time) {
		super();
		this.from = from;
		this.to = to;
		this.message = message;
		this.time = time;
	}

}


