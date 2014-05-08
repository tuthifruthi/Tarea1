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
    <jsp:useBean id="verificacion" scope="page" class="holi.verificaciones" />

    <!-- creo un objeto 'producto' -->
    <jsp:useBean id="producto" scope="page" class="holi.producto" />

	<!-- asigno los datos a cada variable del objeto -->
	<jsp:setProperty name="producto" property="*" />
        
	<%
            usuario user = new usuario();
            new verificaciones().cargarUsuario(user,logueado.getUsername());

            String [] id = verificacion.IDProd();
            String [] names = verificacion.NombreProd();
            String [] cant = verificacion.StockProd();
    %>

   <article class="container">
		<header>
			<h1>Administrar Productos</h1>
	  </header>
	      <h3> Lista productos existentes </h3>
        <table>
          <tr>
            <td><h3><strong>ID</strong></h3></td>
            <td><h3><strong>Nombre</strong></h3></td>
            <td><h3><strong>Cantidad</strong></h3></td>
          </tr>
 
         <tr>
          <% for (int i = 0; i < id.length; i++) { %>
                      <td><h3><%= id[i] %></h3></td>
                    <% } %>
         </tr>
 
         <tr>
            <% for (int i = 0; i < names.length; i++) { %>
                      <td><h3><%= names[i] %></h3></td>
                      <% } %>
         </tr>
 
         <tr>
            <% for (int i = 0; i < cant.length; i++) { %>
                      <td><h3><%= cant[i] %></h3></td>
                      <% } %>
         </tr>
        </table>

        <a data-toggle="modal" href="#add-prod"><p><img src="img/arrow-orange.png"> Agregar Productos</a></p>
        <a data-toggle="modal" href="#edit-prod"><p><img src="img/arrow-orange.png"> Editar Productos</a></p>
		<br></br>


   <!-- Agregar Productos -->

   <div class="modal hide fade" id="add-prod">
      <div class="modal-header">
        <a class="close" data-dismiss="modal">×</a>
        <h3>Agregar productos</h3>
      </div>
      
        <div class="modal-body">
          
          <fieldset>
            <div class="control-group">
              <label class="control-label" for="id_producto">ID Producto</label>
              <div class="controls">
                <input type="text" class="input-xlarge" name="id_producto" id="id_producto" />
              </div>
            </div>
            
            
            <div class="control-group">
              <label class="control-label" for="nombrep">Nombre Producto</label>
              <div class="controls">
                <input type="text" class="input-xlarge" name="nombrep" id="nombrep" />
              </div>
            </div>
            
            
            <div class="control-group">
              <label class="control-label" for="descripcion">Descripción</label>
              <div class="controls">
                <input type="text" class="input-xlarge" name="descripcion" id="descripcion" />
              </div>
            </div>
            
            
            <div class="control-group">
              <label class="control-label" for="categoria">Categoría</label>
              <div class="controls">
                <input type="text" class="input-xlarge" name="categoria" id="categoria" />
              </div>
            </div>
            

            <div class="control-group">
              <label class="control-label" for="stock">Cantidad</label>
              <div class="controls">
                <input type="text" class="input-xlarge" name="stock" id="stock" />
              </div>
            </div>
            
            
            <div class="control-group">
          <label class="control-label" for="precio">Precio</label>
              <div class="controls">
                <input type="text" class="input-xlarge" name="precio" id="precio" />
              </div>
            </div>
          </fieldset>       
        </div>
					 <% if (producto.getNombreProd() == null || producto.getID() == 0  || producto.getCat() == null || producto.getDescripcion() == null || producto.getStock() == 0 || producto.getPrecio() == 0 || 
				        (verificacion.IDProdExiste(producto.getID()) || 
 !(verificacion.AgregarProd(producto.getID(),producto.getStock(),producto.getPrecio(),producto.getCat(), producto.getDescripcion(), producto.getNombreProd())))) { %>

				            <p>Por favor corregir información</p>

				        <!-- Si no ingresó alguno de los datos del formulario... -->

				            <% if (producto.getNombreProd() == null) { %>

				            <p class="text-small">Debes ingresar el nombre del producto<p>

				            <% } if(producto.getID() == 0) { %>

				                <p class="text-small">Debes ingresar el ID del producto</p>

				            <% } if(producto.getCat() == null) { %>

				                <p class="text-small">Debes ingresar la categoría</p>

				            <% } if(producto.getDescripcion() == null) { %>

				                <p class="text-small">Debes ingresar la descripción</p>

				            <% } if(producto.getStock() == 0) { %>

				                <p class="text-small">Debes ingresar el stock</p>

				             <%  if(producto.getPrecio() == 0) { %>

				                <p class="text-small">Debes ingresar el costo del producto</p>

				            <% } if(verificacion.IDProdExiste(producto.getID())) { %>

					            <p class="text-small">El ID ingresado ya existe en el sistema</p>

				            <% } %>

				        <% } else { %>
								<p>El producto fue agregado correctamente al sistema.</p>
					    <% } %> //cierre else
					     <% } %> //cierre if verificaciones

        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Agregar</button>
        </div>
    </div> <!-- /formulario agregar productos -->


<!-- Editar Productos -->

   <div class="modal hide fade" id="edit-prod">
      <div class="modal-header">
        <a class="close" data-dismiss="modal">×</a>
        <h3>Editar productos</h3>
      </div>
      
        <div class="modal-body">
          
          <fieldset>

            <div class="control-group">
              <label class="control-label" for="select">Seleccione un producto</label>
              <div class="controls">
                <select name="producto" id="producto">
                    <% for (int i = 0; i < names.length; i++) { %>
                      <option value="<%= names[i] %>"><%= names[i] %></option>
                    <% } %>
                    </select>
              </div>
            </div>

            <% String nombreElegido=request.getParameter("producto");
               String descr=verificacion.DescripcionProdporNombre(nombreElegido);
               String cat=verificacion.CatProdporNombre(nombreElegido);
               int costo=verificacion.CostoProdporNombre(nombreElegido);
               int idprod=verificacion.IDProdporNombre(nombreElegido);
               int cantidad=verificacion.CantProdporNombre(nombreElegido);

            %>

            <div class="control-group">
              <label class="control-label" for="descripcion">Descripción</label>
              <div class="controls">
                <input value="<%= descr %>" type="text" class="input-xlarge" name="descripcion" id="descripcion" />
              </div>
            </div>
            
            
            <div class="control-group">
              <label class="control-label" for="categoria">Categoría</label>
              <div class="controls">
                <input value="<%= cat %>" type="text" class="input-xlarge" name="categoria" id="categoria" />
              </div>
            </div>

          <div class="control-group">
          <label class="control-label" for="precio">Precio</label>
              <div class="controls">
                <input value="<%= costo %>" type="text" class="input-xlarge" name="precio" id="precio" />
              </div>
            </div>

            <div class="control-group">
              <label class="control-label" for="id_producto">ID Producto</label>
              <div class="controls">
                <input value="<%= idprod %>" type="text" class="input-xlarge" name="id_producto" id="id_producto" readonly="readonly" />
              </div>
            </div>


            <div class="control-group">
              <label class="control-label" for="nombrep">Nombre Producto</label>
              <div class="controls">
                <input value="<%= nombreElegido %>" type="text" class="input-xlarge" name="nombrep" id="nombrep" readonly="readonly"/>
              </div>
            </div>
            

            <div class="control-group">
              <label class="control-label" for="stock">Cantidad</label>
              <div class="controls">
                <input value="<%= cantidad %>" type="text" class="input-xlarge" name="stock" id="stock" readonly="readonly" />
              </div>
            </div>
          
          </fieldset>       
        </div>

        <div class="modal-footer">
          <input type="hidden" name="LoginEnviado" id="LoginEnviado" value="1" />
          <button type="submit" class="btn btn-primary">Guardar cambios</button>
        </div>


        <% if (producto.getDescripcion() == null || producto.getCat() == null  || producto.getPrecio() == 0 || 
                (verificacion.ClienteRepetido(logueado.getRUT()) || 
 !(verificacion.EditProd(producto.getDescripcion(),producto.getCat(),producto.getPrecio(),producto.getID())))) { %>

                    <p>Por favor corregir información</p>

                <!-- Si no ingresó alguno de los datos del formulario... -->

                    <% if (producto.getDescripcion() == null) { %>

                    <p class="text-small">Debes ingresar la descripción del producto<p>

                    <% } if(producto.getCat() == null) { %>

                        <p class="text-small">Debes ingresar la categoría del producto</p>

                    <% } if(producto.getPrecio() == 0) { %>

                      <p class="text-small">Debes ingresar el precio del producto</p>

                    <% } %>

                <% } else { %>
                <p>El producto fue modificado exitosamente.</p>
              <% } %> //cierre else

    </div> <!-- /formulario editar productos -->


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
							<li><a href="addvendedor.html">Ingresar vendedor</a></li>
							<li><a href="addcliente.html">Ingresar cliente</a></li>
							<li><a href="adminprod.html"><b>Administrar productos</b></a></li>
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
