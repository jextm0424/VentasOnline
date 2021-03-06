/**
 * Created By: JEXTM 4 set. 2016
 */
package com.webstotales.ventasOnline.domain;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author JEXTM
 *
 */
@Entity
@DiscriminatorValue("E")
@Table(name="t_empleado")
public class Empleado extends Users{
	/**
	 * Generate By: JEXTM 4 set. 2016
	 */
	@Column(name="cargo")
	private String cargo;

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
	
	/**
	 * 
	 */
	public Empleado() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param idUsuario
	 * @param username
	 * @param password
	 * @param estado
	 * @param nombre
	 * @param apellido
	 * @param direccion
	 * @param cargo
	 */
	public Empleado(Integer idUsuario, String username, String password, Character estado, String nombre,
			String apellido, String direccion, String cargo) {
		super(idUsuario, username, password, estado, nombre, apellido, direccion);
		this.cargo = cargo;
	}
}
