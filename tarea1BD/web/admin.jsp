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
    <jsp:useBean id="logueado" scope="application" class="holi.Login" />
	<%
            usuario user = new usuario();
            new verificaciones().cargarUsuario(user,logueado.getNombre());
    %>

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
							<li><a href="addvendedor.html">Ingresar vendedor</a></li>
							<li><a href="addcliente.html">Ingresar cliente</a></li>
							<li><a href="adminprod.html">Administrar productos</a></li>
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
