<%-- 
    Document   : index
    Created on : Apr 14, 2014, 7:42:36 AM
    Author     : tuthifruthi
--%>

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
	<style>
		.after-form {
			margin: 0;
			padding: 20px 0;
			text-transform: uppercase;
			
		}
		
		.after-form p {
			margin: 0;
			text-align: center;
		}
	</style>
  </head>

  <body class="home" onLoad=redireccionar()">
    <%@page import="java.sql.*" %>
    
    <!-- FORMULARIO INICIO SESION -->
    <jsp:useBean id="login" scope="page" class="holi.Login" />
    <jsp:useBean id="logueado" scope="application" class="holi.Login" />
    <jsp.setProperty name="login" property="*" />
    
    <!-- FORMULARIO REGISTRO -->
    <jsp:useBean id="registro" scope="page" class="holi.FormularioReg" />
    <jsp.setProperty name="registro" property="*" />
    
    <!-- VALIDAR DATOS INGRESADOS -->
    <jsp:useBean id="verificacion" scope="page" class="holi.verificaciones" />
    
	<!-- Barra de navegación -->
    <div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
			
				<a class="brand" href="#">Pepe's Work</a>
				
				<!-- Formulario -->
				<form class="navbar-form pull-right">
					<input type="text" name="username" class="input-medium" placeholder="Nombre de usuario">
					<input type="password" name="password" class="input-medium" placeholder="Contrasena">
					
                                        <input type="hidden" name="LoginEnviado" id="LoginEnviado" value="1" />
                                        <button type="submit" class="btn">Entrar</button>
				</form>
			</div> <!-- /container -->
		</div> <!-- /navbar-inner -->
    </div> <!-- /navbar -->
	
	<!-- Ventana modular -->
	<div class="modal hide fade" id="modal-register">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>Formulario de registro</h3>
		</div>
		
		<!-- Formulario de registro -->
		<form class="form-horizontal">
			<div class="modal-body">
				
					<!-- Datos personales -->
					<fieldset>
						<!-- Nombres -->
						<div class="control-group">
							<label class="control-label" for="nombres">Nombre</label>
							<div class="controls">
								<input type="text" class="input-xlarge" name="nombre" id="nombres" />
							</div>
						</div>
						
						<!-- Fecha de nacimiento -->
						<div class="control-group">
							<label class="control-label" for="nacimiento">RUT</label>
							<div class="controls">
								<input type="text" class="input-xlarge" name="rut" id="rut" />
								<p class="help-block">Ejemplo: 17671428k</p>
							</div>
						</div>
					</fieldset>
					<hr />
					
					<!-- Datos de la cuenta -->
					<fieldset>
						<!-- Nombre de usuario -->
						<div class="control-group">
							<label class="control-label" for="username">Nombre de usuario</label>
							<div class="controls">
								<input type="text" class="input-xlarge" name="username" id="username" />
							</div>
						</div>
						
						<!-- Contraseña -->
						<div class="control-group">
							<label class="control-label" for="password">Contrasena</label>
							<div class="controls">
								<input type="text" class="input-xlarge" name="password" id="password" />
							</div>
						</div>
						
						<!-- Repite contraseña -->
						<div class="control-group">
							<label class="control-label" for="rpassword">Repite contrasena</label>
							<div class="controls">
								<input type="text" class="input-xlarge" name="rpassword" id="rpassword" />
							</div>
						</div>
                                                <input type="hidden" name="RegistroEnviado" id="RegistroEnviado" value="1" />
					</fieldset>
				
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-primary">Registrarse</button>
			</div>
		</form>
	</div> <!-- /modal-register -->
	
	<!-- Header -->
	<header>
	    <div class="container">
		    <div class="hero-unit">
				    <h1>Bienvenido a Pepe's Work!</h1>
				    <p>Sistema de ingreso de ventas e inventario.</p>
				    <p><a class="btn btn-green btn-large" style="width:250px;" data-toggle="modal" href="#modal-register">Registrarse en el sistema</a></p>
			</div> <!-- /hero-unit -->
	    </div> <!-- /container -->
	</header>
   
   <% if (login.getLoginEnv()==1) { %> <!-- Si el usuario se logueo...-->
   <article class="after-form">
       <div class="container">
           <% if(verificacion.CargarUser(login.getUsername(),login.getPassword())) { %> <!-- Si el usuario existe dentro del sistema...-->
             <% if(verificacion.UserEsAdmin(login.getUsername())) { %> <!-- Si el usuario es admin...-->
                <%
                 logueado.setUsername(login.getUsername());
                 logueado.setID(verificacion.CargarID(login.getUsername()));
                 %>
                 <jsp:forward page="admin.jsp" />
                 
             <% } else { %> <!-- Si no, es vendedor...-->
             <%
                 logueado.setUsername(login.getUsername());
                 logueado.setID(verificacion.CargarID(logueado.getUsername()));
             %>
             
             <jsp:forward page="vendedor.jsp" />
                 
           <% } %>
           <% } else { %>
       
       <p> El nombre de usuario y/o la contraseña son incorrectos </p>
       
       <%{ %>
       
       <% if(registro.getRegEnviado() ==1) {%>  <!-- Si el usuario se ha registrado...-->
       <article class="after-form">
           <div class="container">
    
               
               
               
    <!-- AQUI QUEDE...-->           
               
               
               
               
    <!-- Footer -->
    <footer>
    	<div class="container">
    		<p>© 2014 Pepe's Work.</p>
    	</div>
    </footer>

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

  </body>
</html>