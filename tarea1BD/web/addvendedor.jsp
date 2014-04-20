<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Pepe's Work</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="css/style.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>

  <body class="profile">
	<%@page import="holi.verificaciones"%>
    <%@page import="holi.usuario"%>
    <jsp:useBean id="logueado" scope="page" class="holi.Login" />
    <jsp:useBean id="logueado" scope="application" class="holi.Login" />
    <jsp:useBean id="vendedor" scope="page" class="holi.usuario" />
    <jsp:setProperty name="vendedor" property="*" />

	<%
            usuario user = new usuario();
            new verificaciones().cargarUsuario(user,logueado.getNombre());
    %>

   <article class="container">
		<header>
			<h1>Ingresar Vendedor</h1>
	  </header>
	
		<form class="form-horizontal">
			<div class="modal-body">

				<fieldset>
					<!-- RUT -->
					<div class="control-group">
						<label class="control-label" for="rut">RUT</label>
						<div class="controls">
							<input type="text" class="input-xlarge" name="rut" id="rut" />
						</div>
					</div>

					<hr />

					<!-- Nombre -->
					<div class="control-group">
						<label class="control-label" for="nombre">Nombre</label>
						<div class="controls">
							<input type="text" class="input-xlarge" name="nombre" id="nombre" />
						</div>
					</div>

					<hr />

					<!-- Nombre de usuario-->
					<div class="control-group">
						<label class="control-label" for="nombre_usuario">Nombre de usuario</label>
						<div class="controls">
							<input type="text" class="input-xlarge" name="nombre_usuario" id="nombre_usuario" />
						</div>
					</div>

					<hr />
					<!-- Contrasena -->
					<div class="control-group">
						<label class="control-label" for="password">Contraseña</label>
						<div class="controls">
							<input type="password" class="input-xlarge" type="text" name="password" id="password" />
						</div>
					</div>

					<hr />

					<!-- Repetir contrasena -->
					<div class="control-group">
						<label class="control-label" for="rpassword">Repite contraseña</label>
						<div class="controls">
							<input type="password" class="input-xlarge" type="text" name="rpassword" id="rpassword" />
						</div>
					</div>

					<hr />
					<input type="hidden" name="LoginEnv" id="LoginEnv" value="1" />
				</fieldset>  
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Finalizar</button>
			</div>
		</form>
		
		<% if (logueado.getLoginEnv()==1) { %> <!-- Si el usuario ya ingreso todos los datos del formulario...-->
	       <article class="after-form">
	           <div class="container">

				 <% if (logueado.getNombre() == null || logueado.getPassword() == null || logueado.getRpassword() == null  || logueado.getRut() == null  || !(logueado.getPassword().equals(logueado.getRpassword())) || 
			        !(verificacion.IngresarVendedor(vendedor.getRut(),vendedor.getPassword(),vendedor.getNombre(),vendedor.getUsername())) || !(verificacion.ValidarRut(vendedor.getRut())) || (verificacion.NickUsado(vendedor.getUsername())){ %>

			            <p>Por favor corregir información</p>

			        <!-- Si no ingresó alguno de los datos del formulario... -->

			            <% if (logueado.getNombre() == null) { %>

			            <p class="text-small">Debes ingresar el nombre del vendedor<p>

			            <% } if (logueado.getPassword() == null) { %>

			                <p class="text-small">Debes ingresar una contraseña</p>

			            <% } else if (logueado.getRpassword() == null) { %>
			                <p class="text-small">Debes confirmar la contraseña</p>

			            <% } else if (!logueado.getPassword().equals(logueado.getRpassword())) { %>

			                <p class="text-small">Las contraseñas ingresadas no coinciden</p>

			            <% } if(logueado.getRut() == null) { %>

			                <p class="text-small">Debes ingresar el RUT del vendedor</p>
			
							<% } if(!(verificacion.ValidarRut(vendedor.getRut()))) { %>

					            <p class="text-small">El RUT ingresado no es válido</p>

			            <% } %>

			        <% } else { %>
							<p>El vendedor fue agregado correctamente al sistema.</p>
				    <% } %>
				<% } %>
			    </div>
			    </article> <!-- /información formulario registro -->
			    <% } %>	

	<!-- Barra de navegación -->
    <div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			
			<div class="container">
			
				<!-- Logo -->
				<a class="brand" href="#">Pepe's Work</a>
				
				<!-- Dropdown Menú -->
				<ul class="nav pull-left">
					<li>
						<span class="brand" class="user-name" href="#">Bienvenido <%= user.getNombre() %></span>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Menú de usuario<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="nav-header">Administrador</li>
							<li><a href="addvendedor.html"><b>Ingresar vendedor</b></a></li>
							<li><a href="addcliente.html">Ingresar cliente</a></li>
							<li><a href="adminprod.html">Administrar productos</b></a></li>
							<li><a href="addcompra.html">Ingresar compra</a></li>
							<li><a href="addventa.html">Ingresar venta</a></li>
							<li><a href="showsales.html">Ver ventas a cliente</a></li>
							<li class="divider"></li>
							<li><a href="#">Salir</a></li>
						</ul>
					</li> <!-- /dropdown -->	
				</ul>
			</div> <!-- /container -->
		</div> <!-- /navbar-inner -->
    </div> <!-- /navbar -->
    
    <!-- Footer -->
    <footer>
    	<div class="container">
    		<p>© 2014 Pepe's Work.</p>
    	</div>
    </footer>

    <!-- javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

  </body>
</html>
