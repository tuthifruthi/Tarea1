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
public class cliente {
    
    private String rut;
    private String nombre;
    private int id_cliente;
    
    public cliente()
    {
        rut=null;
        nombre=null;
        id_cliente=0;
        
    }
    
    public String getRut() {return rut;}
    public int getID() {return id_cliente;}
    public String getNombre() {return nombre;}

    public void setNombre(String nombre){this.nombre=nombre;}
    public void setID(int id_cliente){this.id_cliente=id_cliente;}
    public void setRut(String rut){this.rut=rut;}
    
}
