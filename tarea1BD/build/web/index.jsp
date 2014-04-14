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

  <body class="home">

	<!-- Barra de navegación -->
    <div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
			
				<a class="brand" href="#">Pepe's Work</a>
				
				<!-- Formulario -->
				<form class="navbar-form pull-right">
					<input type="text" class="input-medium" placeholder="Nombre de usuario">
					<input type="password" class="input-medium" placeholder="Contraseña">
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
								<input type="text" class="input-xlarge" name="nombres" id="nombres" />
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
							<label class="control-label" for="password">Contraseña</label>
							<div class="controls">
								<input type="text" class="input-xlarge" name="password" id="password" />
							</div>
						</div>
						
						<!-- Repite contraseña -->
						<div class="control-group">
							<label class="control-label" for="rpassword">Repite contraseña</label>
							<div class="controls">
								<input type="text" class="input-xlarge" name="rpassword" id="rpassword" />
							</div>
						</div>
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