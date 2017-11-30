/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package outros;

/**
 *
 * @author raphael
 */
public class Validacoes {
    
    
    public boolean validaCamposUsuario(String login ,String senha,String email,String nome){
        boolean result=false;
        if(("").equals(nome) || ("").equals(login)|| ("").equals(senha)|| ("").equals(email)){
            result=true;
        }
        return result;
    }
    
}
