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
          <%= verificacion.IDProd() %>
         </tr>
 
         <tr>
           <%= verificacion.NombreProd() %>
         </tr>
 
         <tr>
           <%= verificacion.StockProd() %>
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
                <input type="number" class="input-xlarge" name="id_producto" id="id_producto" />
              </div>
            </div>
            
            
            <div class="control-group">
              <label class="control-label" for="nombrep">Nombre Producto</label>
              <div class="controls">
                <input type="text" class="input-xlarge" name="nombrep" id="nombrep" />
              </div>
            </div>
            
            
            <div class="control-group">
              <label class="control-label" for="descripcion">Descripcion</label>
              <div class="controls">
                <input type="text" class="input-xlarge" name="descripcion" id="descripcion" />
              </div>
            </div>
            
            
            <div class="control-group">
              <label class="control-label" for="categoria">Categoria</label>
              <div class="controls">
                <input type="text" class="input-xlarge" name="categoria" id="categoria" />
              </div>
            </div>
            

            <div class="control-group">
              <label class="control-label" for="stock">Cantidad</label>
              <div class="controls">
                <input type="number" class="input-xlarge" name="stock" id="stock" />
              </div>
            </div>
            
            
            <div class="control-group">
          <label class="control-label" for="precio">Precio</label>
              <div class="controls">
                <input type="number" class="input-xlarge" name="precio" id="precio" />
              </div>
            </div>
          </fieldset>       
        </div>

        <div class="modal-footer">
          <button type="submit" name="submit" class="btn btn-primary">Agregar</button>
        </div>
    </div> <!-- /formulario agregar productos -->
    
    
    
    <%
           String idproducto = request.getParameter("id_producto");
           String nombre= request.getParameter("nombrep");
           String descr=request.getParameter("descripcion");
           String cat=request.getParameter("categoria");
           String stock=request.getParameter("stock");
           String precio=request.getParameter("precio");
           int stockprod=Integer.parseInt(stock);
           int precioprod=Integer.parseInt(precio);
           int idprodu=Integer.parseInt(idproducto);
        %>
        <% if(request.getParameter("submit")!=null) { %>
					 <% if ((nombre== null) || (idprodu == 0) || (cat == null) || (descr == null) || (stockprod == 0) || (precioprod == 0) || 
				        (verificacion.IDProdExiste(idprodu))) {%>

				            <p>Por favor corregir informacion</p>

				        <!-- Si no ingresó alguno de los datos del formulario... -->

				            <% if (nombre == null) { %>

				            <p class="text-small">Debes ingresar el nombre del producto<p>

				            <% } if(idprodu == 0) { %>

				                <p class="text-small">Debes ingresar el ID del producto</p>

				            <% } if(cat == null) { %>

				                <p class="text-small">Debes ingresar la categoría</p>

				            <% } if(descr == null) { %>

				                <p class="text-small">Debes ingresar la descripción</p>

				            <% } if(stockprod == 0) { %>

				                <p class="text-small">Debes ingresar el stock</p>

				             <%  if(precioprod==0) { %>

				                <p class="text-small">Debes ingresar el costo del producto</p>

				            <% } if(verificacion.IDProdExiste(idprodu)) { %>

					            <p class="text-small">El ID ingresado ya existe en el sistema</p>

				            <% } %>

				        <% } else { %>
                                        
                                        <%   
                                                verificacion.AgregarProd(idprodu,stockprod,precioprod,cat,descr,nombre);
                                        %>
								<p>El producto fue agregado correctamente al sistema.</p>
					    <% } %> 
					     <% } %> 
                                             <% } %>


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
                      <option value="<%= verificacion.NombreProd() %>"><%= verificacion.NombreProd() %></option>
      
                    </select>
              </div>
            </div>

            <% String nombreElegido=request.getParameter("producto");
               String descripcion=verificacion.DescripcionProdporNombre(nombreElegido);
               String categoria=verificacion.CatProdporNombre(nombreElegido);
               Integer costo=verificacion.CostoProdporNombre(nombreElegido);
               Integer idprod=verificacion.IDProdporNombre(nombreElegido);
               Integer cantidad=verificacion.CantProdporNombre(nombreElegido);

            %>

            <div class="control-group">
              <label class="control-label" for="descripcion">Descripcion</label>
              <div class="controls">
                <input value="<%= descripcion %>" type="text" class="input-xlarge" name="descr" id="descripcion" />
              </div>
            </div>
            
            
            <div class="control-group">
              <label class="control-label" for="categoria">Categoria</label>
              <div class="controls">
                <input value="<%= categoria %>" type="text" class="input-xlarge" name="cat" id="categoria" />
              </div>
            </div>

          <div class="control-group">
          <label class="control-label" for="precio">Precio</label>
              <div class="controls">
                <input value="<%= costo %>" type="number" class="input-xlarge" name="costo" id="precio" />
              </div>
            </div>

            <div class="control-group">
              <label class="control-label" for="id_producto">ID Producto</label>
              <div class="controls">
                <input value="<%= idprod %>" type="number" class="input-xlarge" name="id_producto" id="id_producto" readonly="readonly" />
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
                <input value="<%= cantidad %>" type="number" class="input-xlarge" name="stock" id="stock" readonly="readonly" />
              </div>
            </div>
          
          </fieldset>       
        </div>

        <div class="modal-footer">
          <input type="hidden" name="LoginEnviado" id="LoginEnviado" value="1" />
          <button type="submit" name="submit" class="btn btn-primary">Guardar cambios</button>
        </div>

       <%
            String descrnueva=request.getParameter("descr");
            String catnueva=request.getParameter("cat");
            String precion=request.getParameter("costo");
            int precionuevo=Integer.parseInt(precion);
          
        %>
        
        <% if (request.getParameter("submit")!=null) { %>
        <%  if ((descrnueva == null) || (catnueva == null)  || (precionuevo == 0)) {%>

                    <p>Por favor corregir informacion</p>

                <!-- Si no ingresó alguno de los datos del formulario... -->

                    <% if (descrnueva == null) { %>

                    <p class="text-small">Debes ingresar la descripcion del producto<p>

                    <% } if(catnueva== null) { %>

                        <p class="text-small">Debes ingresar la categoria del producto</p>

                    <% } if(precionuevo == 0) { %>

                      <p class="text-small">Debes ingresar el precio del producto</p>

                    <% } %>

                <% } else { %>
                <%  
                    verificacion.EditProd(descrnueva,catnueva,precionuevo,idprod); %>
                <p>El producto fue modificado exitosamente.</p>
              <% } %> 
         <% } %>   

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
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Menu de usuario<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="nav-header">Administrador</li>
							<li><a href="addvendedor.jsp">Ingresar vendedor</a></li>
							<li><a href="addcliente.jsp">Ingresar cliente</a></li>
							<li><a href="adminprod.jsp"><b>Administrar productos</b></a></li>
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
