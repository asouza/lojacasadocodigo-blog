package br.com.casadocodigo.loja.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class SystemURL {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(unique=true)
	private String value;
	@ManyToMany
	private List<Role> rolesAllowed;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public List<Role> getRolesAllowed() {
		return rolesAllowed;
	}

	public void setRolesAllowed(List<Role> rolesAllowed) {
		this.rolesAllowed = rolesAllowed;
	}

}
