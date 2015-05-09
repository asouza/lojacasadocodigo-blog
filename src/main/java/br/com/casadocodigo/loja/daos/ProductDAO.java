package br.com.casadocodigo.loja.daos;

import java.math.BigDecimal;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;

@Repository
public interface ProductDAO extends CrudRepository<Product, Integer>{
	
	@Override
	@Query("select distinct(p) from Product p join fetch p.prices where p.id=:id")
	public Product findOne(Integer id);

	@Query("select sum(price.value) from Product p join p.prices price where price.bookType = :book")
	public BigDecimal sumPricesPerType(BookType bookType); 
}
