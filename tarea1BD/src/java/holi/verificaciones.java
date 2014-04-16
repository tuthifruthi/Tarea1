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
    
    public boolean ValidarRut(String rut)
    {
        boolean validacion=false;
        try
        {
            rut=rut.toUpperCase();
            rut=rut.replace(".", "");
            rut=rut.replace("-","");
            int rutAux=Integer.parseInt(rut.substring(0,rut.length()-1));
            
            char dv=rut.charAt(rut.length()-1);
            
            int m=0, s=1;
            for(; rutAux !=0; rutAux/=10)
            {
                s=(s+rutAux%10*(+-m++%6))%11;
            }
            if(dv==(char)(s!=0?s+47:75))
            {
                validacion=true;
            }
        }
        catch(java.lang.NumberFormatException e)
        {
        }
        catch(Exception e)
        {
        }
        return validacion;
    }
    
    
    public boolean IngresarUser(String rutpersona, String pass, String nombrep, String nombreusuario) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        query="INSERT INTO TUTHIFRUTHI.USUARIO (rut, contrasena, nombre, nombre_usuario) VALUES ('"+rutpersona+"','"+pass+"','"+nombrep+"','"+nombreusuario+"')";
        
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
    
    //COMPRUEBA SI EL NICK INGRESADO NO HA SIDO UTILIZADO
    public boolean NickUsado(String nombreuser) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
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
    
    //FUNCIONES DE CARGA DE COSAS
    public void CargarUsuario(usuario user, String nombreuser) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT rut, id_usuario, nombre, nombre_usuario, comision FROM TUTHIFRUTHI.USUARIO WHERE nombre_usuario='"+nombreuser+"'");
        
        if(set.next())
        {
            user.setUsername(set.getString("nombre_usuario"));
            user.setRut(set.getString("rut"));
            user.setID(set.getString("id_usuario"));
            user.setNombre(set.getString("nombre"));
            user.setComision(set.getInt("comision"));
        }
    }
    
    public boolean UserEsAdmin(String usuario) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT nombre_usuario FROM TUTHIFRUTHI.USUARIO WHERE nombre_usuario='"+usuario+"'");
        
        while(set.next())
        {
            if(set.getString("nombre_usuario").equals("Administrador"))
                return true;
            else
                return false;
        }
        return false;
    }
    
    public void CargarProductos(producto prod, int idprod) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_producto, nombre, stock FROM TUTHIFRUTHI.PRODUCTO WHERE id_producto='"+idprod+"'");
        
        if(set.next())
        {
            prod.setID(set.getInt("id_producto"));
            prod.setNombreProd(set.getString("nombre"));
            prod.setStock(set.getInt("stock"));
        }
    }
    
    public void CargarClientes(cliente customer, String rutcliente ) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT rut, id_usuario, nombre FROM TUTHIFRUTHI.CLIENTE WHERE rut='"+rutcliente+"'");
        
        if(set.next())
        {
            customer.setRut(set.getString("rut"));
            customer.setID(set.getInt("id_cliente"));
            customer.setNombre(set.getString("nombre"));
        }
    }
    

    
    public void CargarCompras(compra comprap, int idcompra) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT fecha, id_compra, monto_total, hora FROM TUTHIFRUTHI.COMPRA WHERE id_compra='"+idcompra+"'");
        
        if(set.next())
        {
            comprap.setFecha(set.getString("fecha"));
            comprap.setID(set.getInt("id_compra"));
            comprap.setMonto(set.getInt("monto_total"));
            comprap.setHora(set.getString("hora"));
        }
    }
    
    public void CargarVentas(venta ventas, int idventa) throws Exception
    {
         String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("SELECT id_venta, id_usuario, id_cliente, fecha, monto_total, hora FROM TUTHIFRUTHI.VENTA WHERE id_venta='"+idventa+"'");
        
        if(set.next())
        {
            ventas.setIDV(set.getInt("id_venta"));
            ventas.setIDU(set.getInt("id_usuario"));
            ventas.setIDC(set.getInt("id_compra"));
            ventas.setMonto(set.getInt("monto_total"));
            ventas.setHora(set.getString("hora"));
            ventas.setFecha(set.getString("fecha"));
        }
    }
    
    //FUNCIONES DE INGRESO DE COSAS
    
    public boolean IngresarCompra(int idcompra, int monto, String fech, String hour) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        query="INSERT INTO TUTHIFRUTHI.COMPRA (id_compra,monto_total,fecha,hora) VALUES ('"+idcompra+"','"+monto+"','"+fech+"','"+hour+"')";
        
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
    
    public void IngresarVendedor(String rutuser) throws Exception
    {   
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        Statement holi=c.createStatement();
        ResultSet set=holi.executeQuery("UPDATE TUTHIFRUTHI.USUARIO SET tipo='Vendedor' WHERE rut='"+rutuser+"'"); //modifica el tipo de usuario
    }
    
    public boolean IngresarVenta(int idventa, int idcliente, int idusuario, int monto, String fech, String hour) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        query="INSERT INTO TUTHIFRUTHI.VENTA (id_venta,id_usuario,id_cliente,monto_total,fecha,hora) VALUES ('"+idventa+"','"+idcliente+"','"+idusuario+"','"+monto+"','"+fech+"','"+hour+"')";
        
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
    
    public boolean IngresarCliente(String rutC, int idcliente, String nombreC) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
        String password="mariaj";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection c;
        c=DriverManager.getConnection(db,username,password); //conexion a bd
        
        String query;
        query="INSERT INTO TUTHIFRUTHI.CLIENTE (rut,nombre,id_cliente) VALUES ('"+rutC+"','"+nombreC+"','"+idcliente+"')";
        
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
        String username="TUTHIFRUTHI";
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
        String username="TUTHIFRUTHI";
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
    
    public String BuscarProdPorNombr(String nombr) throws Exception
    {
        String db="jdbc:oracle:thin:@localhost:1521:XE";
        String username="TUTHIFRUTHI";
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
    
}