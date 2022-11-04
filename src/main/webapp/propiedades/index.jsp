<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="chavez.dominio.propiedades,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String texto = (String) request.getAttribute("texto");
String mensaje=(String) request.getAttribute("mensaje");
if(texto==null){
	texto="";
}
List<propiedades> lista = (ArrayList<propiedades>) request.getAttribute("lista");
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Sistema - Plantilla</title>
  <meta name="robots" content="noindex">
  <meta name="googlebot" content="noindex">
  <link rel="icon" type="image/png" href="assets/favicon.ico">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="css/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/adminlte.css">
  <style>
    .sidebar-dark-blue {
      background: #455279 !important;
      
    }

    
  </style>
  <!--Estilos -->
</head>

<body class="hold-transition sidebar-mini">

	<div class="wrapper">

		<%@include file="../layouts/navbar.jsp"%>
		<%@include file="../layouts/menu.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header"></div>
			<!-- /.content-header -->
			<!--CONTENIDO-->
			<!-- TABLA -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<!-- /.col-md-6 -->
						<div class="col-lg-12">
							<div class="card">
								<div class="card-header">
									<h5 class="m-0">
										Propiedades
										<a class="btn btn-primary" href="categoria?accion=create">
											<i class="fas fa-file"></i> Nuevo
										</a>
										<!--  
										<a href="" class="btn btn-success"><i
											class="fas fa-file-csv"></i> CSV</a>
											-->
									</h5>
								</div>
								<div class="card-body">
									<form action="categoria" method="get">
										<div class="input-group">
											<input name="texto" type="text" class="form-control" value="<%=texto %>">
											<div class="input-group-append">
												<button type="submit" class="btn btn-info">
													<i class="fas fa-search"></i> Buscar
												</button>
											</div>
										</div>
									</form>
									<c:if test="${mensaje!= null}">
									<div class="alert alert-info alert-dismissible fade show mt-2">
										<span class="alert-icon"><i class="fa fa-info"></i></span> <span
											class="alert-text"><%=mensaje %></span>
										<button type="button" class="close" data-dismiss="alert"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									</c:if>
									<c:if test="${lista== null}">
									<div class="alert alert-secondary mt-2" role="alert">No
										hay registros para mostrar</div>
									</c:if>
									<div class="mt-2 table-responsive">
										<table
											class="table table-striped table-bordered table-hover table-sm">
											<thead>
												<tr>
													<th style="width: 20%">Opciones</th>
													<th style="width: 20%">Id</th>
													<th style="width: 60%">Nombre</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<c:if test="${lista.size() <= 0}">
														<tr>
															<td colspan="3">No hay resultados</td>
														</tr>
													</c:if>
												</tr>
												<c:forEach items="${lista}" var="reg">
													<tr>
														<td><a href="propiedades?accion=edit&id=${reg.getId() }" class="btn btn-warning btn-sm"><i
																class="fas fa-edit"></i> </a>
															<button class="btn btn-danger btn-sm" onclick="seleccionar(${reg.getId() })">
																<i class="fas fa-trash"></i>
															</button></td>
														<td>${reg.getId()}</td>
														<td>${reg.getNombre()}</td>
														<td>${reg.getDireccion()}</td>
														<td>${reg.getCaracteristicas()}</td>
														<td>${reg.getEstado()}</td>
														<td>${reg.getPrecioalquiler()}</td>
														
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- /.col-md-6 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- FIN TABLA -->
			<!--FIN CONTENIDO-->
		</div>
		<!-- /.content-wrapper -->

		<%@include file="../layouts/footer.jsp"%>
	</div>
	<!-- ./wrapper -->

	<%@include file="../layouts/mainjs.jsp"%>
	<script href="js/sweetalert2@11.js"></script>
	<script>
		//Agregado estilos a los items seleccionados
		$('#liAlmacen').addClass("menu-open");  
		$('#aAlmacen').addClass("active");
		$('#lipropiedades').addClass("active");
		
		function seleccionar(id){
			Swal.fire({
	            title: 'Eliminar Registro',
	            text: "¿Esta seguro de querer eliminar el registro?",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: 'Si',
	            cancelButtonText: 'No'
	          }).then((result) => {
	              if (result.isConfirmed) {
	                  eliminar(id);
	              }
	          })
		}
		
		function eliminar(id){
			$.ajax({
	            method: 'post',
	            url: 'propiedades?accion=delete&id='+id,
	            success: function(res){	            	
		              Swal.fire({            	  
		                  icon: "success",
		                  title: 'Registro eliminado',
		                  showConfirmButton: false,
		                  timer: 1500
		              });
		              window.location.href = 'categoria';
	            },
	            error: function (res){
	              
	            }
	          });
		}
	</script>
	  <!-- REQUIRED SCRIPTS -->
  <!--Scripts -->
  <!-- jQuery -->
  <script href="js/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script href="js/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script href="js/adminlte.min.js"></script>
  <!-- scripts de cada plantilla -->
  <!--Fin Scripts -->
  

                
</body>

</html>