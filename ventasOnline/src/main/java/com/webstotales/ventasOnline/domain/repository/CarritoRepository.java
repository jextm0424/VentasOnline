/**
 * Created By: JEXTM 3 oct. 2016
 */
package com.webstotales.ventasOnline.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.webstotales.ventasOnline.domain.Carrito;

/**
 * @author JEXTM
 *
 */
@Repository
public interface CarritoRepository extends JpaRepository<Carrito, Integer>{

	@Query("select count(u) from Carrito u where u.usuario = ?1")
	Long countById(Integer idUsuario);
}