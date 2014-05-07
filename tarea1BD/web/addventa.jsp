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
    <jsp:useBean id="ventas" scope="page" class="holi.detalleventa" />
    <jsp:setProperty name="ventas" property="*" />
    <jsp:useBean id="productos" scope="page" class="holi.producto" />
    <jsp:setProperty name="productos" property="*" />
    <jsp:useBean id="verificacion" scope="page" class="holi.verificaciones" />

	<%
            usuario user = new usuario();
            new verificaciones().cargarUsuario(user,logueado.getUsername());

            verificacion.IDVenta(); //inserta en tabla Venta dejando el monto total, id_cliente, id_usuario con valor cero
            int idventa=verificacion.ObtenerIDVenta(); //busca el ID Venta en donde el monto total, id_cliente y id_usuario es cero
            String [] id=verificacion.IDInsertadoDetalleVenta(idventa);
            String [] names=verificacion.NombreClientes();
            String [] cant=verificacion.CantidadInsertadoDetalleVenta(idventa);
            int suma=0;
            String fechahoraventa=verificacion.FechaHoraVenta(idventa);
    %>

   <article class="container">
		<header>
			<h1>Ingresar Venta</h1>
	  </header>
	
		<!-- Formulario -->
		<form class="form-horizontal">
			<div class="modal-body">

				<fieldset>

					<div class="control-group">
              			<label class="control-label" for="select">Seleccione un cliente</label>
              		<div class="controls">
                		<select name="nombre" id="nombre">
                    <% for (int i = 0; i < names.length; i++) { %>
                      <option value="<%= names[i] %>"><%= names[i] %></option>
                    <% } %>
                    </select>
              			</div>
            		</div>

					<!-- ID Producto -->
					<div class="control-group">
						<label class="control-label" for="idproducto">ID Producto</label>
						<div class="controls">
							<input type="text" class="input-xlarge" name="id_producto" id="id_producto" />
						</div>
					</div>

					<hr />

					<!-- Cantidad -->
					<div class="control-group">
						<label class="control-label" for="cantidad">Cantidad</label>
						<div class="controls">
							<input type="text" class="input-xlarge" name="cantidad" id="cantidad" />
						</div>
					</div>

					<hr />

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

			<% String nombreElegido=request.getParameter("nombre");
			 %>
          <% if (nombreElegido == null || productos.getID() == null || productos.getCantidad() == null  || 
			        !(verificacion.IngresarDetalleVenta(productos.getID(),productos.getCantidad(), idventa))){ %>

			            <p>Por favor corregir información</p>

			        <!-- Si no ingresó alguno de los datos del formulario... -->

			            <% if (nombreElegido == null) { %>

			            <p class="text-small">Debes escoger un nombre<p>

			            <% } if (productos.getID() == null) { %>

			                <p class="text-small">Debes ingresar una contraseña</p>

			            <% } if(productos.getCantidad() == null) { %>

			                <p class="text-small">Debes ingresar el RUT del vendedor</p>

			            <% } %>

			        <% } else { %>
							<p>La venta fue agregada exitosamente.</p>
							<% String nombreProducto=verificacion.NombreProdporID(productos.getID());
							   int costoProducto=verificacion.CostoProdporID(productos.getID());
							   verificacion.IngresarVenta(idventa,,,costoProducto);
							%>
 				    <% } %>
				<% } %>


              </div>
			</article> <!-- /información formulario registro -->
			<h3><strong>Código Venta: #<%= idventa %></strong><h3>
            <h3><strong>Fecha/Hora Venta: </strong> <%= fechahoraventa %><h3>
            <h3><strong>Nombre Vendedor: </strong> <%=  %><h3>
            <h3><strong>RUT Vendedor: </strong> <%=  %><h3>
            <h3><strong>Nombre Cliente: </strong> <%=  %><h3>
            <h3><strong>RUT Cliente: </strong> <%=  %><h3>



           <table id="tabla1">
          <tr>
            <td><h3><strong>ID</strong></h3></td>
            <td><h3><strong>Nombre Producto</strong></h3></td>
            <td><h3><strong>Cantidad</strong></h3></td>
            <td><h3><strong>Precio</strong></h3></td>
          </tr>
 
          <tr>
            <%= productos.getID() %>
         </tr>

          <tr>
          <%= nombreProducto %>
         </tr>
 
         <tr>
            <%= productos.getCantidad() %>
         </tr>
 
         <tr>
            <%= costoProducto %>
         </tr>

        </table>
        
        <table id="tabla2">
          <tr>
            <td><h3><strong>MONTO VENTA</strong></h3></td>
            <td><h3><strong><%= costoProducto %></strong></h3></td>
          </tr>
        </table>
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
							<li class="nav-header">Administrador</li>
							<li><a href="addvendedor.html">Ingresar vendedor</a></li>
							<li><a href="addcliente.html">Ingresar cliente</a></li>
							<li><a href="adminprod.html">Administrar productos</b></a></li>
							<li><a href="addcompra.html">Ingresar compra</b></a></li>
							<li><a href="addventa.html"><b>Ingresar venta<b></a></li>
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
