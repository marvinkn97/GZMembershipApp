package tech.csm.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name="t_membership_master")
public class Membership implements Serializable  {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8370306334748641805L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="membership_id")
	private Integer memberId;
	
	private String name;
	private String email;
	
	@Column(name="phone_no")
	private String phoneNo;
	
	@DateTimeFormat(pattern = "yyy-MM-dd")
	private Date dob;
	
	private Integer duration;
	
	
	@ManyToOne
	@JoinColumn(name="subscription_id")
	private Subscription subscription;

}
