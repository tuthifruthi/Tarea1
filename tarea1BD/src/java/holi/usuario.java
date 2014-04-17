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
public class usuario {
    
    private String nombre_usuario;
    private String nombre;
    private int id_usuario;
    private String rut;
    private int comision;
    
    public usuario()
    {
        nombre_usuario=null;
        nombre=null;
        id_usuario=0;
        rut=null;
        comision=0;
        
    }
    
    public String getUsername() {return nombre_usuario;}
    public String getNombre() {return nombre;}
    public int getID() {return id_usuario;}
    public String getRut() {return rut;}
    public int getComision() {return comision;}

    public void setUsername(String nombre_usuario){this.nombre_usuario=nombre_usuario;}
    public void setNombre(String nombre){this.nombre=nombre;}
    public void setRut(String rut){this.rut=rut;}
    public void setID(int id_usuario){this.id_usuario=id_usuario;}
    public void setComision(int comision){this.comision=comision;}
    
}
