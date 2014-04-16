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
public class venta {
    
    private int id_venta;
    private int id_cliente;
    private int id_usuario;
    private int monto_total;
    private String fecha;
    private String hora;
    
    public venta()
    {
        fecha=null;
        hora=null;
        id_venta=0;
        id_cliente=0;
        id_usuario=0;
        
    }
    
    public String getFecha() {return fecha;}
    public int getIDC() {return id_cliente;}
    public int getIDU() {return id_usuario;}
    public int getIDV() {return id_venta;}
    public int getMonto() {return monto_total;}
    public String getHora() {return hora;}

    public void setFecha(String fecha){this.fecha=fecha;}
    public void setIDC(int id_cliente){this.id_cliente=id_cliente;}
    public void setIDU(int id_usuario){this.id_usuario=id_usuario;}
    public void setIDV(int id_venta){this.id_venta=id_venta;}
    public void setMonto(int monto_total){this.monto_total=monto_total;}
    public void setHora(String hora){this.hora=hora;}
    
}
