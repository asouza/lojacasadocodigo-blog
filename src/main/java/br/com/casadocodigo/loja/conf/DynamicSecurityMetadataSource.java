package br.com.casadocodigo.loja.conf;

import java.util.Collection;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;

import br.com.casadocodigo.loja.daos.SystemURLDAO;
import br.com.casadocodigo.loja.models.Role;
import br.com.casadocodigo.loja.models.SystemURL;

@Component
public class DynamicSecurityMetadataSource implements
		FilterInvocationSecurityMetadataSource {

	@Autowired
	private SystemURLDAO systemUrls;;

	@Override
	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {
		final HttpServletRequest request = ((FilterInvocation) object)
				.getRequest();

		String urlWithoutContextPath = request.getRequestURI().substring(
				request.getContextPath().length());

		Optional<SystemURL> foundUrl = systemUrls
				.findByURL(urlWithoutContextPath);

		if (foundUrl.isPresent()) {
			System.out.println("achou a url");
			return foundUrl.get().getRolesAllowed().stream()
					.map(this::configAttribute).collect(Collectors.toList());
		}

		return null;
	}

	private ConfigAttribute configAttribute(Role role) {
		return new ConfigAttribute() {

			/**
			 * 
			 */
			private static final long serialVersionUID = -474661209383691172L;

			@Override
			public String getAttribute() {
				return role.getAuthority();
			}
		};
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return FilterInvocation.class.isAssignableFrom(clazz);
	}

	public static void main(String[] args) {
		String test = "/casadocodigo-blog/produtos/form";
		System.out.println(test.substring("/casadocodigo-blog".length()));
	}

}
