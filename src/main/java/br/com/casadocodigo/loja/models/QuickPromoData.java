package br.com.casadocodigo.loja.models;

import java.math.BigDecimal;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;

public class QuickPromoData {
	
	private String title;
	private BigDecimal ebookPrice;
	private String msg;

	/**
	 * @deprecated apenas para os fws
	 */
	public QuickPromoData() {
	}

	public QuickPromoData(Product product,MessageSource messageSource) {
		this.title = product.getTitle();
		this.ebookPrice = product.priceFor(BookType.EBOOK);
		this.msg = messageSource.getMessage("quickPromo.msg",new Object[]{this.title}, LocaleContextHolder.getLocale());
	}
	
	public String getTitle() {
		return title;
	}
	
	public BigDecimal getEbookPrice() {
		return ebookPrice;
	}
	
	public String getMsg() {
		return msg;
	}

}
