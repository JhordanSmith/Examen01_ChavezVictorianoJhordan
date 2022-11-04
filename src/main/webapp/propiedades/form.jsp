<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="chavez.dominio.propiedades"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%
String control;
propiedades reg = (propiedades) request.getAttribute("reg");
if(reg==null){
	reg.setId(0);
}
if(reg.getId()==0){
	control="store";
}else{
	control="update";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Examen 01 - Chavez</title>
<meta name="robots" content="noindex">
<meta name="googlebot" content="noindex">
<%@include file="../layouts/maincss.jsp"%>
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
									</h5>
								</div>
								<div class="card-body">
									<form action="categoria?accion=<%=control%>" method="post">
				                    	<div class="form-group">
				                    		<label>Nombre</label>
				                    		<input type="hidden" name="id"
												class="form-control" value="<%=reg.getId()%>" />
												<input
												type="text" name="nombre" class="form-control"
												value="<%=reg.getNombre()%>" />
				                    		<br/>
				                    		<button type="submit" class="btn btn-primary">Guardar</button>
				                    		<a href="categoria" class="btn btn-default">Cancelar</a>
				                    	</div>
				              		<div class="col-lg-6">
												<div class="form-group">
													<label>Direccion</label>
													<input
														type="text" name="descripcion" class="form-control"
														value="<%=reg.getDireccion()%>" />
												</div>
											</div>
																						<div class="col-lg-6">
												<div class="form-group">
													<label>Caracteristicas</label>
													<input
														type="text" name="descripcion" class="form-control"
														value="<%=reg.getCaracteristicas()%>" />
												</div>
											</div>
																						<div class="col-lg-6">
												<div class="form-group">
													<label>Estado</label>
													<input
														type="text" name="descripcion" class="form-control"
														value="<%=reg.getEstado()%>" />
												</div>
											</div>
																						<div class="col-lg-6">
												<div class="form-group">
													<label>Precio Alquiler</label>
													<input
														type="text" name="descripcion" class="form-control"
														value="<%=reg.getPrecioalquiler()%>" />
												</div>
											</div>
			                    	</form>
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
		<%@include file="../layouts/footer.jsp" %>
		</div>
	<!-- ./wrapper -->
	<div class="modal fade" id="modal-update">
		<div class="modal-dialog modal-lg"></div>
	</div>
	<%@include file="../layouts/mainjs.jsp" %>
  <script>
	//Marcando las opciones de menú
	  $('#liAlmacen').addClass("menu-open");      
	  $('#lipropiedades').addClass("active");
	  $('#aAlmacen').addClass("active");
  </script>
</body>
</html>