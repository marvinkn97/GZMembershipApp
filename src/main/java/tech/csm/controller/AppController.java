package tech.csm.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.ServletResponse;
import tech.csm.model.Membership;
import tech.csm.model.Subscription;
import tech.csm.service.MembershipService;
import tech.csm.service.SubscriptionService;

@Controller
public class AppController {

	@Autowired
	private SubscriptionService subscriptionService;

	@Autowired
	private MembershipService membershipService;

	@GetMapping("/")
	public String redirectToForm() {
		return "redirect:./getform";
	}

	@GetMapping("/getform")
	public String getForm(Model model) {

		model.addAttribute("subs", subscriptionService.getAllSubs());
		model.addAttribute("memberships", membershipService.getAllMemberships());
	
		return "regform";
	}

	@GetMapping("/calculateTotalCost")
	public void getTotalCost(@RequestParam("subscriptionId") Integer subscriptionId,
			@RequestParam("duration") Integer duration, ServletResponse servletResponse) {
		servletResponse.setContentType("text/plain");

		Subscription subscription = subscriptionService.getSubscriptionById(subscriptionId);

		Double total = subscription.getSubscriptionCost() * duration;

		try {
			servletResponse.getWriter().print(total);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(subscription);

	}

	@PostMapping("/registerMember")
	public String registerMember(@ModelAttribute Membership membership, RedirectAttributes redirectAttributes) {

		String msg = membershipService.registerMember(membership);
		redirectAttributes.addFlashAttribute("msg", msg);

		return "redirect:/getform";
	}

	@GetMapping("/deleteMember")
	public String deleteMember(@RequestParam("membershipId") String membershipId,
			RedirectAttributes redirectAttributes) {
		String msg = membershipService.deleteMember(membershipId);

		redirectAttributes.addFlashAttribute("msg", msg);

		return "redirect:/getform";

	}
}
