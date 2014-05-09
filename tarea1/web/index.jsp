<%-- 
    Document   : index
    Created on : May 8, 2014, 1:41:56 PM
    Author     : tuthifruthi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pepe's Work</title>
        <link href="css/style.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <rm: uppercase;
			
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
    
    <!-- VALIDAR DATOS INGRESADOS -->
    <jsp:useBean id="verificacion" scope="page" class="holi.verificaciones" />
    
	<!-- Barra de navegación -->
    <div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
			
				<a class="brand" href="#">Pepe's Work</a>
				
				<!-- Formulario -->
				<form class="navbar-form pull-right">
					<input type="text" name="username" id="username" class="input-medium" placeholder="Nombre de usuario">
					<input type="password" name="password" id="password" class="input-medium" placeholder="Contrasena">
					
                                        <input type="hidden" name="LoginEnviado" id="LoginEnviado" value="1" />
                                        <button type="submit" name="submit" class="btn">Entrar</button>
				</form>
			</div> <!-- /container -->
		</div> <!-- /navbar-inner -->
                
   <%  String nombreusuario=request.getParameter("username");
       String clave=request.getParameter("password");
   %>
    <% if (request.getParameter("submit")!=null) { %> <!-- Si el usuario se logueo...-->
                
   <article class="after-form">
       <div class="container">
           
           <% if((verificacion.CargarUser(nombreusuario, clave))==true) { %> <!-- Si el usuario existe dentro del sistema...-->
             <% if(verificacion.UserEsAdmin(nombreusuario)==true) { %> <!-- Si el usuario es admin...-->
                 <jsp:forward page="admin.jsp" />
                 
           
           <% } else { %>
             
             <jsp:forward page="vendedor.jsp" />
            
             
             <% } %>
             
             
           <% } else { %>
       
       <p> El nombre de usuario y/o la contraseña son incorrectos </p>
       
         <%} %>
        <%} %>
        
    </div> <!-- /navbar -->
	
	<!-- Header -->
	<header>
	    <div class="container">
		    <div class="hero-unit">
				    <h1>Bienvenido a Pepe's Work!</h1>
				    <p>Sistema de ingreso de ventas e inventario.</p>
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

