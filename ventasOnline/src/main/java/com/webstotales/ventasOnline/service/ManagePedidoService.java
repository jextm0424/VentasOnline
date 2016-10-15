/**
 * Created By: JEXTM 10 set. 2016
 */
package com.webstotales.ventasOnline.service;


import java.util.List;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.webstotales.ventasOnline.domain.Pedido;
import com.webstotales.ventasOnline.domain.model.Detalle_Pedido_Model;
import com.webstotales.ventasOnline.domain.repository.PedidoRepository;

/**
 * @author JEXTM
 *
 */
@Service
public class ManagePedidoService{
	/**
	 * Generate By: JEXTM 10 set. 2016
	 */
	@Autowired
	private PedidoRepository pedidoRepository;
	
	@Transactional(readOnly=true)
	public Long getIngresados(){
		return pedidoRepository.getEstadoCount(1);
	}
	
	@Transactional(readOnly=true)
	public List<Pedido> getByEstado(Integer estado){
		return pedidoRepository.getByEstado(estado);
	}
	@Transactional(readOnly=true)
	public Pedido findById(Integer id){
		return pedidoRepository.findOne(id);
	}
//	@Transactional(readOnly=true)
//	public List<Detalle_Pedido_Model>  getDetalle(Integer idPedido){
//		return pedidoRepository.getDetallePedido(idPedido);
//	}
//	@Transactional(readOnly=true)
//	public Vector<Detalle_Pedido_Model> getDetPedido(Integer idPedido){
//		return pedidoRepository.getDetPedido(idPedido);
//	}
	@Transactional(readOnly=true)
	public List<Pedido> findByName(String  nombre){
		return pedidoRepository.findByName(nombre,nombre);
	}
	@Transactional(readOnly=true)
	public List<Pedido> finByIdC(Integer idPedido){
		return pedidoRepository.finByIdC(idPedido);
	}
	@Transactional(readOnly=true)
	public List<Pedido> findAll(){
		return pedidoRepository.findAll();
	}
	@Transactional
	public Pedido save(Pedido pedido)
	{
		return pedidoRepository.saveAndFlush(pedido);
	}

}
