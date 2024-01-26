package tech.csm.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tech.csm.model.Membership;

@Repository
public interface MembershipRepo extends JpaRepository<Membership, Integer> {

	@Query("SELECT m FROM Membership m WHERE m.memberId = :mId")
	Membership findByMemberId(@Param("mId") String membershipId);

}
