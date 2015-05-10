package br.com.casadocodigo.loja.daos;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import br.com.casadocodigo.loja.builders.ProductBuilder;
import br.com.casadocodigo.loja.conf.DataSourceConfigurationTest;
import br.com.casadocodigo.loja.conf.JPAConfiguration;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {JPAConfiguration.class,DataSourceConfigurationTest.class })
@ActiveProfiles("test")
public class ProductDAOTest {

	@Autowired
	private ProductDAO productDAO;

	@Transactional
	@Test
	public void shouldSumAllPricesOfEachBookPerType() {		
		List<Product> printedBooks = ProductBuilder
				.newProduct(BookType.PRINTED, BigDecimal.TEN).more(4)
				.buildAll();
		printedBooks.stream().forEach(productDAO::save);

		List<Product> ebooks = ProductBuilder
				.newProduct(BookType.EBOOK, BigDecimal.TEN).more(4).buildAll();
		ebooks.stream().forEach(productDAO::save);
		BigDecimal value = productDAO.sumPricesPerType(BookType.PRINTED);
		Assert.assertEquals(new BigDecimal(50).setScale(2), value);
		
	}
	
	@Transactional
	@Test
	public void shouldFindAllBooksWithMoreThanX() {		
		List<Product> printedBooks100 = ProductBuilder
				.newProduct(BookType.PRINTED, BigDecimal.TEN,100).more(2)
				.buildAll();
		printedBooks100.stream().forEach(productDAO::save);
		
		List<Product> printedBooksGreaterThan100 = ProductBuilder
				.newProduct(BookType.PRINTED, BigDecimal.TEN,150).more(2)
				.buildAll();
		printedBooksGreaterThan100.stream().forEach(productDAO::save);
		
		List<Product> books = productDAO.findByPagesGreaterThan(100);
		Assert.assertEquals(3, books.size());
		
	}
}
