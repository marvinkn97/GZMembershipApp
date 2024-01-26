package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.Membership;
import tech.csm.repo.MembershipRepo;

@Service
public class MembershipServiceImpl implements MembershipService {

	@Autowired
	private MembershipRepo membershipRepo;

	@Override
	public List<Membership> getAllMemberships() {
		return membershipRepo.findAll();
	}

	@Override
	public String registerMember(Membership membership) {
		Membership m = membershipRepo.save(membership);
		return "Membership saved successfully with id " + m.getMemberId();
	}

	@Override
	public String deleteMember(String membershipId) {
		Membership m = membershipRepo.findByMemberId(membershipId);

		if (m != null) {
			membershipRepo.delete(m);
			return "Member deleted successfully";
		} else {
			return "member not found";

		}

	}

	@Override
	public Membership getMemberById(String membershipId) {
		return membershipRepo.findByMemberId(membershipId);

	}

	@Override
	public String upgradePlan(Membership membership) {
		membershipRepo.save(membership);
		return "Membership plan updated";
	}

}
