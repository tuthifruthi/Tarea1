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
public class Login {
    private String username;
    private String nombre;
    private String password;
    private int id;
    private int LoginEnviado;
    private String rpassword;
    private String rut;
    
    public Login()
    {
        username=null;
        password=null;
        nombre=null;
        id=0;
        LoginEnviado=0;
        rpassword=null;
        rut=null;
    }
    
    
    public String getUsername(){return username;}
    public String getNombre(){return nombre;}
    public String getRUT(){return rut;}
    public String getPassword(){return password;}
    public String getRPassword(){return rpassword;}
    public int getID(){return id;}
    public int getLoginEnv(){return LoginEnviado;}
    
    public void setUsername(String username){this.username=username;}
    public void setNombre(String nombre){this.nombre=nombre;}
    public void setRUT(String rut){this.rut=rut;}
    public void setPassword(String password){this.password=password;}
    public void setRPassword(String rpassword){this.rpassword=rpassword;}
    public void setID(int id){this.id=id;}
    public void setLoginEnv(int LoginEnviado){this.LoginEnviado=LoginEnviado;}
    
}
