package tech.csm.service;

import java.util.List;

import tech.csm.model.Membership;

public interface MembershipService {
	
	List<Membership> getAllMemberships();
	
	String registerMember(Membership membership);
	
	String deleteMember(String membershipId);

}
