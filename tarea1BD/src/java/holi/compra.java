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
public class compra {

    private int id_compra;
    private int monto_total;
    private String fecha;
    private String hora;
    
    public compra()
    {
        monto_total=0;
        id_compra=0;
        fecha=null;
        hora=null;
        
    }
    
    public String getFecha() {return fecha;}
    public int getID() {return id_compra;}
    public int getMonto() {return monto_total;}
    public String getHora() {return hora;}

    public void setFecha(String fecha){this.fecha=fecha;}
    public void setID(int id_compra){this.id_compra=id_compra;}
    public void setMonto(int monto_total){this.monto_total=monto_total;}
    public void setHora(String hora){this.hora=hora;}
    
}
