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
    private String password;
    private String id;
    private int LoginEnviado;
    
    
    public Login()
    {
        username=null;
        password=null;
        id=null;
        LoginEnviado=0;
    }
    
    
    public String getUsername(){return username;}
    public String getPassword(){return password;}
    public String getID(){return id;}
    public int getLoginEnv(){return LoginEnviado;}
    
    public void setUsername(String username){this.username=username;}
    public void setPassword(String password){this.password=password;}
    public void setID(String id){this.id=id;}
    public void setLoginEnv(int LoginEnviado){this.LoginEnviado=LoginEnviado;}
    
}
