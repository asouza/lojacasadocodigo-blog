package br.com.casadocodigo.loja.events;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Component;

import br.com.casadocodigo.loja.events.messages.NewPurchaseEvent;

@Component
@Order(2)
public class PurchaseEmailEventListener implements ApplicationListener<NewPurchaseEvent>,Ordered{
	
	@Autowired
	private MailSender mailer;

	@Override
	public void onApplicationEvent(NewPurchaseEvent event) {
		System.out.println("Enviando email de nova compra "+event.getCart().getTotal());
//		SimpleMailMessage email = new SimpleMailMessage();
//		email.setFrom("compras@casadocodigo.com.br");
//		email.setTo(event.getSystemUser().getLogin());
//		email.setSubject("Nova compra");
//		email.setText("corpodo email");			
//		mailer.send(email);
	}

	@Override
	public int getOrder() {
		return 1;
	}

}
