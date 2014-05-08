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
    <jsp:useBean id="login" scope="page" class="holi.Login" />
    <jsp:useBean id="logueado" scope="application" class="holi.Login" />
    <jsp:useBean id="clientes" scope="page" class="holi.cliente" />
     <jsp:setProperty name="clientes" property="*" />

    <!-- VALIDAR DATOS INGRESADOS -->
    <jsp:useBean id="verificacion" scope="page" class="holi.verificaciones" />


   <article class="container">
		<header>
			<h1>Ingresar Cliente</h1>
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
					<input type="hidden" name="LoginEnv" id="LoginEnv" value="1" />
				</fieldset>  
							
			</div>
			<div class="modal-footer">
				<input type="hidden" name="LoginEnviado" id="LoginEnviado" value="1" />
				<button type="submit" class="btn btn-primary">Finalizar</button>
			</div>
		</form>
		
			<% if (logueado.getLoginEnv()==1) { %> <!-- Si el usuario ya ingreso todos los datos del formulario...-->
		       <article class="after-form">
		           <div class="container">

                  <% if (verificacion.CountVendedores()==true) { %> <!-- Si hay vendedores en el sistema...-->

					 <% if (clientes.getNombre() == null || clientes.getRut() == null || 
				        (verificacion.ClienteRepetido(clientes.getRut()) || 
 !(verificacion.IngresarCliente(clientes.getRut(),clientes.getNombre())))) { %>

				            <p>Por favor corregir información</p>

				        <!-- Si no ingresó alguno de los datos del formulario... -->

				            <% if (clientes.getNombre() == null) { %>

				            <p class="text-small">Debes ingresar el nombre del cliente<p>

				            <% } if(clientes.getRut() == null) { %>

				                <p class="text-small">Debes ingresar el RUT del cliente</p>

				            <% } if(verificacion.ClienteRepetido(clientes.getRut())) { %>

					            <p class="text-small">El RUT ingresado ya existe en el sistema</p>

				            <% } %>

				        <% } else { %>
								<p>El cliente fue agregado correctamente al sistema.</p>





					    <% } %> //cierre else
					     <% } %> //cierre if verificaciones
					<% } %> // cierre if count vendedores

                       <% else { %>
                       <p>No existe ningún vendedor en el sistema. No se puede realizar el ingreso de cliente</p>
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
						<span class="brand" class="user-name" href="#">Bienvenido Administrador</span>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Menú de usuario<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="nav-header">Administrador</li>
							<li><a href="addvendedor.jsp">Ingresar vendedor</a></li>
							<li><a href="addcliente.jsp"><b>Ingresar cliente<b></a></li>
							<li><a href="adminprod.jsp">Administrar productos</a></li>
							<li><a href="addcompra.jsp">Ingresar compra</a></li>
							<li><a href="addventa.jsp">Ingresar venta</a></li>
							<li><a href="showsales.jsp">Ver ventas a cliente</a></li>
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
