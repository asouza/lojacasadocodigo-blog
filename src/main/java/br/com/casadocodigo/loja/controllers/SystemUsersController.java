package br.com.casadocodigo.loja.controllers;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.models.Role;
import br.com.casadocodigo.loja.models.SystemUser;

@Controller
@RequestMapping("/admin/users")
@Transactional
public class SystemUsersController {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@InitBinder
    protected void initBinder(WebDataBinder binder) {
		binder.setAllowedFields("login","password","name");
    }

	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView savePossibleBuyer(SystemUser systemUser,RedirectAttributes redirectAttributes){
		systemUser.addRole(new Role("ROLE_NEWS"));
		entityManager.persist(systemUser);
		redirectAttributes.addFlashAttribute("success", "Usuário cadastrado com sucesso");
		return new ModelAndView("redirect:/produtos/");
	}
}
