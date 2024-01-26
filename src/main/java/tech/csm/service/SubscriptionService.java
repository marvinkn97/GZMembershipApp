package tech.csm.service;

import java.util.List;

import tech.csm.model.Subscription;

public interface SubscriptionService {
	
	List<Subscription> getAllSubs();
	
	Subscription getSubscriptionById(Integer sbId);


}
