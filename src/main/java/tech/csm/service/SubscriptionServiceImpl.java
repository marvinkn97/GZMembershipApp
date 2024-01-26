package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.Subscription;
import tech.csm.repo.SubscriptionRepo;


@Service
public class SubscriptionServiceImpl implements SubscriptionService {
	
	@Autowired
	private SubscriptionRepo subscriptionRepo;

	@Override
	public List<Subscription> getAllSubs() {
		return subscriptionRepo.findAll();
	}

	@Override
	public Subscription getSubscriptionById(Integer sbId) {
		return subscriptionRepo.findById(sbId).get();
	}
		

}
