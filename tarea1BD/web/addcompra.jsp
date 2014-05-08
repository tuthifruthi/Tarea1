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
    <jsp:useBean id="compras" scope="page" class="holi.detallecompra" />
    <jsp:useBean id="verificacion" scope="page" class="holi.verificaciones" />
    <jsp:setProperty name="compras" property="*" />
	<%
            usuario user = new usuario();
            new verificaciones().cargarUsuario(user,logueado.getUsername());

            verificacion.IDCompra(); //inserta en tabla Compra dejando el monto total con valor cero
            int idcompra=verificacion.ObtenerIDCompra(); //busca el ID Compra en donde el monto total es cero
            String [] id=verificacion.IDInsertadoDetalleCompra(idcompra);
            String [] names=null;
            String [] cant=verificacion.CantidadInsertadoDetalleCompra(idcompra);
            String [] precio=verificacion.PrecioInsertadoDetalleCompra(idcompra);
            int suma=0;
            String fechahoracompra=verificacion.FechaHoraCompra(idcompra);

    %>

   <article class="container">
		<header>
			<h1>Ingresar Compra</h1>
	  </header>

	  <a data-toggle="modal" href="#add-prod"><p><img src="img/arrow-orange.png"> Agregar Productos</a></p>
  
        <input type="hidden" name="LoginEnviado" id="LoginEnviado" value="1" />
        <button type="submit" class="btn">Finalizar</button>

        <% if (logueado.getLoginEnv()==1) { %> <!-- Si fue presionado el botón Finalizar...-->

           <% if(verificacion.IngresarCompra(suma, idcompra) && verificacion.CountProductos()) { %> <!-- Si la compra se agregó exitosamente...-->
           <article class="after-form">
             <div class="container">
             <p> La compra fue agregada exitosamente al sistema </p>
          </div>
        </article>

        <h3><strong>Código Compra: #<%= idcompra %></strong><h3>
         <h3><strong>Fecha/Hora Compra: </strong> <%= fechahoracompra %><h3>
        <table id="tabla1">
          <tr>
            <td><h3><strong>ID</strong></h3></td>
            <td><h3><strong>Nombre Producto</strong></h3></td>
            <td><h3><strong>Cantidad</strong></h3></td>
            <td><h3><strong>Precio</strong></h3></td>
          </tr>
 
          <tr>
          <% for (int i = 0; i < id.length; i++) { %>
                  <% names[i]=verificacion.NombreProdporID(id[i]) %>
            <% } %>

          <% for (int i = 0; i < names.length; i++) { %>
                      <td><h3><%= names[i] %></h3></td>
                    <% } %>
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
        
        <table id="tabla2">
          <% for (int i = 0; i < precio.length; i++) { %>
                  <%= suma+=precio[i] %>
            <% } %>
          <tr>
            <td><h3><strong>MONTO TOTAL</strong></h3></td>
            <td><h3><strong><%= suma %></strong></h3></td>
          </tr>
        </table>
                 
           <% } else { %>
       
             <p> Error! </p>

           <%} %>
       <%} %>

	
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
				<% if ((compras.getIDProducto()) == 0 || (compras.getCantidad()) == 0 || (compras.getPrecio()) == 0  || !(verificacion.IngresarDetalleCompra(compras.getIDProducto(),compras.getCantidad(),compras.getPrecio(),idcompra) || !(verificacion.IDProdExiste(compras.getIDProducto())))){ %>

			            <p>Por favor corregir información</p>

			        <!-- Si no ingresó alguno de los datos del formulario... -->

			            <% if (compras.getIDProducto() == 0) { %>

			            <p class="text-small">Debes ingresar el ID del producto<p>

			            <% } if (compras.getCantidad() == 0) { %>

			                <p class="text-small">Debes ingresar la cantidad requerida del producto.</p>

			            <% } if(compras.getPrecio() == 0) { %>

			                <p class="text-small">Debes ingresar el costo del producto. </p>

							<% } if(!(verificacion.IDProdExiste(compras.getIDProducto()))) { %>

					            <p class="text-small">El ID indicado no existe en el sistema.</p>

			            <% } %>

			        <% } else { %>
							<p>La compra fue agregada exitosamente.</p>
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
						<span class="brand" class="user-name" href="#">Bienvenido Administrador</span>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Menú de usuario<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="nav-header">Administrador</li>
							<li><a href="addvendedor.jsp">Ingresar vendedor</a></li>
							<li><a href="addcliente.jsp">Ingresar cliente</a></li>
							<li><a href="adminprod.jsp">Administrar productos</b></a></li>
							<li><a href="addcompra.jsp"><b>Ingresar compra</b></a></li>
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
