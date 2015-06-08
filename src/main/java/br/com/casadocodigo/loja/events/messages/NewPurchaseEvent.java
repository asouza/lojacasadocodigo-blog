package br.com.casadocodigo.loja.events.messages;

import org.springframework.context.ApplicationEvent;

import br.com.casadocodigo.loja.models.ShoppingCart;
import br.com.casadocodigo.loja.models.SystemUser;

public class NewPurchaseEvent extends ApplicationEvent {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7410524290553788367L;
	private final ShoppingCart cart;
	private final SystemUser systemUser;

	public NewPurchaseEvent(Object source, ShoppingCart cart,
			SystemUser systemUser) {
		super(source);
		this.cart = cart;
		this.systemUser = systemUser;
	}

	public ShoppingCart getCart() {
		return cart;
	}

	public SystemUser getSystemUser() {
		return systemUser;
	}

}
