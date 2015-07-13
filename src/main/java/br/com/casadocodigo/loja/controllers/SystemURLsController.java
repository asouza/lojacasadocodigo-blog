package br.com.casadocodigo.loja.controllers;

import java.util.Arrays;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.casadocodigo.loja.models.Role;
import br.com.casadocodigo.loja.models.SystemURL;

/**
 * Apenas para a ajudar a criar algumas urls associadas a roles
 * @author alberto
 *
 */
@Controller
public class SystemURLsController {
	
	@PersistenceContext
	private EntityManager em;

	@RequestMapping("/url")
	@ResponseBody
	@Transactional
	public String create(String url,String roleName) {
		SystemURL systemURL = new SystemURL();
		systemURL.setValue(url);
		systemURL.setRolesAllowed(Arrays.asList(new Role(roleName)));
		em.persist(systemURL);
		return "urls criadas";
	}
}
