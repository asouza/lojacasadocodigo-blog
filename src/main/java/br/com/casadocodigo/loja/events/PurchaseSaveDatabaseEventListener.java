package br.com.casadocodigo.loja.events;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Component;

import br.com.casadocodigo.loja.events.messages.NewPurchaseEvent;

@Component
@Order(1)
public class PurchaseSaveDatabaseEventListener implements ApplicationListener<NewPurchaseEvent>,Ordered{
	
	@Autowired
	private MailSender mailer;

	@Override
	public void onApplicationEvent(NewPurchaseEvent event) {
		System.out.println("salvando no banco de dados");
	}

	@Override
	public int getOrder() {
		// TODO Auto-generated method stub
		return 0;
	}

}
