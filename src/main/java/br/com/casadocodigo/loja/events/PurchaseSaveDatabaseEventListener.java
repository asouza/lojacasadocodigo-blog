package br.com.casadocodigo.loja.events;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Component;

import br.com.casadocodigo.loja.events.messages.NewPurchaseEvent;

@Component
public class PurchaseSaveDatabaseEventListener implements ApplicationListener<NewPurchaseEvent>{
	
	@Autowired
	private MailSender mailer;

	@Override
	public void onApplicationEvent(NewPurchaseEvent event) {
		System.out.println("salvando no banco de dados");
	}

}
