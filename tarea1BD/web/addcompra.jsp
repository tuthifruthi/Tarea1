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
    <jsp:useBean id="compras" scope="page" class="holi.detallecompra" />
    <jsp:setProperty name="compras" property="*" />
	<%
            usuario user = new usuario();
            new verificaciones().cargarUsuario(user,logueado.getNombre());

            int suma=0;
            String [] id;
            String [] cant;
            String [] precio;

    %>

   <article class="container">
		<header>
			<h1>Ingresar Compra</h1>
	  </header>



	  <a data-toggle="modal" href="#add-prod"><p><img src="img/arrow-orange.png"> Agregar Productos</a></p>

        <table>
          <tr>
            <td><h3><strong>ID</strong></h3></td>
            <td><h3><strong>Cantidad</strong></h3></td>
            <td><h3><strong>Precio</strong></h3></td>
          </tr>
 
         <tr>
          <% for (int i = 0; i < id.length; i++) { %>
                      <td><h3><%= id[i] %></h3></td>
                    <% } %>
         </tr>
 
         <tr>
            <% for (int i = 0; i < cant.length; i++) { %>
                      <td><h3><%= cant[i] %></h3></td>
                      <% } %>
         </tr>
 
         <tr>
            <% for (int i = 0; i < precio.length; i++) { %>
                      <td><h3><%= precio[i] %></h3></td>
                      <% } %>
         </tr>

        </table>

        <% for (int i = 0; i < precio.length; i++) { %>
                  <% suma+=precio[i] %>
            <% } %>

        <table>
        	<tr>
            <tr>
            <td><h3><strong>MONTO TOTAL</strong></h3></td>
            <td><h3><strong><%= suma %></strong></h3></td>
            </tr>
        </table>

	
		<!-- Formulario para agregar productos a la compra-->
		<div class="modal hide fade" id="add-prod">
      <div class="modal-header">
        <a class="close" data-dismiss="modal">×</a>
        <h3>Agregar productos</h3>
      </div>
      
        <div class="modal-body">

				<fieldset>
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
					
					<!-- Precio -->
					<div class="control-group">
						<label class="control-label" for="precio">Precio</label>
						<div class="controls">
							<input type="text" class="input-xlarge" name="precio" id="precio" />
						</div>
            </div>
          </fieldset>       
        </div>
				<% if (compras.getIDProducto() == null || compras.getCantidad() == null || compras.getPrecio() == null  || !(verificacion.IngresarDetalleCompra(compras.getIDProducto(),compras.getCantidad(),compras.getPrecio()) || !(verificacion.IDProdExiste(compras.getIDProducto()))){ %>

			            <p>Por favor corregir información</p>

			        <!-- Si no ingresó alguno de los datos del formulario... -->

			            <% if (compras.getIDProducto() == null) { %>

			            <p class="text-small">Debes ingresar el ID del producto<p>

			            <% } if (compras.getCantidad() == null) { %>

			                <p class="text-small">Debes ingresar la cantidad requerida del producto.</p>

			            <% } if(compras.getPrecio() == null) { %>

			                <p class="text-small">Debes ingresar el costo del producto. </p>

							<% } if(!(verificacion.IDProdExiste(compras.getIDProducto()))) { %>

					            <p class="text-small">El ID indicado no existe en el sistema.</p>

			            <% } %>

			        <% } else { %>
							<p>La compra fue agregada exitosamente.</p>
				    <% } %>
				<% } %>
			    <% } %>
			    <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Agregar</button>
          //poner algo aca para refrescar la pagina addcompra.jsp cada vez que se agregue un nuevo producto
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
						<span class="brand" class="user-name" href="#">Bienvenido <%= user.getNombre() %></span>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Menú de usuario<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="nav-header">Administrador</li>
							<li><a href="addvendedor.html">Ingresar vendedor</a></li>
							<li><a href="addcliente.html">Ingresar cliente</a></li>
							<li><a href="adminprod.html">Administrar productos</b></a></li>
							<li><a href="addcompra.html"><b>Ingresar compra</b></a></li>
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
