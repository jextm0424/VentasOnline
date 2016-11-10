<%@page import="com.webstotales.ventasOnline.domain.Usuario"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<html>
<head>

<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<script src='<c:url value="dwr/engine.js"/>'></script>
<script src='<c:url value="dwr/interface/ajax.js"/>'></script>
<script src='<c:url value="dwr/util.js"/>'></script>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/default/default.css"/>"  rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
<link href="<c:url value="/resources/css/bootstrap-datepicker.min.css"/>"  rel="stylesheet" type="text/css" />
<decorator:head/>
<title>Sistema de Ventas Online <decorator:title/></title>
</head>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<body class="home" onload="getEstado()">
    <div class="container-fluid display-table">
        <div class="row display-table-row">
            <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">
                <div class="logo">
                    <a href="<c:url value="/index"/>"><img src="http://logo222.com/wp-content/uploads/2014/11/Logo1016D.png" alt="merkery_logo" class="hidden-xs hidden-sm">
                        <!-- <img src="http://kingofwallpapers.com/circle/circle-003.jpg" alt="merkery_logo" class="visible-xs visible-sm circle-logo"> -->
                    </a>
                </div>
                <div class="navi">
                    <ul>  
                    <li><a href="<c:url value="/index"/>"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Home</span></a></li>
                    	<c:if test="${not empty admin }">
	                        <li><a href="<c:url value="/mPedido?estado=I"/>"><i class="fa fa-list" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Pedidos</span></a></li>
	                        <li><a href="<c:url value="/client"/>"><i class="fa fa-user-plus" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Cliente</span></a></li>
	                        <li><a href="<c:url value="/ePedido"/>"><i class="fa fa-flag" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Estados</span></a></li>
	                        <li><a href="<c:url value="/eClient"/>"><i class="fa fa-users" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Lista de Usuarios</span></a></li>
	                        <li><a href="<c:url value="/masVendidos"/>"><i class="fa fa-level-up" aria-hidden="true"></i><span class="hidden-xs hidden-sm">P. Mas Vendidos</span></a></li>
	                        <li><a href="<c:url value="/rPedido"/>"><i class="fa fa-level-up" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Top Client</span></a></li>
	                        <li><a href="<c:url value="/aPlato"/>"><i class="fa fa-plus-circle" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Agregar Plato</span></a></li>
	                        <%--  <li><a href="<c:url value="/rPedido"/>"><i class="fa fa-ban" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Rechazos</span></a></li> --%>
                         </c:if>
                         <li><a href="<c:url value="/platos"/>"><i class="fa fa-cutlery" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Platos</span></a></li>
                         <li><a href="<c:url value="/cPedidos"/>"><i class="fa fa-history" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Consultar Pedidos</span></a></li>
                        <!-- <li><a href="#"><i class="fa fa-cog" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Setting</span></a></li> -->
                    </ul>
                </div>
            </div>
            <div class="col-md-10 col-sm-11 display-table-cell v-align">
                <!--<button type="button" class="slide-toggle">Slide Toggle</button> -->
                <div class="row">
                    <header>
                        <div class="col-md-7">
                            <nav class="navbar-default pull-left">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="offcanvas" data-target="#side-menu" aria-expanded="false">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>
                            </nav>
                            <c:if test="${not empty admin }">
                          		<div class="search hidden-xs hidden-sm">
                                	<input type="text" placeholder="Buscar Pedido" id="searchPedido" onkeydown="validar(this)">
                            	</div> 
                            </c:if>
                        </div>
                        <div class="col-md-5">
                            <div class="header-rightside">
                                <ul class="list-inline header-top pull-right">
                                <c:if test="${not empty admin }">
                                    <!-- <li class="hidden-xs"><a href="#" class="add-project" data-toggle="modal" data-target="#add_project">Add Project</a></li> -->
                                    <li>
                                    	<a href="<c:url value="/pedidos"/>" class="icon-info">
                                    		<i class="fa fa-rocket" aria-hidden="true"></i>
                                    		<span class="label label-primary" id="idPedido">0</span>
                                    	</a>
                                    </li>
								</c:if>
                                    <li>
                                        <a href="<c:url value="/carrito"/>" class="icon-info">
                                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                            <span class="label label-primary" id="idCarrito">0</span>
                                        </a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<c:url value="/resources/img/Jorge Flores.png"/>" alt="user">
                                            <b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <div class="navbar-content">
                                              
                                                    <span></span>
                                                    <p class="text-muted small">
                                                       <c:if test="${not empty user }">
                                                       		<c:out value="${user.nombre }"/>,<c:out value="${user.apellidoPat }"/> <c:out value="${user.apellidoMat }"/> 
                                                       	</c:if> 
                                                    </p>
                                                    <div class="divider">
                                                    </div>
                                                    <a href="<c:url value="/mUsuario"/>" class="btn btn-sm">Cuenta</a>
                                                    <a href="<c:url value="/logoff"/>" class="btn btn-sm active">Cerrar Session</a>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </header>
                </div>
                <div class="user-dashboard">
                    
                    <div class="row"><br>
                    	<c:if test="${not empty mensaje }">
                    		<div class="alert alert-info text-center"><b><c:out value="${mensaje}"/></b></div>
                    	</c:if>
						<decorator:body/>
                    </div>
                </div>
            </div>
        </div>

    </div>



    <!-- Modal -->
    <div id="add_project" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header login-header">
                    <button type="button" class="close" data-dismiss="modal">X</button>
                    <h4 class="modal-title">Add Project</h4>
                </div>
                <div class="modal-body">
                            <input type="text" placeholder="Project Title" name="name">
                            <input type="text" placeholder="Post of Post" name="mail">
                            <input type="text" placeholder="Author" name="passsword">
                            <textarea placeholder="Desicrption"></textarea>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="cancel" data-dismiss="modal">Close</button>
                    <button type="button" class="add-project" data-dismiss="modal">Save</button>
                </div>
            </div>

        </div>
    </div>
    
    
        <!-- Modal -->
    <div id="modalRegistrar" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header login-header">
                    <button type="button" class="close" data-dismiss="modal">X</button>
                    <h4 class="modal-title">Registrar</h4>
                </div>
                <div class="modal-body">
                            <input type="text" placeholder=Nombre id="cNombre">
                            <input type="text" placeholder="Apellido Paterno" id="cApePat">
                            <input type="text" placeholder="Apellido Materno" id="cApeMat">
                            <input type="number" placeholder="DNI" id="cDNI">
                            <input type="email" placeholder="Email" id="cEmail">
                            <input type="text" placeholder="Direccion" id="cDireccion">
                            <input type="text" placeholder="Usuario" id="cUsuario">
                            <input type="password" placeholder="Contraseña" id="cPassword">
                            <input type="text" placeholder="Peso (KG.)" id="cPeso">
                            <input type="text" placeholder="Talla (M.)" id="cTalla">
                            <select id="cSexo" class="form-control">
                            	<option value="M">Masculino</option>
                            	<option value="F">Femenino</option>
                            </select>
                            <input type="number" placeholder="Celular" id="cCelular">
                            <input type="number" placeholder="# Tarjeta" id="cTarjeta">
                            <input type="text" placeholder="Fecha De Nacimiento DD/MM/YYYY" id="fechaNac">
                    
                    </div>
                <div class="modal-footer">
                    <button type="button" class="cancel" data-dismiss="modal">Close</button>
                    <button type="button" class="add-project" data-dismiss="modal" onclick="return save()">Save</button>
                </div>
            </div>

        </div>
    </div>
    
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
    <script type="text/javascript" src='<c:url value="/resources/js/dataTables.bootstrap.min.js"/>'></script>
    <script type="text/javascript" src='<c:url value="/resources/js/bootstrap-datepicker.min.js"/>'></script>
    <script type="text/javascript" src='<c:url value="/resources/js/bootstrap-datepicker.es.min.js"/>'></script>
    
	<script>
	$(document).ready(function(){
		   $('[data-toggle="offcanvas"]').click(function(){
		       $("#navigation").toggleClass("hidden-xs");
		   });
		});
	
	</script>
	<script type="text/javascript">
	function getEstado(){
		getCarrito();
	ajax.getPedEstadoCount(1,function(data){
		if(data>0){
			$("#idPedido").text(data);
			$("#idPedido").attr("class","label label-danger");
		}
	});
	}
	function validar(elemento){
		$(elemento).keypress(function(e) {
		    if(e.which == 13) {
		    	window.location.href = '<c:url value="/BuscarPedido?codigo="/>'+$("#searchPedido").val();
		    }
		});
	}
	function getCarrito(){
		ajax.countByUsuario(${user.idUsuario},function(data){
			if(data>0){
			$("#idCarrito").text(data);
			$("#idCarrito").attr("class","label label-danger");
			}
		});
	}
	setInterval('getEstado()', 5000);
	
	$(document).ready(function() {
	    $('#dataTable').DataTable();
	} );

	$('#fechaNac').datepicker({
	    format: "dd/mm/yyyy",
	    todayBtn: true,
	    language: "es",
	    autoclose: true
	});
	</script>
</body>
</html>