/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package holi;

/**
 *
 * @author tuthifruthi
 */
public class producto {
    
    private String nombrep;
    private int id_producto;
    private int stock;
    private String descripcion;
    private String categoria;
    private int precio;
    
    public producto()
    {
        nombrep=null;
        id_producto=0;
        categoria=null;
        descripcion=null;
        precio=0;
        stock=0;
        
    }
    
    public String getNombreProd() {return nombrep;}
    public int getID() {return id_producto;}
    public int getStock() {return stock;}
    public String getCat() {return categoria;}
    public String getDescripcion() {return descripcion;}
    public int getPrecio() {return precio;}

    public void setNombreProd(String nombrep){this.nombrep=nombrep;}
    public void setID(int id_producto){this.id_producto=id_producto;}
    public void setStock(int stock){this.stock=stock;}
    public void setPrecio(int precio){this.precio=precio;}
    public void setCat(String categoria){this.categoria=categoria;}
    public void setDescripcion(String descripcion){this.descripcion=descripcion;}
}
