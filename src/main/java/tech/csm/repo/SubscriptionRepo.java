package tech.csm.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tech.csm.model.Subscription;

@Repository
public interface SubscriptionRepo extends JpaRepository<Subscription, Integer> {

}
