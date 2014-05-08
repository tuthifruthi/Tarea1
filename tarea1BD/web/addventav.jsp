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

	  <a data-toggle="modal" href="#add-prod"><p><img src="img/arrow-orange.png"> Agregar Productos</a></p>
  
        <input type="hidden" name="LoginEnviado" id="LoginEnviado" value="1" />
        <button type="submit" class="btn">Finalizar</button>

        <% if (logueado.getLoginEnv()==1) { %> <!-- Si fue presionado el botón Finalizar...-->
        <%      
                 String nombreVendedor=verificacion.NombreVendedorporUsername(user.getUsername());
                 String rutVendedor=verificacion.RUTVendedorPorUsername(user.getUsername());
                 String rutCliente=verificacion.RUTClientePorNombre(nombreElegido); 
        %>
           <% if(verificacion.IngresarVenta(idventa,verificacion.IDClientePorNombre(nombreElegido),IDVendedorporNombredeUsuario(user.getUsername()),costoProducto); && verificacion.CountProductos() && verificacion.CountClientes()) { %> <!-- Si la venta se agregó exitosamente...-->
           <article class="after-form">
             <div class="container">
             <p> La venta fue agregada exitosamente al sistema </p>
          </div>
        </article>

        <h3><strong>Información de la venta realizada</strong><h3>
      <h3><strong>Código Venta: #<%= idventa %></strong><h3>
            <h3><strong>Fecha/Hora Venta: </strong> <%= fechahoraventa %><h3>
            <h3><strong>Nombre Vendedor: </strong> <%= nombreVendedor %><h3>
            <h3><strong>RUT Vendedor: </strong> <%= rutVendedor %><h3>
            <h3><strong>Nombre Cliente: </strong> <%= nombreElegido %><h3>
            <h3><strong>RUT Cliente: </strong> <%= rutCliente %><h3>



           <table id="tabla1">
          <tr>
            <td><h3><strong>ID</strong></h3></td>
            <td><h3><strong>Nombre Producto</strong></h3></td>
            <td><h3><strong>Cantidad</strong></h3></td>
            <td><h3><strong>Precio</strong></h3></td>
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
 
         <tr>
                      <% for (int i = 0; i < id.length; i++) { %>
                      <td><h3><%= verificacion.NombreProdporID(id[i]) %></h3></td>
                    <% } %>
         </tr>
 
         <tr>
          <% for (int i = 0; i < id.length; i++) { %>
                      <td><h3><%= verificacion.CostoProdporID(id[i])*verificacion.CantPorID(id[i]) %></h3></td>
                      <% suma+=verificacion.CostoProdporID(id[i])*verificacion.CantPorID(id[i]) %>
                    <% } %>
         </tr>

        </table>
        
        <table id="tabla2">
          <tr>
            <td><h3><strong>MONTO VENTA</strong></h3></td>
            <td><h3><strong><%= suma %></strong></h3></td>
          </tr>
        </table>
                 
           <% } else { %>
       
             <p> Error! </p>

             <% } if(verificacion.CountProductos()==null) {<%
                <article class="after-form">
                <div class="container">
                   <p> No hay productos en el sistema! la venta  no puede realizarse </p>
                </div>
                </article>
                 <%} %>
                 <% } if(verificacion.CountClientes()==null) {<%
                <article class="after-form">
                <div class="container">
                   <p> No hay clientes en el sistema! la venta  no puede realizarse </p>
                </div>
                </article>
                 <%} %>
           <%} %>
       <%} %>

	
		<!-- Formulario para agregar productos a la venta-->
		<div class="modal hide fade" id="add-prod">
      <div class="modal-header">
        <a class="close" data-dismiss="modal">×</a>
        <h3>Agregar productos</h3>
      </div>
      
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

        <% String nombreElegido=request.getParameter("nombre"); %>
				<% if (productos.getID() == null || productos.getCantidad() == null || nombreElegido == null  || !(verificacion.IngresarDetalleVenta(productos.getID(),productos.getCantidad(), idventa))){ %>

			            <p>Por favor corregir información</p>

			        <!-- Si no ingresó alguno de los datos del formulario... -->

			            <% if (productos.getID() == null) { %>

			            <p class="text-small">Debes ingresar el ID del producto<p>

			            <% } if (productos.getCantidad() == null) { %>

			                <p class="text-small">Debes ingresar la cantidad requerida del producto.</p>

			            <% if (nombreElegido == null) { %>

                  <p class="text-small">Debes escoger un nombre<p>

			        <% } else { %>
							<p>El producto fue agregado exitosamente.</p>
				    <% } %>
				<% } %>
			    <% } %>
			    <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Agregar</button>
        </div>
    </div> <!-- /formulario agregar productos -->

		
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
              <li><a href="addclientev.html">Ingresar cliente</b></a></li>
              <li><a href="addventav.html"><b>Ingresar venta<b></a></li>
              <li><a href="showsalesv.html">Ver ventas a cliente</a></li>
              <li><a href="mysales.html">Mis ventas</a></li>
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
