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
public class detallecompra {

    private int id_compra;
    private int id_detalle;
    private int id_producto;
    private int cantidad;
    private int precio;
    
    public detallecompra()
    {
        id_compra=0;
        id_detalle=0;
		id_producto=0;
        cantidad=0;
		precio=0;
        
    }
    
    public int getIDProducto() {return id_producto;}
    public int getIDCompra() {return id_compra;}
    public int getIDDetalle() {return id_detalle;}
    public int getPrecio() {return precio;}
    public int getCantidad() {return cantidad;}

    public void setIDCompra(int id_compra){this.id_compra=id_compra;}
    public void setIDDetalle(int id_detalle){this.id_detalle=id_detalle;}
    public void setIDProducto(int id_producto){this.id_producto=id_producto;}
    public void setMonto(int precio){this.precio=precio;}
    public void setCantidad(int cantidad){this.cantidad=cantidad;}
    
}
