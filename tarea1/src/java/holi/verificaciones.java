/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package holi;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 *
 * @author tuthifruthi
 */
public class verificaciones {
    
    public String TEST;
    public verificaciones() throws SQLException
    {
        
    }
    
 
   public boolean RutExiste(String rutuser) throws Exception
   {
       	String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT rut FROM TUTHIFRUTHI.USUARIO WHERE rut='"+rutuser+"'");
        
        int contador=0; //para contar las coincidencias encontradas
        while(set.next()) //si hay usuarios repetidos, los cuenta
            contador++;
        if(contador==0)
            return false;
        else
            return true;
   }

   public boolean IDProdExiste(int idprod) throws Exception
   {
       	String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_producto FROM TUTHIFRUTHI.PRODUCTO WHERE id_producto='"+idprod+"'");
        
        int contador=0; //para contar las coincidencias encontradas
        while(set.next()) //si hay usuarios repetidos, los cuenta
            contador++;
        if(contador==0)
            return false;
        else
            return true;
   }

    //COMPRUEBA SI EL NICK INGRESADO NO HA SIDO UTILIZADO
    public boolean NickUsado(String nombreuser) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT nombre_usuario FROM TUTHIFRUTHI.USUARIO WHERE nombre_usuario='"+nombreuser+"'");
        
        int contador=0; //para contar las coincidencias encontradas
        while(set.next()) //si hay usuarios repetidos, los cuenta
            contador++;
        if(contador==0)
            return false;
        else
            return true;
    }

    public boolean EditProd(String descr, String cat, int precio, int idprod) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        query="UPDATE TUTHIFRUTHI.PRODUCTO SET descripcion='"+descr+"', categoria='"+cat+"', precio='"+precio+"' WHERE id_producto='"+idprod+"'";
        
        try{
            Statement holi=c.createStatement(); //para ejecutar la consulta
            holi.execute(query); 
        }
        catch(SQLException e)
        {
            return false;
        }
        
        return true;
    }

    public boolean ClienteRepetido(String rutuser) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT rut FROM TUTHIFRUTHI.CLIENTE WHERE rut='"+rutuser+"'");
        
        int contador=0; //para contar las coincidencias encontradas
        while(set.next()) //si hay clientes repetidos, los cuenta
            contador++;
        if(contador==0)
            return false;
        else
            return true;
    }
    
    //FUNCIONES DE CARGA DE COSAS
   public boolean CargarUser(String usuario, String passw) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT nombre_usuario FROM TUTHIFRUTHI.USUARIO WHERE nombre_usuario='"+usuario+"'AND contrasena='"+passw+"'");
        
        if(set != null)
                return true;
         return false;
    }
            
    public void cargarUsuario(usuario user, String nombreuser) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT rut, id_usuario, nombre, nombre_usuario, comision FROM TUTHIFRUTHI.USUARIO WHERE nombre='"+nombreuser+"'");
        
        if(set.next())
        {
            user.setUsername(set.getString("nombre_usuario"));
            user.setRut(set.getString("rut"));
            user.setID(set.getInt("id_usuario"));
            user.setNombre(set.getString("nombre"));
            user.setComision(set.getInt("comision"));
        }
    }
    
    public boolean UserEsAdmin(String usuario) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT tipo FROM TUTHIFRUTHI.USUARIO WHERE nombre_usuario='"+usuario+"'");
        
        while(set.next())
        {
            if(set.getString("tipo").equals("Administrador"))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        return false;
    }
    
    public boolean UserEsVendedor(String usuario) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT tipo FROM TUTHIFRUTHI.USUARIO WHERE nombre_usuario='"+usuario+"'");
        
        while(set.next())
        {
            if(set.getString("tipo").equals("Vendedor"))
                return true;
            else
                return false;
        }
        return false;
    }
    
    //FUNCIONES DE INGRESO DE COSAS

    public boolean IDCompra() throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        String query2;
        query="INSERT INTO TUTHIFRUTHI.COMPRA (monto_total) VALUES (0)";
   
        try{
            Statement holi=c.createStatement(); //para ejecutar la consulta
            holi.execute(query); //ejecuta la consulta de insertar usuario dentro de la tabla detallecompra
        }
        catch(SQLException e)
        {
            return false;
        }
        
        return true;
    }

    public boolean IDVenta() throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        String query2;
        query="INSERT INTO TUTHIFRUTHI.VENTA (monto_total, id_usuario, id_cliente) VALUES (0,0,0)";
   
        try{
            Statement holi=c.createStatement(); //para ejecutar la consulta
            holi.execute(query); //ejecuta la consulta de insertar usuario dentro de la tabla detallecompra
        }
        catch(SQLException e)
        {
            return false;
        }
        
        return true;
    }
    
    public boolean IngresarDetalleCompra(int idprod, int cant, int costo, int idcompra) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        String query2;
        query="INSERT INTO TUTHIFRUTHI.DETALLECOMPRA (id_producto,cantidad,precio,id_compra) VALUES ('"+idprod+"','"+cant+"','"+costo+"','"+idcompra+"')";
   
        try{
            Statement holi=c.createStatement(); //para ejecutar la consulta
            holi.execute(query); //ejecuta la consulta de insertar usuario dentro de la tabla detallecompra
        }
        catch(SQLException e)
        {
            return false;
        }
        
        return true;
    }

    public boolean IngresarDetalleVenta(int idprod, int cant, int idventa) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        String query2;
        query="INSERT INTO TUTHIFRUTHI.DETALLEVENTA (id_producto,cantidad,id_venta) VALUES ('"+idprod+"','"+cant+"','"+idventa+"')";
   
        try{
            Statement holi=c.createStatement(); //para ejecutar la consulta
            holi.execute(query); //ejecuta la consulta de insertar usuario dentro de la tabla detallecompra
        }
        catch(SQLException e)
        {
            return false;
        }
        
        return true;
    }

    public boolean IngresarCompra(int montototal, int idcompra) throws Exception
    {
	
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        query="UPDATE TUTHIFRUTHI.COMPRA SET monto_total='"+montototal+"' WHERE id_compra='"+idcompra+"'";
		try{
            Statement holi=c.createStatement(); //para ejecutar la consulta
            holi.execute(query); //ejecuta la consulta de insertar usuario dentro de la tabla compra
        }
        catch(SQLException e)
        {
            return false;
        }
        
        return true;
    }
    
    public boolean IngresarVendedor(String rutuser, String pass, String nombreuser, String user) throws Exception
    {   
	String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        query="INSERT INTO TUTHIFRUTHI.USUARIO (rut, contrasena, nombre, nombre_usuario, tipo, comision) VALUES ('"+rutuser+"','"+pass+"','"+nombreuser+"', '"+user+"','Vendedor','0')";
        
        try{
            Statement holi=c.createStatement(); //para ejecutar la consulta
            holi.execute(query); //ejecuta la consulta de insertar usuario dentro de la tabla usuario
        }
        catch(SQLException e)
        {
            return false;
        }
        
        return true;
    }
    
    public boolean IngresarVenta(int idventa, int idcliente, int idusuario, int monto) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        query="UPDATE TUTHIFRUTHI.VENTA SET monto_total='"+monto+"',id_usuario='"+idusuario+"',id_cliente='"+idcliente+"' WHERE id_venta='"+idventa+"'";
        try{
            Statement holi=c.createStatement(); //para ejecutar la consulta
            holi.execute(query); //ejecuta la consulta de insertar usuario dentro de la tabla compra
        }
        catch(SQLException e)
        {
            return false;
        }
        
        return true;
    }
    
    public boolean IngresarCliente(String rutC, String nombreC) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        query="INSERT INTO TUTHIFRUTHI.CLIENTE (rut,nombre) VALUES ('"+rutC+"','"+nombreC+"')";
        
        try{
            Statement holi=c.createStatement(); //para ejecutar la consulta
            holi.execute(query); //ejecuta la consulta de insertar usuario dentro de la tabla usuario
        }
        catch(SQLException e)
        {
            return false;
        }
        
        return true;
    }
    
    public boolean AgregarProd(int idprod, int cant, int costo, String cat, String descr, String nombreprod) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        query="INSERT INTO TUTHIFRUTHI.PRODUCTO (id_producto,nombrep,stock,descripcion,categoria,precio) VALUES ('"+idprod+"','"+nombreprod+"','"+cant+"','"+descr+"','"+cat+"','"+costo+"')";
        
        try{
            Statement holi=c.createStatement(); //para ejecutar la consulta
            holi.execute(query); //ejecuta la consulta de insertar usuario dentro de la tabla usuario
        }
        catch(SQLException e)
        {
            return false;
        }
        
        return true;
        
    } 
    
    //FUNCIONES DE BUSQUEDA
    public int BuscarProdPorID(int id) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT nombrep, id_producto FROM TUTHIFRUTHI.PRODUCTO WHERE id_producto='"+id+"'");
        
        while(set.next())
        {
            return set.getInt("id_producto");
        }        
        return 0;
    }

    public int ObtenerIDCompra() throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_compra FROM TUTHIFRUTHI.COMPRA WHERE monto_total=0");
        
        while(set.next()) 
        {
            return set.getInt("id_compra");
        }        
        return 0;
    }

    public int ObtenerIDVenta() throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_venta FROM TUTHIFRUTHI.VENTA WHERE monto_total=0 AND id_cliente=0 AND id_usuario=0");
        
        while(set.next()) 
        {
            return set.getInt("id_venta");
        }        
        return 0;
    }

    
    public int IDInsertadoDetalleCompra(int idcompra) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_producto FROM TUTHIFRUTHI.DETALLECOMPRA WHERE id_compra='"+idcompra+"'");
        
        while(set.next())
        {
            return set.getInt("id_producto");
        }        
        return 0;
    }

    public int IDInsertadoDetalleVenta(int idventa) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_producto FROM TUTHIFRUTHI.DETALLEVENTA WHERE id_venta='"+idventa+"'");
        
        while(set.next())
        {
            return set.getInt("id_producto");
        }        
        return 0;
    }

    public int PrecioInsertadoDetalleCompra(int idcompra) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT precio FROM TUTHIFRUTHI.DETALLECOMPRA WHERE id_compra='"+idcompra+"'");
        
        while(set.next())
        {
            return set.getInt("precio");
        }        
        return 0;
    }

    public int CantidadInsertadoDetalleCompra(int idcompra) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT cantidad FROM TUTHIFRUTHI.DETALLECOMPRA WHERE id_compra='"+idcompra+"'");
        
        while(set.next())
        {
            return set.getInt("cantidad");
        }        
        return 0;
    }

    public int CantidadInsertadoDetalleVenta(int idventa) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT cantidad FROM TUTHIFRUTHI.DETALLEVENTA WHERE id_venta='"+idventa+"'");
        
        while(set.next())
        {
            return set.getInt("cantidad");
        }        
        return 0;
    }

    public String BuscarProdPorNombr(String nombr) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT nombrep, id_producto FROM TUTHIFRUTHI.PRODUCTO WHERE nombrep='"+nombr+"'");
        
        while(set.next())
        {
            return set.getString("nombrep");
        }
        return "";
    }

//OBTENER DATOS DE TABLAS

    public int IDProd() throws Exception
    {
       String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_producto FROM TUTHIFRUTHI.PRODUCTO");

        while(set.next())
        {
            return set.getInt("id_producto");
        }
        return 0;
    }

    public String FechaHoraCompra(int idcompra) throws Exception
    {
       String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT fechahora FROM TUTHIFRUTHI.COMPRA WHERE id_compra='"+idcompra+"'");

        while(set.next())
        {
            return set.getString("fechahora");
        }
        return "";
    }

    public String FechaHoraVenta(int idventa) throws Exception
    {
       String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT fechahora FROM TUTHIFRUTHI.VENTA WHERE id_venta='"+idventa+"'");

        while(set.next())
        {
            return set.getString("fechahora");
        }
        return "";
    }


    public String NombreProd() throws Exception
    {      
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT nombrep FROM TUTHIFRUTHI.PRODUCTO");

        while(set.next())
        {
            return set.getString("nombrep");
        }
        return "";
        
    }

    public String NombreVendedorporUsername(String user) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT nombre FROM TUTHIFRUTHI.USUARIO WHERE nombre_usuario='"+user+"'");

        while(set.next())
        {
            return set.getString("nombre");
        }
        return "";
    }

    public String RUTVendedorPorUsername(String user) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT rut FROM TUTHIFRUTHI.USUARIO WHERE nombre_usuario='"+user+"'");

        while(set.next())
        {
            return set.getString("rut");
        }
        return "";
    }

    public String RUTClientePorNombre(String nombre) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT rut FROM TUTHIFRUTHI.CLIENTE WHERE nombre='"+nombre+"'");

        while(set.next())
        {
            return set.getString("rut");
        }
        return "";
    }

    public int IDClientePorNombre(String nombr) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_cliente FROM TUTHIFRUTHI.CLIENTE WHERE nombre='"+nombr+"'");
        
        while(set.next())
        {
            return set.getInt("id_cliente");
        }
        return 0;
    }

    public int IDProdporNombre(String nombr) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_producto FROM TUTHIFRUTHI.PRODUCTO WHERE nombrep='"+nombr+"'");
        
        while(set.next())
        {
            return set.getInt("id_producto");
        }
        return 0;
    }


    public int IDVendedorporUsername (String user) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_usuario FROM TUTHIFRUTHI.USUARIO WHERE nombre_usuario='"+user+"'");
        
        while(set.next())
        {
            return set.getInt("id_usuario");
        }
        return 0;
    }

    public int IDVendedorporNombredeUsuario(String nombr) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_usuario FROM TUTHIFRUTHI.USUARIO WHERE nombre_usuario='"+nombr+"'");
        
        while(set.next())
        {
            return set.getInt("id_usuario");
        }
        return 0;
    }

    public int IDProddeVenta(int idvendedor) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_producto FROM TUTHIFRUTHI.VENTA WHERE id_usuario='"+idvendedor+"'");
        
        while(set.next())
        {
            return set.getInt("id_producto");
        }
        return 0;
    }

    public String NombreProdporID(int idprod) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT nombrep FROM TUTHIFRUTHI.PRODUCTO WHERE id_producto='"+idprod+"'");
        
        while(set.next())
        {
            return set.getString("nombrep");
        }
        return "";
    }

    public int CantPorID(int id) throws Exception
    {
       String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT cantidad FROM TUTHIFRUTHI.DETALLEVENTA WHERE id_producto='"+id+"'");
        
        while(set.next())
        {
            return set.getInt("cantidad");
        }
        return 0;
    }

    public int CostoProdporNombre(String nombr) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT precio FROM TUTHIFRUTHI.PRODUCTO WHERE nombrep='"+nombr+"'");
        
        while(set.next())
        {
            return set.getInt("precio");
        }
        return 0;
    }

    public int CostoProdporID(int id) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT precio FROM TUTHIFRUTHI.PRODUCTO WHERE id_producto='"+id+"'");
        
        while(set.next())
        {
            return set.getInt("precio");
        }
        return 0;
    }

    public int CantProdporNombre(String nombr) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT stock FROM TUTHIFRUTHI.PRODUCTO WHERE nombrep='"+nombr+"'");
        
        while(set.next())
        {
            return set.getInt("stock");
        }
        return 0;
    }

    public String DescripcionProdporNombre(String nombr) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT descripcion FROM TUTHIFRUTHI.PRODUCTO WHERE nombrep='"+nombr+"'");
        
        while(set.next())
        {
            return set.getString("descripcion");
        }
        return "";
    }

    public String CatProdporNombre(String nombr) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT categoria FROM TUTHIFRUTHI.PRODUCTO WHERE nombrep='"+nombr+"'");
        
        while(set.next())
        {
            return set.getString("categoria");
        }
        return "";
    }

    public String NombreClientes() throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT nombre FROM TUTHIFRUTHI.CLIENTE");
        
        while(set.next())
        {
            return set.getString("nombre");
        }
        return "";
    }

    public int IDProddeVentaCliente(int idcliente) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_producto FROM TUTHIFRUTHI.VENTA WHERE id_cliente='"+idcliente+"'");
        
        while(set.next())
        {
            return set.getInt("id_producto");
        }
        return 0;
    }

    public int IDClienteporNombre(String nombrec) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_cliente FROM TUTHIFRUTHI.CLIENTE WHERE nombre='"+nombrec+"'");
        
        while(set.next())
        {
            return set.getInt("id_cliente");
        }
        return 0;
    }

    public int StockProd() throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT stock FROM TUTHIFRUTHI.PRODUCTO");

        while(set.next())
        {
            return set.getInt("stock");
        }
        return 0;
    }

//FUNCIONES DE CONTADORES
  public boolean CountProductos() throws Exception 
  {
    String db="jdbc:oracle:thin:@localhost:1521:XE";
    String username="SYSTEM";
    String password="mariaj";
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection c;
    c=DriverManager.getConnection(db,username,password); //conexion a bd
    
    Statement holi=c.createStatement();
    ResultSet set=holi.executeQuery("SELECT * FROM TUTHIFRUTHI.PRODUCTO");
    
    int contador=0; //para contar las coincidencias encontradas
    while(set.next()) //si hay productos, los cuenta
        contador++;
    if(contador==0)
        return false; //si no hay productos, retorna falso
    else
        return true; //si hay productos, retorna verdadero
  }

  public boolean CountVendedores() throws Exception 
  {
    String db="jdbc:oracle:thin:@localhost:1521:XE";
    String username="SYSTEM";
    String password="mariaj";
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection c;
    c=DriverManager.getConnection(db,username,password); //conexion a bd
    
    Statement holi=c.createStatement();
    ResultSet set=holi.executeQuery("SELECT * FROM TUTHIFRUTHI.USUARIO");
    
    while(set.next())
    {
        if(set.getString("tipo").equals("Vendedor"))
            return true; //si hay vendedores retorna verdadero
        else
            return false; //si no hay vendedores retorna falso
    }
    return false; //si no hay elementos, retorna falso
  }

public boolean CountVentas() throws Exception 
  {
    String db="jdbc:oracle:thin:@localhost:1521:XE";
    String username="SYSTEM";
    String password="mariaj";
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection c;
    c=DriverManager.getConnection(db,username,password); //conexion a bd

    Statement holi=c.createStatement();
    ResultSet set=holi.executeQuery("SELECT * FROM TUTHIFRUTHI.VENTA");

   	   int contador=0; //para contar las coincidencias encontradas
        while(set.next()) //si hay ventas, las cuenta
            contador++;
        if(contador==0)
            return false;
        else
            return true;
    }

public boolean CountClientes() throws Exception 
  {
    String db="jdbc:oracle:thin:@localhost:1521:XE";
    String username="SYSTEM";
    String password="mariaj";
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection c;
    c=DriverManager.getConnection(db,username,password); //conexion a bd

    Statement holi=c.createStatement();
    ResultSet set=holi.executeQuery("SELECT * FROM TUTHIFRUTHI.CLIENTE");

       int contador=0; //para contar las coincidencias encontradas
        while(set.next()) //si hay ventas, las cuenta
            contador++;
        if(contador==0)
            return false;
        else
            return true;
    }

    public boolean CountVentasporVendedor(int id) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT * FROM TUTHIFRUTHI.VENTA WHERE id_usuario='"+id+"'");
        
         int contador=0; //para contar las coincidencias encontradas
        while(set.next()) //si hay ventas, las cuenta
            contador++;
        if(contador==0)
            return false;
        else
            return true;
    }

     public boolean CountVentasaCliente(int id) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="SYSTEM";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT * FROM TUTHIFRUTHI.VENTA WHERE id_cliente='"+id+"'");
        
         int contador=0; //para contar las coincidencias encontradas
        while(set.next()) //si hay ventas, las cuenta
            contador++;
        if(contador==0)
            return false;
        else
            return true;
    }
    
}
