package br.com.casadocodigo.loja.daos;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Component;

import br.com.casadocodigo.loja.models.SystemURL;

@Component
public class SystemURLDAO {

	@PersistenceContext
	private EntityManager entityManager;

	public Optional<SystemURL> findByURL(String url) {
		TypedQuery<SystemURL> query = entityManager
				.createQuery("select su from SystemURL su join fetch su.rolesAllowed where su.value = :url",SystemURL.class);
		query.setParameter("url", url);
		List<SystemURL> urls = query.getResultList();
		if(urls.isEmpty()){
			return Optional.empty();
		}
		return Optional.of(urls.get(0));
	}
}
