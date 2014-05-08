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
    <jsp:useBean id="logueado" scope="application" class="holi.Login" />
    <jsp:useBean id="verificacion" scope="page" class="holi.verificaciones" />
	<%
            usuario user = new usuario();
            new verificaciones().cargarUsuario(user,logueado.getUsername());
            int idvendedor=verificacion.IDVendedorporUsername(user.getUsername());
            String [] names=verificacion.NombreClientes();
    %>

   <article class="container">
		<header>
			<h1>Ver ventas a cliente</h1>
	  </header>

      <div class="control-group">
              <label class="control-label" for="select">Seleccione un cliente</label>
              <div class="controls">
                <select name="clientes" id="clientes">
                    <% for (int i = 0; i < names.length; i++) { %>
                      <option value="<%= names[i] %>"><%= names[i] %></option>
                    <% } %>
                    </select>
              </div>
            </div>

            <% String nombreElegido=request.getParameter("clientes"); 
               int idcliente=verificacion.IDClienteporNombre(nombreElegido);
               String [] id=verificacion.IDProddeVentaCliente(idcliente);
            %>

      <input type="hidden" name="LoginEnviado" id="LoginEnviado" value="1" />
      <button type="submit" class="btn">Ver</button>
	
	<% if (logueado.getLoginEnv()==1) { %> <!-- Si fue presionado el botón Finalizar...-->
        <% } if (verificacion.CountVentasaCliente(idcliente)) { %>
        <td><h3>Ventas realizadas a <%=  nombreElegido   %></h3></td>
        <table id="tabla1">
          <tr>
            <td><h3><strong>ID</strong></h3></td>
            <td><h3><strong>Nombre Producto</strong></h3></td>
          </tr>
 
          <tr>
          <% for (int i = 0; i < id.length; i++) { %>
                      <td><h3><%= id[i] %></h3></td>
                    <% } %>
         </tr>

          <tr>
          <% for (int i = 0; i < id.length; i++) { %>
                      <td><h3><%= verificacion.NombreProdporID(id[i]) %></h3></td>
                    <% } %>
         </tr>

        </table>

        <%} else {%>
        <p> No hay ventas realizadas al cliente.</p>
        <% } %>


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
						<span class="brand" class="user-name" href="#">Bienvenido <%= user.getUsername() %></span>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Menú de usuario<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="nav-header">Vendedor</li>
							<li><a href="addclientev.jsp">Ingresar cliente</a></li>
							<li><a href="addventav.jsp">Ingresar venta</a></li>
							<li><a href="showsalesv.jsp"><b>Ver ventas a cliente</b></a></li>
							<li><a href="mysales.jsp">Mis ventas</a></li>
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