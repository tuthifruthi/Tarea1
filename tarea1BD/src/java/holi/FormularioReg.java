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
public class FormularioReg {
    private String nombre;
    private String username;
    private String rut;
    private String password;
    private String rpassword;
    private int RegistroEnviado;

public FormularioReg()
{
    nombre=null;
    username=null;
    password=null;
    rut=null;
    rpassword=null;
    RegistroEnviado=0;
}


public String getNombre() {return nombre;}
public String getUsername() {return username;}
public String getRut() {return rut;}
public String getPassword(){return password;}
public String getRPassword(){return rpassword;}
public int getRegEnviado(){return RegistroEnviado;}

public void setNombre(String nombre) {this.nombre=nombre;}
public void setUsername(String username) {this.username=username;}
public void setRut(String rut) {this.rut=rut;}
public void setPassword(String password) {this.password=password;}
public void setRPassword(String rpassword) {this.rpassword=rpassword;}
public void setRegEnviado(int RegistroEnviado) {this.RegistroEnviado=RegistroEnviado;}

}