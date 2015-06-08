package br.com.casadocodigo.loja.controllers;

import java.math.BigDecimal;
import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.ApplicationEventPublisherAware;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.events.messages.NewPurchaseEvent;
import br.com.casadocodigo.loja.models.PaymentData;
import br.com.casadocodigo.loja.models.ShoppingCart;
import br.com.casadocodigo.loja.models.SystemUser;

@RestController
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	private ShoppingCart shoppingCart;
	@Autowired
	private RestTemplate restTemplate;
	@Autowired	
	private ApplicationContext applicationContext;

	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	public Callable<ModelAndView> checkout(@AuthenticationPrincipal SystemUser user) {
		return () -> {
			BigDecimal total = shoppingCart.getTotal();
			String uriToPay = "http://book-payment.herokuapp.com/payment";
			try {
				restTemplate.postForObject(uriToPay,
						new PaymentData(total), String.class);
				applicationContext.publishEvent(new NewPurchaseEvent(this, shoppingCart, user));
				return new ModelAndView("redirect:/payment/success");
			} catch (HttpClientErrorException exception) {
				return new ModelAndView("redirect:/payment/error");
			}			

		};
	}
}
